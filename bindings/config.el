(defvar kill-star-buffers-except
  '("\\`\\*scratch\\*\\'"
    "\\`\\*Messages\\*\\'"
    "\\` \\*Minibuf-[[:digit:]]+\\*\\'"
    "\\` \\*Echo Area [[:digit:]]+\\*\\'")
  "Exception list for `kill-star-buffers'")

(defun kill-star-buffers ()
  "Kill all star buffers except those in `kill-star-buffers-except'"
  (interactive)
  (mapc (lambda (buf)
          (let ((buf-name (buffer-name buf)))
            (when (and
                   ;; if a buffer's name is enclosed by * with optional leading
                   ;; space characters
                   (string-match-p "\\` *\\*.*\\*\\'" buf-name)
                   ;; and the buffer is not associated with a process
                   ;; (suggested by "sanityinc")
                   (null (get-buffer-process buf))
                   ;; and the buffer's name is not in `kill-star-buffers-except'
                   (notany (lambda (except) (string-match-p except buf-name))
                           kill-star-buffers-except))
              (kill-buffer buf))))
        (buffer-list)))

(evil-define-key 'normal global-map (kbd "gh") 'beginning-of-line)
(evil-define-key 'normal global-map (kbd "gl") 'end-of-line)

(define-key evil-normal-state-map (kbd "SPC B") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)
(define-key evil-normal-state-map (kbd "g p") (kbd "` [ v ` ]"))

(define-key evil-normal-state-map (kbd "s") 'avy-goto-word-or-subword-1)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
