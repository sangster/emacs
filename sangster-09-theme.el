(deftheme sangster-09
  "Created 2019-09-05.")

(custom-theme-set-faces
  'sangster-09

  '(default ((t (
    :box nil
    :family "JetBrains Mono"
    :foreground "#bcbcbc"
    :foundry "default"
    :height 128
    :inherit nil
    :inverse-video nil
    :overline nil
    :slant normal
    :stipple nil
    :strike-through nil
    :underline nil
    :weight normal
    :width normal
    ))))
  '(shadow ((t (:foreground "gray30"))))

  '(cursor ((t (:background "#d54e53"))))
  '(fixed-pitch ((t (:family "Monospace"))))
  '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
  '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
  '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
  '(minibuffer-prompt ((t (:foreground "#7aa6da" :background "#000000"))))
  '(highlight ((t (:inverse-video nil :background "#2a2a2a"))))
  '(region ((t (:inverse-video nil :background "#424242"))))
  '(shadow ((t (:foreground "#969896"))))
  '(secondary-selection ((t (:background "#2a2a2a"))))

  '(font-lock-builtin-face              ((t (:foreground "#c397d8"))))
  '(font-lock-comment-delimiter-face    ((t (:slant italic :foreground "#969896"))))
  '(font-lock-comment-face              ((t (:slant italic :foreground "#969896"))))
  '(font-lock-constant-face             ((t (:foreground "#7aa6da"))))
  '(font-lock-doc-face                  ((t (:foreground "#c397d8"))))
  '(font-lock-function-name-face        ((t (:foreground "#e78c45"))))
  '(font-lock-keyword-face              ((t (:foreground "#b9ca4a"))))
  '(font-lock-negation-char-face        ((t (:foreground "#7aa6da"))))
  '(font-lock-preprocessor-face         ((t (:foreground "#c397d8"))))
  '(font-lock-regexp-grouping-backslash ((t (:foreground "#e7c547"))))
  '(font-lock-regexp-grouping-construct ((t (:foreground "#c397d8"))))
  '(font-lock-string-face               ((t (:foreground "#70c0b1"))))
  '(font-lock-type-face                 ((t (:foreground "#7aa6da"))))
  '(font-lock-variable-name-face        ((t (:foreground "#e7c547"))))
  '(font-lock-warning-face              ((t (:weight bold :foreground "#d54e53"))))

  '(diff-added        ((t (:inherit diff-changed :background "#115511"))))
  '(diff-file-header  ((t (:background "blue2" :weight bold))))
  '(diff-header       ((t (:background "blue4"))))
  '(diff-removed      ((t (:inherit diff-changed :background "red4"))))
  '(ediff-even-diff-A ((t (:background "gray4"))))
  '(ediff-even-diff-B ((t (:background "gray8"))))
  '(ediff-odd-diff-A  ((t (:background "gray5"))))
  '(ediff-odd-diff-B  ((t (:background "gray7"))))


  '(button ((t (:foreground "LightSkyBlue1" :underline t))))
  '(widget-field ((t (:background "gray6")))) ; editable fields

  '(link ((t (:weight bold :underline (:color foreground-color :style line)))))
  '(link-visited ((t (:weight normal :underline (:color foreground-color :style line) :foreground "#d0bf8f"))))
  '(fringe ((t (:foreground "#969896" :background "#151515"))))
  '(header-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#70c0b1" :inherit (mode-line-inactive)))))
  '(tooltip ((t (:inverse-video t :foreground "#e7c547" :background "#000000"))))

  ; TODO: '(mode-line ((t (:weight normal :box (:line-width 1 :color "#424242" :style nil) :foreground "#eaeaea" :background "#424242"))))
  '(mode-line ((t (:background "#2a2a2a" :foreground "#969696" :box (:line-width -1 :color "#4c83ff") :weight normal))))

  '(mode-line-buffer-id ((t (:foreground "#c397d8"))))
  '(mode-line-emphasis ((t (:slant italic :foreground "#eaeaea"))))
  '(mode-line-highlight ((t (:weight bold :box nil :foreground "#c397d8"))))

  ; TODO: '(mode-line-inactive ((t (:weight normal :box (:line-width -1 :color "#4c83ff" :style nil) :foreground "#969896" :background "#2a2a2a" :inherit (mode-line)))))
  '(mode-line-inactive ((t (:inherit mode-line :background "#424242" :foreground "#eaeaea" :box (:line-width 1 :color "#424242") :weight normal))))

  '(isearch ((t (:inverse-video t :foreground "#e7c547" :background "#000000"))))
  '(isearch-fail ((t (:inverse-video t :background "#000000" :inherit (font-lock-warning-face)))))

  '(lazy-highlight ((t (:inverse-video t :foreground "#70c0b1" :background "#000000"))))
  '(match ((t (:inverse-video t :foreground "#7aa6da" :background "#000000"))))
  '(next-error ((t (:inherit (region)))))
  '(query-replace ((t (:background "#333333"))))

  '(tty-menu-selected-face ((t (:background "#5f0000"))))


  ;; Fill column indicator
 '(fill-column-indicator ((t (:inherit shadow :stipple nil :foreground "gray4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; company-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; '(company-tooltip ((t (:inherit default))))
  ;; '(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
  ;; '(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
  ;; '(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
  ;; '(company-tooltip-common ((t (:inherit font-lock-constant-face))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; helm-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(helm-selection ((t (:background "dark blue" :distant-foreground "black"))))
  '(helm-buffer-modified ((t (:inherit font-lock-comment-face :extend t :foreground "green"))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; helm-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(lsp-ui-doc-background ((t (:background "gray5"))))
  '(lsp-ui-sideline-code-action ((t (:inherit lsp-details-face))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; magit-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(magit-blame-highlight ((t (:extend t :background "grey8" :foreground "black"))))
  '(magit-diff-added ((t (:extend t :background "#002200" :foreground "#55cc55"))))
  '(magit-diff-added-highlight ((t (:extend t :background "#224422" :foreground "#55cc55"))))
  '(magit-diff-context ((t (:extend t :foreground "grey51"))))
  '(magit-diff-context-highlight ((t (:extend t :background "grey8"))))
  '(magit-diff-file-heading-highlight ((t (:inherit magit-section-highlight :extend t))))
  '(magit-diff-hunk-heading ((t (:extend t :foreground "color-57"))))
  '(magit-diff-hunk-heading ((t (:extend t :foreground "dark magenta"))))
  '(magit-diff-hunk-heading-highlight ((t (:extend t :background "gray8" :foreground "color-57"))))
  '(magit-diff-hunk-heading-highlight ((t (:extend t :background "gray8" :foreground "magenta"))))
  '(magit-diff-removed ((t (:extend t :background "#220000" :foreground "#cc5555"))))
  '(magit-diff-removed-highlight ((t (:extend t :background "#442222" :foreground "#cc5555"))))
  '(magit-section-heading-selection ((t (:extend t :foreground "salmon4"))))
  '(magit-section-highlight ((t (:extend t :foreground "white"))))
  '(magit-section-secondary-heading ((t (:extend t :weight bold))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; mu4e
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(gnus-header-name ((t (:foreground "tomato" :weight bold))))
  '(mu4e-thread-folding-child-face ((t (:extend t :background "gray5" :underline nil))))
  '(mu4e-thread-folding-root-folded-face ((t (:extend t :background "grey5" :overline nil :underline nil))))
  '(mu4e-thread-folding-root-prefix-face ((t (:extend t :background "gray10" :overline nil :underline nil))))
  '(mu4e-thread-folding-root-unfolded-face ((t (:extend t :background "#080833" :weight bold :overline nil :underline nil))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; org-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(org-link ((t (:inherit link :foreground "LightSkyBlue1"))))
  '(org-tag ((t (:weight bold :height 160))))
  '(org-column ((t (:background "grey4" :strike-through nil :underline nil
                                :slant normal :weight normal))))
  '(org-block ((t (:inherit shadow :extend t :foreground "peru"))))
  '(org-habit-alert-face ((t (:background "gold" :foreground "black"))))

  ;; Variable-width org-headers
  '(org-level-1 ((t (:inherit outline-1 :height 160))))
  '(org-level-2 ((t (:inherit outline-2 :height 160))))
  '(org-level-3 ((t (:inherit outline-3 :height 160))))
  '(org-level-4 ((t (:inherit outline-4 :height 150))))
  '(org-level-5 ((t (:inherit outline-4 :height 140))))
  '(org-level-6 ((t (:inherit outline-4 :height 140))))
  '(outline-1 ((t (:slant normal :inherit font-lock-function-name-face))))
  '(outline-2 ((t (:slant normal :inherit font-lock-variable-name-face))))
  '(outline-3 ((t (:slant normal :inherit font-lock-keyword-face))))
  '(outline-4 ((t (:slant normal :inherit font-lock-comment-face))))
  '(outline-5 ((t (:slant normal :inherit font-lock-type-face))))
  '(outline-6 ((t (:slant normal :inherit font-lock-constant-face :foreground "white"))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; org-superstar
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(org-superstar-leading ((t (:inherit default :foreground "gray30"))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; rainbow-delimiters-mode
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  '(rainbow-delimiters-depth-2-face ((t (:foreground "dark orange"))))
  '(rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
  '(rainbow-delimiters-depth-4-face ((t (:foreground "chartreuse"))))
  '(rainbow-delimiters-depth-5-face ((t (:foreground "deep sky blue"))))
  '(rainbow-delimiters-depth-6-face ((t (:foreground "yellow"))))
  '(rainbow-delimiters-depth-7-face ((t (:foreground "orchid"))))
  '(rainbow-delimiters-depth-8-face ((t (:foreground "spring green"))))
  '(rainbow-delimiters-depth-9-face ((t (:foreground "sienna1"))))
)

(provide-theme 'sangster-09)
