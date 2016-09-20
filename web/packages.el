;;; packages.el --- web Layer packages File for Spacemacs
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

(defvar web-packages
  '(
    web-mode
    rainbow-mode
    emmet-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar web-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function web/init-<package-web>

(defun web/init-web-mode ()
  (use-package web-mode
    :ensure t
    :mode "\\.html?$"))

(defun web/init-rainbow-mode ()
  (use-package rainbow-mode
  :ensure t
  :commands rainbow-mode
  :diminish (rainbow-mode . " Ⓡ")
  :init
  (progn
    (add-hook 'html-mode-hook 'rainbow-mode)
    (add-hook 'web-mode-hook 'rainbow-mode)
    (add-hook 'css-mode-hook 'rainbow-mode))))

(defun web/init-emmet-mode ()
  (use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :diminish (emmet-mode . "")
  :init
  (progn
    (add-hook 'css-mode-hook 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode)
    (add-hook 'web-mode-hook 'emmet-mode))))
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
