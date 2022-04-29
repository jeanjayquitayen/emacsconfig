;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(molokai))
 '(custom-safe-themes
   '("46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "b494aae329f000b68aa16737ca1de482e239d44da9486e8d45800fd6fd636780" "c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" default))
 '(package-selected-packages
   '(monokai-alt-theme sublime-themes molokai-theme lsp-tailwindcss dap-mode lsp-mode diminish expand-region rainbow-delimiters company-irony company-c-headers flycheck-clang-analyzer rainbow-mode mark-multiple helm linum-relative swiper fancy-battery spaceline dashboard async zerodark-theme web-mode json-mode yasnippet which-key use-package treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-evil switch-window spacemacs-theme protobuf-mode poetry plantuml-mode ox-reveal org-bullets ob-go ido-vertical-mode htmlize go-mode flycheck company-quickhelp company-jedi beacon)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
