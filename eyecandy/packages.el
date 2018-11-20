;;; packages.el --- eyecandy Layer packages File for Spacemacs
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

(defvar eyecandy-packages
  '(
    ;; moe-theme
    ;; material-theme
    color-identifiers-mode
    highlight-symbol
    highlight-quoted
    auto-dim-other-buffers
    git-gutter-fringe+
    all-the-icons
    ;; spaceline-all-the-icons
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar eyecandy-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function eyecandy/init-<package-eyecandy>

;; (defun eyecandy/init-moe-theme ()
;;   (use-package moe-theme
;;     :ensure t
;;     :config
;;     (progn
;;       (setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
;;       (moe-dark)
;;       (moe-theme-set-color 'blue))))

;; (defun eyecandy/init-material-theme ()
;;   (use-package material-theme
;;     :ensure t
;;     :config
;;     (load-theme 'material t)))

(defun eyecandy/init-highlight-quoted ()
  (use-package highlight-quoted
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'highlight-quoted-mode)))

(defun eyecandy/init-color-identifiers-mode ()
  (use-package color-identifiers-mode
    :ensure t
    :init
    (global-color-identifiers-mode t)
    :config
    (with-eval-after-load 'diminish
      (diminish 'color-identifiers-mode " Ⓒ"))
    ))

(defun eyecandy/init-highlight-symbol ()
  (use-package highlight-symbol
    :ensure t
    :diminish ""
    :init
    (add-hook 'prog-mode-hook 'highlight-symbol-mode)
    :config
    (setq highlight-symbol-idle-delay 0.3)))

(defun eyecandy/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :ensure t
    :init
    (auto-dim-other-buffers-mode))
  :config
  (with-eval-after-load 'diminish
    (diminish 'auto-dim-other-buffers-mode))
  )

(defun eyecandy/init-git-gutter-fringe+ ()
  (use-package git-gutter-fringe+
    :ensure t
    :diminish (git-gutter+-mode . "")
    :init
    (global-git-gutter+-mode)))

(defun eyecandy/init-all-the-icons ()
  (use-package all-the-icons
    :ensure t
    :init
    (setq inhibit-compacting-font-caches t)
    :config
    (with-eval-after-load 'neotree
      (defun neo-buffer--insert-fold-symbol (name &optional file-name)
        "Custom overriding function for the fold symbol.
`NAME' decides what fold icon to use, while `FILE-NAME' decides
what file icon to use."
        (or (and (equal name 'open)  (insert (all-the-icons-icon-for-dir file-name "down")))
            (and (equal name 'close) (insert (all-the-icons-icon-for-dir file-name "right")))
            (and (equal name 'leaf)  (insert (format "\t\t\t%s\t" (all-the-icons-icon-for-file file-name))))))

      (defun neo-buffer--insert-dir-entry (node depth expanded)
        (let ((node-short-name (neo-path--file-short-name node)))
          (insert-char ?\s (* (- depth 1) 2)) ; indent
          (when (memq 'char neo-vc-integration)
            (insert-char ?\s 2))
          (neo-buffer--insert-fold-symbol
           (if expanded 'open 'close) node)
          (insert-button (concat node-short-name "/")
                         'follow-link t
                         'face neo-dir-link-face
                         'neo-full-path node
                         'keymap neotree-dir-button-keymap)
          (neo-buffer--node-list-set nil node)
          (neo-buffer--newline-and-begin)))

      (defun neo-buffer--insert-file-entry (node depth)
        (let ((node-short-name (neo-path--file-short-name node))
              (vc (when neo-vc-integration (neo-vc-for-node node))))
          (insert-char ?\s (* (- depth 1) 2)) ; indent
          (when (memq 'char neo-vc-integration)
            (insert-char (car vc))
            (insert-char ?\s))
          (neo-buffer--insert-fold-symbol 'leaf node-short-name)
          (insert-button node-short-name
                         'follow-link t
                         'face (if (memq 'face neo-vc-integration)
                                   (cdr vc)
                                 neo-file-link-face)
                         'neo-full-path node
                         'keymap neotree-file-button-keymap)
          (neo-buffer--node-list-set nil node)
          (neo-buffer--newline-and-begin)))
      )))

(defun eyecandy/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
    :ensure t
    :after spaceline
    :config
    (spaceline-all-the-icons-theme)))

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
