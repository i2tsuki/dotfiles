;;; 70_scheme.el - scheme-mode configure

;;; Code:
(defvar scheme-program-name "/usr/bin/gosh")
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(define-key global-map "\C-cs" 'run-scheme)
;; 起動画面を表示しない
(setq inhibit-startup-message t)
