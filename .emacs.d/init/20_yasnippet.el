;;; 20_yasnippet.el - yasnippet configure

;;; Code:
(require 'yasnippet)
;; Initial snippet dir setup
(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet/" 
        ))
(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))

(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
