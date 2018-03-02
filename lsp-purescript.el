;;; lsp-purescript.el --- Purescript support for lsp-mode

;; Author: Matthew Chan <matt@themattchan.com>
;; Version: 1.0
;; Package-Requires: ((lsp-mode "3.0") (purescript-mode "1.0"))
;; Keywords: purescript
;; URL: https://github.com/themattchan/lsp-purescript

(require 'lsp-mode)

;; assumes that purescript-language-server is installed globally
;; https://github.com/nwolverson/purescript-language-server

;; enable it thusly:
;; (add-hook 'purescript-mode #'lsp-purescript-enable)

(lsp-define-stdio-client lsp-purescript ; name
                         "purescript"   ; language-id
                         (lsp-make-traverser #'(lambda (dir) ; get-root
                                                 (directory-files
                                                  dir
                                                  nil
                                                  "\\(package\\|bower\\)\\.json")))
                         '("purescript-language-server" "--stdio")
                         )
