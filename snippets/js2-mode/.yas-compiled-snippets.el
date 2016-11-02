;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("while" "\nwhile ($1) {\n$0\n}\n" "while" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/while.yasnippet" nil nil)
                       ("v" "var $1 = $0\n" "var" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/v.yasnippet" nil nil)
                       ("us" "'use strict';$0" "use strict" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/us.yasnippet" nil nil)
                       ("r$" "var $ = require('jquery');$0" "require jquery" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/rjquery.yasnippet" nil nil)
                       ("r_" "var _ = require('lodash');$0" "require lodash" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/r_.yasnippet" nil nil)
                       ("r" "var ${1:$(s-lower-camel-case (file-name-nondirectory yas/text))} = require('$1');$0" "require" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/r.yasnippet" nil nil)
                       ("ng4" "['$1', '$2', '$3', '$4', function ($1, $2, $3, $4) {\n$0\n}]\n" "ng injection 4" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/ng4.yasnippet" nil nil)
                       ("ng3" "['$1', '$2', '$3', function ($1, $2, $3) {\n$0\n}]\n" "ng injection 3" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/ng3.yasnippet" nil nil)
                       ("ng2" "['$1', '$2', function ($1, $2) {\n$0\n}]\n" "ng injection 2" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/ng2.yasnippet" nil nil)
                       ("ng1" "['$1', function ($1) {\n$0\n}]\n" "ng injection 1" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/ng1.yasnippet" nil nil)
                       ("if" "if (${1}) {\n$0\n}\n" "if" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/if.yasnippet" nil nil)
                       ("for" "var ${1:i}, len = $3.length;\nfor ($1 = ${2:0}; $1 < len; $1++) {\n  $4\n}\n" "for" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/for.yasnippet" nil nil)
                       ("fe" "forEach(function ($1) {\n$0\n})$2\n" "fe" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/fe.yasnippet" nil nil)
                       ("f" "function $1($2) {\n$4\n}$3" "anonymous function" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/f.yasnippet" nil nil)
                       ("cl" "console.log($1);$0" "log" nil nil nil "/home/farseer/.emacs.d/private/snippets/js2-mode/cl.yasnippet" nil nil)))


;;; Do not edit! File generated at Wed Nov  2 10:34:46 2016
