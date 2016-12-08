;;; init.el - Initial configure

;;; Code:
(require 'site-gentoo)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)

(setq el-get-dir (locate-user-emacs-file "elisp"))
(add-to-list 'load-path (locate-user-emacs-file "elisp"))

;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)

;; (load (locate-user-emacs-file "package-install.el"))
(load (locate-user-emacs-file "load-path.el"))

(setq load-path
      (append '("~/.emacs.d/auto-install")
              load-path))
(setq load-path
      (append '("~/.cabal/share/x86_64-linux-ghc-7.10.3/Agda-2.5.1.1/emacs-mode")
              load-path))
(add-to-list 'load-path (locate-user-emacs-file "el-get/text-adjust"))
(add-to-list 'load-path (locate-user-emacs-file "el-get/mell"))

(require 'init-loader)
(init-loader-load "~/.emacs.d/init")
(init-loader-load "~/.emacs.d/init/user")

;; Calculate launch time
(defun my-time-lag ()
  (let* ((now (current-time))
         (min (- (car now) (car my-time-zero)))
         (sec (- (car (cdr now)) (car (cdr my-time-zero))))
         (msec (/ (- (car (cdr (cdr now)))
		     (car (cdr (cdr my-time-zero))))
		  1000))
         (lag (+ (* 60000 min) (* 1000 sec) msec)))
    (message "'.emacs.el' loading time: %d msec." lag)))
(defvar my-time-zero (current-time))
