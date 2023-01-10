;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
;;(setq gc-cons-threshold 402653184
;;      gc-cons-percentage 0.6)


(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))
;;(font . "Roboto Mono Medium")
(add-to-list 'default-frame-alist
             '(font . "Roboto Mono Light"))

(org-babel-load-file (expand-file-name "~/.emacs.d/emacsconfig.org"))
;;(global-display-line-numbers-mode)
;; test
