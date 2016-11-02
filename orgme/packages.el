;;; packages.el --- orgme Layer packages File for Spacemacs
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

(defvar orgme-packages
  '(
    graphviz-dot-mode
    gnuplot-mode
    org-ref
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar orgme-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function orgme/init-<package-orgme>

(defun orgme/init-graphviz-dot-mode ()
  (use-package graphviz-dot-mode
    :ensure t
    :mode "\\.dot$"))

(defun orgme/init-gnuplot-mode ()
  (use-package gnuplot-mode
    :ensure t
    :mode "\\.plt"))

(defun orgme/post-init-org-ref ()
  (setq
   org-ref-bibliography-notes "~/Dropbox/org/notes/papers.org"
   org-ref-default-bibliography '("~/Dropbox/org/notes/papers.bib")
   org-ref-pdf-directory "~/Dropbox/Papers/"
   bibtex-completion-bibliography "~/Dropbox/org/notes/papers.bib"
   bibtex-completion-library-path "~/Dropbox/Papers/"
   bibtex-completion-notes-path "~/Dropbox/org/notes/")
  )

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
