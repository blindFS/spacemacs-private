;;; packages.el --- company Layer packages File for Spacemacs
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

(defvar company-packages
  '(
    company
    company-math
    yasnippet
    smartparens
    helm-rg
    )
  "List of all packages to install and/or initialize. Built-in packages
   which require an initialization must be listed explicitly in the list.")

(defvar company-excluded-packages
  '()
  "List of packages to exclude."
  )

(defun company/init-helm-rg ()
  (use-package helm-rg
    :ensure t))

(defun company/post-init-company ()
  (global-company-mode t)
  (evil-define-key 'insert global-map (kbd "C-f") 'company-files)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)
  (setq company-global-modes
        '(not eshell-mode comint-mode))
  (defadvice company-complete-common (around advice-for-company-complete-common activate)
    (when (null (yas-expand))
      ad-do-it)))

(defun company/init-company-math ()
  (use-package company-math
    :ensure t
    :config
    (defun my-cp-math-hook ()
      (setq-local company-backends (append '((company-math-symbols-unicode company-latex-commands)) company-backends)))
    (add-hook 'org-mode-hook 'my-cp-math-hook t)))

(defun company/post-init-yasnippet ()
  (evil-define-key 'insert global-map (kbd "C-k") 'yas-insert-snippet)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'html-mode-hook 'yas-minor-mode)
  (add-hook 'org-mode-hook 'yas-minor-mode)
  (setq yas-fallback-behavior 'return-nil)
  (setq yas-also-auto-indent-first-line t)
  (setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))
  (setq yas-snippet-dirs (remove 'yas-installed-snippets-dir yas-snippet-dirs))
  ;; (yas-reload-all)
  )

(defun company/post-init-smartparens ()
  (sp-use-smartparens-bindings)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (show-paren-mode -1)

  (setq sp-show-pair-delay 1)
  (setq sp-show-pair-from-inside t)
  (setq sp-autoescape-string-quote nil)
  (setq sp-autoinsert-if-followed-by-same 1)
  (setq sp-highlight-pair-overlay nil)
  (sp-local-pair 'racket-repl-mode "'" nil :actions nil)
  (sp-local-pair 'racket-repl-mode "`" nil :actions nil)

  (defun my-open-block-c-mode (id action context)
    (when (eq action 'insert)
      (newline)
      (indent-according-to-mode)
      (forward-line -1)
      (indent-according-to-mode)))
  (sp-pair "{" nil :post-handlers '(:add (my-open-block-c-mode "RET")))
  (sp-pair "[" nil :post-handlers '(:add (my-open-block-c-mode "RET"))))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
