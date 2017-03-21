;;; package-install.el - Install packages for my local emacs

;;; Code:
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)

(setq el-get-dir (locate-user-emacs-file "elisp"))
(add-to-list 'load-path (locate-user-emacs-file "elisp"))
(setq el-get-verbose t)
(setq el-get-default-process-sync t)

;; See info to enter "C-u M-x info RET" and view "~/.emacs.d/el-get/el-get/el-get.info"
(setq el-get-sources
      '(
	(:name text-adjust
	     :type http
	     :url "http://rubikitch.com/f/text-adjust.el"
	     )
	(:name mell
	     :type http
	     :url "http://rubikitch.com/f/mell.el"
	     )
	(:name ox-hatena
	     :type http
	     :url "https://raw.githubusercontent.com/akisute3/ox-hatena/master/ox-hatena.el"
	     )
	))

;; (el-get-lock)
;; Use (el-get-lock-checkout) to restore package from ~/.emacs.d/el-get.lock

;; (el-get 'sync)
(if
    (not (eq (getenv "EL_GET_COMMAND") ""))
    (let (
	  (el-get-command (intern (getenv "EL_GET_COMMAND")))
	  (el-get-package (split-string (getenv "EL_GET_PACKAGE") " " t))
	  )
      (apply el-get-command el-get-package)))
