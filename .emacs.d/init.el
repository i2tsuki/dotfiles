;;; init.el - Initial configure

;;; Code:
(require 'site-gentoo)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq load-path
      (append '("~/.emacs.d/auto-install")
              load-path))
(setq load-path
      (append '("~/.cabal/share/x86_64-linux-ghc-7.10.3/Agda-2.5.1.1/emacs-mode")
              load-path))

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
