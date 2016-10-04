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
