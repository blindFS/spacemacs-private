;;; Compiled snippets and support files for `html-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
                     '(("a" "<a href=\"$1\">$0</a>\n" "a" nil nil nil nil nil nil)
                       ("content" "<content>\n$0\n</content>\n" "content" nil nil nil nil nil nil)
                       ("div" "<div>\n$0\n</div>\n" "div" nil nil nil nil nil nil)
                       ("divc" "<div class=\"$1\">\n$0\n</div>\n" "divc" nil nil nil nil nil nil)
                       ("in" "<input type=\"$1\" name=\"$2\" value=\"$3\">$0\n" "in" nil nil nil nil nil nil)
                       ("script" "<script src=\"$1\"></script>$0\n" "script" nil nil nil nil nil nil)
                       ("section" "<section>\n$0\n</section>\n" "section" nil nil nil nil nil nil)
                       ("t" "<$1>\n$0\n</$1>\n" "create tag" nil nil nil nil nil nil)
                       ("ta" "<$1 $2>\n$0\n</$1>\n" "create tag with attributes" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Nov 27 16:59:07 2014
