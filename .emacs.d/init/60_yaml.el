;;; 60_yaml.el - Yaml mode configure

;;; Code:
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Auto complete for ansible
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
