;;; 70_conf.el - Mode configure in conf

;;; Code:
;;; Dockerfile-mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
