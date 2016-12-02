;;; 10_helm.el - helm configure

;;; Code:
(require 'helm-config)
(require 'helm-command)

(setq helm-candidate-number-limit 100)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-'") 'helm-resume)
(define-key global-map (kbd "C-s") 'helm-occur)
(define-key global-map (kbd "M-z") 'helm-do-grep)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

(helm-mode 1)
