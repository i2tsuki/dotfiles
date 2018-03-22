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

(load (locate-user-emacs-file "load-path.el"))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay nil)
 '(custom-safe-themes
   (quote
    ("dc758223066a28f3c6ef6c42c9136bf4c913ec6d3b710794252dc072a3b92b14" default)))
 '(package-selected-packages
   (quote
    (company-racer ox-qmd concurrent color-theme-github ddskk)))
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
