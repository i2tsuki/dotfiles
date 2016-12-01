;;; 20_htmlize.el - Zlc mode configure

;;; Code:
(require 'zlc)
(zlc-mode t)

(let ((map minibuffer-local-map))
  (define-key map (kbd "<down>")  'zlc-select-next-vertical)
  (define-key map (kbd "<up>")    'zlc-select-previous-vertical)
  (define-key map (kbd "<right>") 'zlc-select-next)
  (define-key map (kbd "<left>")  'zlc-select-previous)
  (define-key map (kbd "C-c") 'zlc-reset)
  )
