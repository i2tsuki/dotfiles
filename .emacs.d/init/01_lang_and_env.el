;;; 01_lang_and_env.el - Language and environment setup

;;; Code:
(setq system-time-locale "C")
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8-unix)
(setq buffer-file-coding-system 'utf-8-unix)

;; Emacs environment
(setenv "PATH"
	(concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH"
 	(concat "/usr/local/sbin:" (getenv "PATH")))
(setenv "PATH"
 	(concat (getenv "HOME") "/.cabal/bin" ":" (getenv "PATH")))
(setenv "PATH"
 	(concat (getenv "HOME") "/.cargo/bin" ":" (getenv "PATH")))
(setenv "PATH"
 	(concat (getenv "HOME") "/.go/bin" ":" (getenv "PATH")))

(setenv "LANG" "en_US.utf-8")
(setq browse-url-browser-function 'browse-url-generic)
(defvar browse-url-generic-program "firefox-bin")

;; Get exec PATH from shell
;; (require 'exec-path-from-shell)

;; (defun set-exec-path-from-shell-PATH ()
;;   (interactive)
;;   (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (set-exec-path-from-shell-PATH)
;; (exec-path-from-shell-initialize)

;; Exec path configure
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'exec-path (concat (getenv "HOME") "/.cargo/bin"))
(add-to-list 'exec-path (concat (getenv "HOME") "/.go/bin"))
(add-to-list 'exec-path "/usr/local/bin")
