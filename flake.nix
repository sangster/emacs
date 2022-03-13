{
  inputs = {
    flake-utils = {
      url = github:numtide/flake-utils?rev=74f7e4319258e287b0f9cb95426c9853b282730b;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  description = "Emacs, with runtime dependencies";

  outputs = { nixpkgs, flake-utils, ... }:
    let
      overlay = final: prev: rec {
        sangster-emacs =
          let
            inherit (nixpkgs) lib;

            pname = "sangster-emacs";
            version = "2.3.0";

            deps = with final; {
              dired = [
                xdg-utils # Allow dired to xdg-open files.
              ];

              haskell = [
                cabal-install
                haskell-language-server # LSP
                haskellPackages.hlint # Flycheck
              ];

              # See https://magit.vc.
              magit = git-package: [ git-package ];

              markdown = [ multimarkdown ];

              # See https://www.djcbsoftware.nl/code/mu/mu4e.html.
              mu4e = [
                isync # IMAP client
                msmtp # SMTP client
                mu    # Mailbox indexer (See mu4e)
              ];

              nix = [
                rnix-lsp # LSP
                nix-linter # Flycheck
              ];

              # See https://orgmode.org.
              org-mode = jdk-package: lib.flatten [
                [
                  exiv2 # See emacs function (js:www:photography:process-image)
                  imagemagick # See emacs function (js:watermark-image)
                  proselint # Plain text linter

                  # Latex dependencies for org-mode export (to latex/pdf)
                  # See https://orgmode.org/worg/org-dependencies.html#orgaa275ba
                  # https://nixos.org/manual/nixpkgs/stable/#sec-language-texlive-user-guide
                  (texlive.combine {
                    inherit (texlive) scheme-small capt-of wrapfig;
                  })
                ]

                # See https://plantuml.com.
                # org-plantuml requires Java, which may be too heavy for some
                # hosts.
                (lib.optionals (jdk-package != null) [
                  graphviz
                  jdk-package
                  plantuml
                ])
              ];

              ruby =
                let
                  ruby-bundle = pkgs.bundlerEnv {
                    inherit version;
                    inherit (pkgs) ruby;
                    pname = "${pname}-ruby-bundler-deps";
                    gemdir = ./nix/ruby-bundler-dependencies;
                  };
                in
                  with ruby-bundle.gems; [
                    solargraph    # LSP
                    rubocop       # Flycheck
                    rubocop-rails # Flycheck
                  ];

              shell = [
                shellcheck # Flycheck
              ];

              # See https://github.com/raxod502/straight.el
              straight-el = git-package: [ git-package ];

              web =
                let
                  # Yarn dependencies:
                  #   eslint                         # Flycheck: JavaScript
                  #   jsonlint                       # Flycheck: JSON
                  #   postcss                        # Flycheck: CSS linter
                  #   semistandard                   # Flycheck: JavaScript
                  #   stylelint                      # Flycheck: CSS linter
                  #   textlint                       # Flycheck: Prose linter
                  #   vscode-css-languageserver-bin  # LSP: CSS
                  #   vscode-html-languageserver-bin # LSP: HTML
                  yarn-bundle = mkYarnModules {
                    inherit version;
                    pname = "${pname}-yarn-deps";
                    packageJSON = ./nix/js-yarn-dependencies/package.json;
                    yarnLock = ./nix/js-yarn-dependencies/yarn.lock;
                  };
                in [
                  yarn-bundle
                  deno # LSP: JavaScript
                ];
            };

            mkpkg = { git-package ? final.gitAndTools.gitFull
                    , jdk-package ? final.jdk11
                    }:
              prev.symlinkJoin rec {
                name = "${pname}-${version}";

                paths = with final; lib.flatten [
                  emacs
                  emacs-all-the-icons-fonts # Icons
                  python3 # TODO: I forget what python3 is used for.

                  deps.dired
                  deps.haskell
                  (deps.magit git-package)
                  deps.markdown
                  deps.mu4e
                  deps.nix
                  (deps.org-mode jdk-package)
                  deps.ruby
                  deps.shell
                  (deps.straight-el git-package)
                  deps.web
                ];

                postBuild =
                  let
                    extra-flags = lib.flatten [
                      # Build LSP with plists instead of hashmaps for performance.
                      "LSP_USE_PLISTS true"

                      # Store the path to mu4e's lisp files in an ENV variable.
                      # Unlike most emacs packages, mu4e is installed from
                      # nixpkgs, instead of with (use-package).
                      "MU4E_SITE_LISP ${final.mu}/share/emacs/site-lisp/mu4e"

                      # Store the path to PlanUML's JAR file in an ENV variable,
                      # if Java is available.
                      (lib.optional (jdk-package != null)
                        "PLANTUML_JAR ${final.plantuml}/lib/plantuml.jar")
                    ];

                    extra-args = builtins.concatStringsSep " " (map (f: "--set ${f}") extra-flags);
                  in ''
                    mv $out/node_modules $out/lib/

                    # symlinkJoin can't handle symlinked directories and
                    # nodePackages symlink ./bin -> ./lib/node_modules/.bin/.
                    for f in $out/lib/node_modules/.bin/* \
                             $out/lib/openjdk/bin/*; do
                       path="$(readlink --canonicalize-missing "$f")"
                       ln -s "$path" "$out/bin/$(basename $f)"
                    done

                    # Allow stylelint to extend other NPM config modules.
                    wrapProgram $out/bin/stylelint \
                        --add-flags "--config-basedir $out/lib/node_modules"

                    # Hardcode the config for this linter, since Flymake has no
                    # variable for it.
                    wrapProgram $out/bin/proselint \
                       --add-flags "--config ~/.emacs.d/tools/proselint.json"

                    # - Allow Emacs to access runtime dependencies.
                    wrapProgram $out/bin/${meta.mainProgram} \
                        --prefix PATH : $out/bin \
                        ${extra-args}
                  '';

                buildInputs = [ prev.makeWrapper ];

                meta = {
                  homepage = "https://github.com/sangster/emacs";
                  description = "Emacs, with runtime dependencies";
                  longDescription = ''
                    My emacs configure requires many runtime dependencies. This
                    package links them together.
                  '';
                  platforms = lib.platforms.all;
                  mainProgram = "emacs";
                };
              };
          in lib.makeOverridable mkpkg {};
      };
    in
      { inherit overlay; } //
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; overlays = [ overlay ]; };
        in rec {
          defaultPackage = packages.sangster-emacs;
          packages = {
            inherit (pkgs) sangster-emacs;
            sangster-emacs-nojava = packages.sangster-emacs.override {
              jdk-package = null;
            };
          };
        }
      );
}
