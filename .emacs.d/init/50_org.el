;;; 50_org.el - Org mode configure

;;; Code:
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/main.org")
(setq org-agenda-files (list org-default-notes-file ))
(setq org-log-done t)
(setq org-use-fast-todo-selection t)
(setq org-startup-truncated nil)


(define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(require 'org-install)

;; Display bullet for org
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Org-mode export hatena diary description
(require 'org-install)
