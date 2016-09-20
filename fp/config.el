(setq proof-splash-enable nil)
(setq scheme-program-name "guile")

(add-hook 'coq-mode-hook (lambda ()
                           (progn
                             (linum-mode)
                             (rainbow-delimiters-mode)
                                        ; (show-smartparens-mode -1)
                             (sp-local-pair 'coq-mode "'" nil :actions nil))))

(global-prettify-symbols-mode 1)

(defun minor-prettify-symbols-hook ()
  (setq-local
   prettify-symbols-alist
   (append '(
             (">=" . ?≥)
             ("<=" . ?≤)
             ("lambda" . ?λ)
             ) prettify-symbols-alist)))

(defun coq-mode-unicode-hook ()
  (progn
    (setq unicode-tokens-use-shortcuts nil)
    (proof-unicode-tokens-enable)
                                        ; (show-paren-mode -1)
    (setq-local prettify-symbols-alist
                '((":=" . ?≜)
                  ("Proof." . ?∵)
                  ("Qed." . ?■)
                  ("Defined." . ?□)
                  ("False" . ?⊥)
                  ("True" . ?⊤)
                  ("nil" . ?ⵁ)
                  ("Prop" . ?Ƥ)))))

(add-hook 'scheme-mode-hook 'minor-prettify-symbols-hook)
(add-hook 'emacs-lisp-mode-hook 'minor-prettify-symbols-hook)
(add-hook 'racket-mode-hook 'minor-prettify-symbols-hook)
(add-hook 'python-mode-hook 'minor-prettify-symbols-hook)
(add-hook 'coq-mode-hook 'coq-mode-unicode-hook)
(add-hook 'coq-goals-mode-hook 'coq-mode-unicode-hook)
(add-hook 'coq-response-mode-hook 'coq-mode-unicode-hook)

(eval-after-load 'rainbow-delimiters
  (add-hook 'racket-repl-mode-hook #'rainbow-delimiters-mode-enable))
