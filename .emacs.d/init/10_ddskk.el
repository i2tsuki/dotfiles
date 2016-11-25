;;; 10_ddskk.el - ddskk configure

;;; Code:
;; Configure for ddskk
(when (require 'skk nil t)
  (define-key global-map (kbd "C-x j") 'skk-mode)
  (define-key global-map (kbd "C-x C-j") 'skk-mode)
  (defvar skk-byte-compile-init-file t)
  (defvar skk-user-directory "~/.ddskk")
  (defvar skk-isearch-start-mode 'latin)
  (setq skk-preload t))

;; Configure for fyure
(autoload 'fyure:start-fixing "fyure" "An interface to fix Japanese hyoki-yure." t)
