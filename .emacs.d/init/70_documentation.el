;;; 70_documentation.el - Mode configure in documentation

;;; Code:
;; markdown-mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
