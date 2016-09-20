;;; packages.el --- ido Layer packages File for Spacemacs
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

(defvar ido-packages
  '(
    ido
    ido-ubiquitous
    smex
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar ido-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function ido/init-<package-ido>

(defun ido/init-ido ()
  (use-package ido
    :init
    (progn
      (ido-mode t)
      (ido-everywhere t))
    :config
    (progn
      (setq ido-enable-prefix nil)
      (setq ido-use-virtual-buffers t)
      (setq ido-enable-flex-matching t)
      (setq ido-create-new-buffer 'always)
      (setq ido-use-filename-at-point 'guess)
      (setq ido-save-directory-list-file (concat spacemacs-cache-directory "ido.last")))))

(defun ido/init-ido-ubiquitous ()
  (use-package ido-ubiquitous
    :ensure t
    :init
    (ido-ubiquitous-mode t)))

(defun ido/init-smex ()
  (use-package smex
    :ensure t
    :defer t
    :init
    (progn
      (define-key evil-visual-state-map (kbd "SPC SPC") 'smex)
      (define-key evil-normal-state-map (kbd "SPC SPC") 'smex)
      (global-set-key (kbd "C-x C-m") 'smex)
      (global-set-key (kbd "C-c C-m") 'smex))
    :config
    (setq smex-save-file (concat spacemacs-cache-directory "smex-items"))))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
