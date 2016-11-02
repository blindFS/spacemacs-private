;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("uml" "#+begin_src plantuml :file ${1:./assets/image/}${2:xxx}.png :exports ${3:results}\n$0\n#+end_src\n" "uml" nil nil nil "/home/farseer/.emacs.d/private/snippets/org-mode/uml" nil nil)
                       ("sh" "#+begin_src sh :results output\n$0\n#+end_src\n" "sh" nil nil nil "/home/farseer/.emacs.d/private/snippets/org-mode/sh" nil nil)
                       ("graph" "#+begin_src dot :file ${1:./assets/image/}${2:xxx}.png :cmdline -Kdot -Tpng :exports ${3:results}\n$0\n#+end_src\n" "graph" nil nil nil "/home/farseer/.emacs.d/private/snippets/org-mode/graph" nil nil)
                       ("diag" "\n#+name: ${1:dot-input}\n#+BEGIN_SRC emacs-lisp :var table=${2:class-table} :results output :exports none\n(dia-from-table table)\n#+END_SRC\n\n#+BEGIN_SRC dot :file ${3:./assets/image/}${4:xxx}.png :var input=$1 :exports results\ndigraph {\n    graph [rankdir = \"LR\"];\n    $input\n}\n#+END_SRC" "diag" nil nil nil "/home/farseer/.emacs.d/private/snippets/org-mode/diag" nil nil)
                       ("begin" "#+begin_${1:equation}\n#+end_$1\n" "begin" nil nil nil "/home/farseer/.emacs.d/private/snippets/org-mode/begin" nil nil)))


;;; Do not edit! File generated at Wed Nov  2 10:34:46 2016
