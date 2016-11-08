(add-hook
 'org-load-hook
 (lambda ()
   ;; evil key bindings
   (evil-define-key 'normal org-mode-map
     (kbd "RET")   'org-open-at-point
     (kbd "zO")    'show-all
     (kbd "zC")    'hide-all
     (kbd "<tab>") 'org-cycle
     )
   (evil-define-key 'insert org-mode-map
     (kbd "<tab>") 'org-table-next-field
     )

   ;; options
   (setq org-directory "~/Dropbox/org/")
   (unless (file-exists-p org-directory)
     (make-directory org-directory))

   (setq org-tags-column -120)
   (setq org-log-done 'time)
   (setq org-completion-use-ido t)

   (setq org-hide-emphasis-markers t)
   (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\n")
   (custom-set-variables `(org-emphasis-alist ',org-emphasis-alist))

   (setq org-startup-indented t)
   (setq org-startup-folded t)
   (setq org-indent-indentation-per-level 1)

   (setq org-startup-with-latex-preview t)
   (setq org-startup-with-inline-images t)
   (setq org-pretty-entities t)
   (setq org-pretty-entities-include-sub-superscripts nil)
   (setq org-src-fontify-natively t)
   (setq org-file-apps '((auto-mode . emacs)
                         ("\\.x?html?\\'" . default)
                         ("\\.pdf\\'" . "zathura %s")
                         ))

   (require 'ox-latex)
   (require 'ox-bibtex)
   (unless (boundp 'org-latex-classes)
     (setq org-latex-classes nil))
   (setq org-latex-default-class "org-article")
   (add-to-list 'org-latex-classes
                '("org-article"
                  ;; "\\documentclass{IEEEtran}"
                  "\\documentclass[12pt]{article}"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

   ;; for latex export
   (setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                                 "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
   ;; (setq org-latex-to-pdf-process '("latexmk -pdf %f"))

   ;; minted code block
   (setq org-src-preserve-indentation t)
   (setq org-latex-listings 'minted)
   (setq org-latex-minted-options
         '(("fontsize" "\\small")("obeytabs" "true")))
   (add-to-list 'org-latex-packages-alist '("" "minted" nil))
   (add-to-list 'org-latex-packages-alist '("" "zhfontcfg" nil))
   (add-to-list 'org-latex-packages-alist '("" "mathpazo" t))
   ;; make math equations larger
   (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

   ;; export options
   (setq org-export-with-sub-superscripts '{})
   (setq org-export-with-section-numbers t)
   (setq org-latex-caption-above nil)
   (require 'ox-publish)
   (setq org-publish-project-alist
         `(("html"
            :base-directory ,(concat org-directory "notes")
            :base-extension "org"
            :publishing-directory "~/Dropbox/Public/html"
            :publishing-function org-html-publish-to-html)
           ("pdf"
            :base-directory ,(concat org-directory "notes")
            :base-extension "org"
            :publishing-directory ,(concat org-directory "pdf")
            :publishing-function org-latex-publish-to-pdf)
           ("all" :components ("html" "pdf"))))

   ;; default css style
   (defun my-org-css-hook (exporter)
     (when (eq exporter 'html)
       (setq org-html-head-include-default-style nil)
       (setq org-html-head (concat "<link href=\"assets/css/navigator.css\" rel=\"stylesheet\" type=\"text/css\">\n"
                                   "<link href=\"assets/css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n"))))
   (add-hook 'org-export-before-processing-hook 'my-org-css-hook)

   (org-babel-do-load-languages
    'org-babel-load-languages
    '((dot . t)
      (sh . t)
      (R . t)
      (scala . t)
      (ditaa . t)
      (gnuplot . t)
      (plantuml . t)))
   (add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))
   (add-to-list 'org-src-lang-modes (quote ("dot2tex" . graphviz-dot)))
   (add-to-list 'org-src-lang-modes (quote ("gnuplot" . gnuplot)))
   (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))
   (setq org-plantuml-jar-path "/opt/plantuml/plantuml.jar")
   (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_9.jar")

   ;; GTD stuff
   (setq org-todo-keywords
         '((sequence "TODO(t)" "STARTED(s)" "PROGRESSING(p)" "ALMOST(a)" "DONE(d)")))
   (setq org-todo-keyword-faces
         '(("TODO" . "#cc9393") ("STARTED" . "khaki") ("PROGRESSING" . "GreenYellow")
           ("ALMOST" . "turquoise") ("DONE" . "#afd8af")))
   (setq org-agenda-files `(,(concat org-directory "GTD/gtd.org")
                            ,(concat org-directory "notes/papers.org")))
   (require 'org-agenda)
   (add-to-list 'org-agenda-custom-commands
                '("W" "Weekly review"
                  agenda ""
                  ((org-agenda-span 'week)
                   (org-agenda-start-on-weekday 0)
                   (org-agenda-start-with-log-mode t)
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'nottodo 'done)))))
   (setq my-inbox-org-file (concat org-directory "/GTD/inbox.org"))
   (setq org-default-notes-file my-inbox-org-file)
   (setq org-capture-templates
         `(("t" "Todo" entry (file+headline my-inbox-org-file "INBOX")
            "* TODO %?\n%U\n%a\n")
           ("n" "Note" entry (file+headline my-inbox-org-file "NOTES")
            "* %? :NOTE:\n%U\n%a\n")
           ("m" "Meeting" entry (file my-inbox-org-file)
            "* MEETING %? :MEETING:\n%U")
           ("j" "Journal" entry (file+datetree ,(concat org-directory "/GTD/journal.org"))
            "* %?\n%U\n")))

   (setq org-use-fast-todo-selection t)
   (setq org-treat-S-cursor-todo-selection-as-state-change nil)
   (setq org-refile-targets '((nil :maxlevel . 9)
                              (org-agenda-files :maxlevel . 9)))

   ;; decorator prettify
   (defface org-decorator-face
     '((((class color) (min-colors 88) (background dark))
        :foreground "#bb79d6"))
     "for org-mode decorators."
     :group 'basic-faces)

   (font-lock-add-keywords
    'org-mode '(("^\s*\\([+-]\\|[0-9][.)]\\)\s"
                 .
                 'org-decorator-face)
                ("^\s*\\(+\\)\s"
                 1
                 (compose-region (- (match-end 0) 2)
                                 (- (match-end 0) 1)
                                 "►"))
                ("^\s*\\(-\\)\s"
                 1
                 (compose-region (- (match-end 0) 2)
                                 (- (match-end 0) 1)
                                 "◅"))))

   (add-hook 'org-mode-hook (lambda ()
                              (when (or (executable-find "aspell")
                                        (executable-find "ispell")
                                        (executable-find "hunspell"))
                                (flyspell-mode))
                              (diminish 'org-indent-mode)
                              (org-bullets-mode 1)))))

(defun my-org-uml-from-table (table)
  "UML graph from table"
  (cl-flet ((struct-name (x) (save-match-data
                               (and (string-match "\\(struct\\|class\\) \\([^ ]*\\)" x)
                                    (match-string 2 x)))))
    (let ((all-structs (mapcar 'car table)))
      (mapcar #'(lambda (x)
                  (let ((lhead (car x))
                        (ltail (cdr x)))
                    (princ (concat lhead " [label=\"<head> "
                                   lhead " |"
                                   (mapconcat (lambda (y)
                                                (concat " <" (replace-regexp-in-string
                                                              "\\W" "_" y) "> " y))
                                              (delq "" ltail) " | ") "\", shape=\"record\"];\n"))
                    (mapcar (lambda (y)
                              (let ((sname (struct-name y)))
                                (and (member sname all-structs)
                                     (princ (format "%s:%s -> %s:head\n"
                                                    lhead (replace-regexp-in-string
                                                           "\\W" "_" y) sname)))))
                            ltail))) table))))

(defun my-org-figure-from-maim ()
  "screenshot inside org-mode"
  (interactive)
  (let* ((base (concat org-directory "notes/"))
         (relative "assets/image/")
         (file (concat relative (read-string "Name: ") ".png"))
         (path (expand-file-name (concat base file)))
         (res (if (or (not (file-exists-p path)) (y-or-n-p "file already exists, override? "))
                  (progn
                    (if (string-match-p "awesome" (getenv "XDG_SESSION_DESKTOP"))
                        (call-process-shell-command "echo 'awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end'|awesome-client" nil nil nil))
                    (call-process "maim" nil nil nil "-s" path)) 0)))
    (if (= res 0)
        (insert
         (org-make-link-string (concat "file:./" file))))))
