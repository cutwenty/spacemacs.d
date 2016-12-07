;;; packages.el --- hxhgta layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: hxhgta <hxhgta@localhost>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h (define-keddSPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `hxhgta-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `hxhgta/init-PACKAGE' to load and initi     /octopress (require 'org-octopress)
;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `hxhgta/pre-init-PACKAGE' and/or
;;   `hxhgta/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst hxhgta-packages
  '(
     js2-mode
     web-mode
     scss-mode
     hungry-delete
     nodejs-repl
     js2-refactor
     reveal-in-osx-finder
     find-file-in-project
     editorconfig
     json-mode
     emmet-mode
     org-octopress
     clojure-mode
     cider
     go-mode
     company-go
     go-eldoc
     ))

(defun hxhgta/init-go-mode ()
  (use-package go-mode
    :defer t))

(defun hxhgta/init-company-go ()
  (use-package company-go
    :defer t
    :init
    (progn
      (setq company-tooltip-limit 20)                      ; bigger popup window
      (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
      (setq company-echo-delay 0)                          ; remove annoying blinking
      (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
      )))

(defun hxhgta/init-go-eldoc ()
  (use-package go-eldoc
    :defer t
    :init
    (progn
      (set-face-attribute 'eldoc-highlight-function-argument nil
        :underline t :foreground "green"
        :weight 'bold))))

(defun hxhgta/init-clojure-mode ()
  (use-package clojure-mode
    :defer t))

(defun hxhgta/init-cider ()
  (use-package cider
    :defer t
    :init
    (progn
      (add-hook 'clojure-mode-hook 'cider-mode))
    ))

(defun hxhgta/init-org-octopress ()
  (use-package org-octopress
    :defer t
    :init
    (progn
      (setq org-octopress-directory-top       "~/hxhgta.com/source")
      (setq org-octopress-directory-posts     "~/hxhgta.com/source/_posts")
      (setq org-octopress-directory-org-top   "~/hxhgta.com/source")
      (setq org-octopress-directory-org-posts "~/hxhgta.com/source/blog")
      (setq org-octopress-setup-file          "~/hxhgta.com/setupfile.org"))
		))

(defun hxhgta/init-emmet-mode ()
  (use-package emmet-mode
    :defer t
    :init
    (progn
      (add-hook 'web-mode-hook 'emmet-mode))
		))


(defun hxhgta/init-json-mode ()
  (use-package json-mode
    :defer t
    ))

(defun hxhgta/init-find-file-in-project ()
	(use-package find-file-in-project
		:defer t
    ))

(defun hxhgta/init-js2-mode ()
	(use-package js2-mode
		:defer t
    :init
    (progn
      (add-hook 'js2-mode-hook 'flycheck-mode))
		))

(defun hxhgta/init-web-mode ()
	(use-package web-mode
		:defer t
		))

(defun hxhgta/init-scss-mode ()
  (use-package scss-mode
    :defer t
    :init
    (progn
      (add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa"))
      (autoload 'scss-mode "scss-mode")
      (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))))

(defun hxhgta/init-hungry-delete ()
	(use-package hungry-delete
		:defer t
		:init
		(progn
			(global-hungry-delete-mode))
		))

(defun hxhgta/init-nodejs-repl ()
	(use-package nodejs-repl
		:defer t
		))

(defun hxhgta/init-js2-refactor ()
	(use-package js2-refactor
		:defer t
    :init
    (progn
      (add-hook 'js2-mode-hook 'js2-refactor-mode)
      (js2r-add-keybindings-with-prefix "C-c C-m"))
		))

(defun hxhgta/init-reveal-in-osx-finder ()
	(use-package reveal-in-osx-finder
		:defer t
		))

(defun hxhgta/init-editorconfig ()
  (use-package editorconfig
    :ensure t
    :init
    (add-hook 'prog-mode-hook (editorconfig-mode 1))
    (add-hook 'text-mode-hook (editorconfig-mode 1))))

;;; packages.el ends here
