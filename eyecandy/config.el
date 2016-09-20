(add-hook 'prog-mode-hook 'linum-mode)

(custom-set-variables
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t))))))

(custom-set-faces
 '(auto-dim-other-buffers-face ((t (:background "gray8"))))
 '(org-list-dt ((t (:foreground "turquoise" :weight bold))))
 '(region ((t (:foreground nil))))
 '(button ((t (:foreground "#59b0f9")))))
