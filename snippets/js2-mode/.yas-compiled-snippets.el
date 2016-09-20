;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("cl" "console.log($1);$0" "log" nil nil nil nil nil nil)
                       ("f" "function $1($2) {\n$4\n}$3" "anonymous function" nil nil nil nil nil nil)
                       ("fe" "forEach(function ($1) {\n$0\n})$2\n" "fe" nil nil nil nil nil nil)
                       ("for" "var ${1:i}, len = $3.length;\nfor ($1 = ${2:0}; $1 < len; $1++) {\n  $4\n}\n" "for" nil nil nil nil nil nil)
                       ("if" "if (${1}) {\n$0\n}\n" "if" nil nil nil nil nil nil)
                       ("ng1" "['$1', function ($1) {\n$0\n}]\n" "ng injection 1" nil nil nil nil nil nil)
                       ("ng2" "['$1', '$2', function ($1, $2) {\n$0\n}]\n" "ng injection 2" nil nil nil nil nil nil)
                       ("ng3" "['$1', '$2', '$3', function ($1, $2, $3) {\n$0\n}]\n" "ng injection 3" nil nil nil nil nil nil)
                       ("ng4" "['$1', '$2', '$3', '$4', function ($1, $2, $3, $4) {\n$0\n}]\n" "ng injection 4" nil nil nil nil nil nil)
                       ("r" "var ${1:$(s-lower-camel-case (file-name-nondirectory yas/text))} = require('$1');$0" "require" nil nil nil nil nil nil)
                       ("r_" "var _ = require('lodash');$0" "require lodash" nil nil nil nil nil nil)
                       ("r$" "var $ = require('jquery');$0" "require jquery" nil nil nil nil nil nil)
                       ("us" "'use strict';$0" "use strict" nil nil nil nil nil nil)
                       ("v" "var $1 = $0\n" "var" nil nil nil nil nil nil)
                       ("while" "\nwhile ($1) {\n$0\n}\n" "while" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Nov 27 16:59:07 2014
