;;; 00_init.el - Initialize configure

;;; Code:
(cd "~/")
(setq visible-bell t)
(add-to-list 'default-frame-alist '(alpha . 70))
(column-number-mode 1)
(tool-bar-mode -1)
(menu-bar-mode 0)
(global-auto-revert-mode t)

(toggle-scroll-bar nil)
(setq mouse-wheel-follow-mouse nil)
(show-paren-mode t)
(defvar show-paren-style 'expression)
(add-to-list 'default-frame-alist '(cursor-type . 'hbar))
(setq completion-ignore-case t)
(setq visible-bell t)
;; (setq ring-bell-function 'ignore)
(setq initial-frame-alist default-frame-alist)
(setq indent-tabs-mode nil)
(setq frame-title-format "%b")
(file-name-shadow-mode t)

;; Create swap file in `~/.emacs.d/.backup`
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
(setq truncate-lines t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'right)
(auto-image-file-mode t)

;; Dired configure
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-alhgX")
