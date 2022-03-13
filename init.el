;;; init.el --- Emacs initialization file

;;; Commentary:
;;
;;  This file bootstraps `straight.el' and `org-mode', tangles `js:config-file',
;;  and then loads it.

;;; Code:

;;; 0. The real config file. The rest of init.el is about loading this file.
(defvar js:config-file
  (file-truename (locate-user-emacs-file "README.org"))
  "The `org-mode' config file.")
(defvar js:config-file:tangled
  (concat (file-name-sans-extension js:config-file) ".el")
  "The tangled version of `js:config-file'.")

;;; 1. Load straight.el: Package manager
;;
;; See https://github.com/raxod502/straight.el.
(defvar straight-use-package-by-default t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (locate-user-emacs-file "straight/repos/straight.el/bootstrap.el"))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; 2. Load use-package: Package configuration manager
(straight-use-package 'use-package)

;;; 3. Load org-mode: To compile our config file
(use-package org)

;;; 4. Tangle and load `js:config-file'
;;
;; I have multiple Emacs services. If they happen to start at the same time,
;; there may be a race condition where both try to tangle the file at the same
;; time. This section tries to lock the tangled file before writing to it.
(defun js:init:tangle-config-p (&rest quiet)
  "Non-nil if `js:config-file' should be tangled."
  (cond ((not (file-exists-p js:config-file:tangled))
         (or quiet
             (message "init.el: '%s' doesn't exist" js:config-file:tangled)))
        ((org-file-newer-than-p
          js:config-file:tangled
          (file-attribute-modification-time (file-attributes js:config-file)))
         nil)
        (t (or quiet (message "init.el: '%s' is newer than '%s'"
                              js:config-file js:config-file:tangled)))))

(defun js:init:block-until-unlocked-p (file max-wait-seconds)
  "Non-nil if FILE is unlocked, waiting up to MAX-WAIT-SECONDS."
  (let* ((sleep-time 1)
         (started-at (float-time)))
    (while (and (< (float-time) (+ started-at max-wait-seconds))
                (stringp (file-locked-p file)))
      (message "init.el: Another process has locked '%s'..." file)
      (sleep-for sleep-time))
    (if (< (float-time) (+ started-at max-wait-seconds))
        t
      (error "Waited more than %d seconds for '%s' to unlock"
             max-wait-seconds file)
      nil)))

(defun js:init:lock-and-tangle-config (max-wait)
  "Tangle `js:config-file', waiting up to MAX-WAIT seconds."
  (with-temp-buffer
    (when (js:init:block-until-unlocked-p js:config-file:tangled max-wait)
      (if (not (js:init:tangle-config-p 'quiet))
          (progn
            (message "init.el: Other process tangled '%s'."
                     js:config-file:tangled)
            (sleep-for 1))
        (message "init.el: Tangling '%s'." js:config-file:tangled)
        (set-visited-file-name js:config-file:tangled t)
        (lock-buffer)
        (unwind-protect
            (org-babel-tangle-file js:config-file js:config-file:tangled
                                   "emacs-lisp\\|elisp")
          (revert-buffer t t t)
          (unlock-buffer))))))

(when (js:init:tangle-config-p) (js:init:lock-and-tangle-config 30))
(load-file js:config-file:tangled)
;;; init.el ends here
