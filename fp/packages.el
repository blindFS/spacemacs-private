;;; packages.el --- fp Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar fp-packages
  '(
    company-coq
    sml-mode
    scheme-complete
    paredit
    evil-paredit
    )
  "List of all packages to install and/or initialize. Built-in packages
   which require an initialization must be listed explicitly in the list.")

(defvar fp-excluded-packages '()
  "List of packages to exclude.")

(defun fp/init-company-coq ()
  (use-package company-coq
    :ensure t
    :init
    (progn
      (setq company-coq-prettify-symbols nil)
      (setq company-coq-autocomplete-symbols nil)
      (add-hook 'coq-mode-hook 'company-coq-initialize))))

(defun fp/init-sml-mode ()
  (use-package sml-mode
    :ensure t
    :mode "\\.sml$"))

(defun fp/init-scheme-complete ()
  (use-package scheme-complete
    :ensure t))

(defun fp/init-paredit ()
  (use-package paredit
    :ensure t
    :diminish " Ⓟ"
    :config
    (progn
      (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
      (add-hook 'lisp-mode-hook       #'enable-paredit-mode)
      (add-hook 'scheme-mode-hook     #'enable-paredit-mode)
      (add-hook 'racket-mode-hook     #'enable-paredit-mode)
      (eval-after-load 'evil-mode
        (progn
          (define-key evil-insert-state-map (kbd "C-d") 'paredit-splice-sexp)
          (define-key evil-normal-state-map (kbd "<") 'paredit-backward-slurp-sexp)
          (define-key evil-normal-state-map (kbd ">") 'paredit-forward-slurp-sexp)
          (define-key evil-normal-state-map (kbd "C-\>") 'paredit-backward-barf-sexp)
          (define-key evil-normal-state-map (kbd "C-\<") 'paredit-forward-barf-sexp))))))

(defun fp/init-evil-paredit ()
  (use-package evil-paredit
    :ensure t
    :config
    (progn
      (add-hook 'emacs-lisp-mode-hook #'evil-paredit-mode)
      (add-hook 'lisp-mode-hook       #'evil-paredit-mode)
      (add-hook 'scheme-mode-hook     #'evil-paredit-mode)
      (add-hook 'racket-mode-hook     #'evil-paredit-mode))))

;; For each package, define a function fp/init-<package-fp>
;;
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
