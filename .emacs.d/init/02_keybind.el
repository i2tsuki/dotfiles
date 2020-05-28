;;; 02_keybind.el - Key binding configure

;;; Code:
(define-key global-map [?¥] [?\\])
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "M-:") 'uncomment-region)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;; Global Keybind
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key (kbd "C-c m") 'mew)
