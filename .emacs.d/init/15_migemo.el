;;; 15_migemo.el - Migemo configure

;;; Code:
(when (executable-find "cmigemo")
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/migemo/migemo-dict")
  (setq migemo-regex-dictionary nil)
  (setq migemo-pattern-alist-length 1000)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  )

(defvar migemo-coding-system 'utf-8-unix)

;; Helm migemo configure
(defvar helm-use-migemo t)
(helm-migemo-mode 1)
;; 候補が表示されないときがあるので migemo らないように設定
;; (defadvice helm-c-apropos
;;   (around ad-helm-apropos activate)
;;   (let ((helm-use-migemo nil))
;;     ad-do-it))
;; (defadvice helm-M-x
;;   (around ad-helm-M-x activate)
;;   (let ((helm-use-migemo nil))
;;     ad-do-it))

(migemo-init)
