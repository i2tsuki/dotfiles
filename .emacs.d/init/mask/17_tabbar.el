;;; 17_tabbar - tabbar-mode setup

;;; Code:
(if window-system
  (progn (require 'tabbar)
         (when (require 'tabbar nil t)
	   (defvar tabbar-buffer-groups-function
		 (lambda () (list "All Buffers")))
	   (defvar tabbar-buffer-list-function
		 (lambda ()
		   (remove-if
		    (lambda(buffer)
		      ;; No display buffer name that start with '*'
		      (find (aref (buffer-name buffer) 0) " *"))
		    (buffer-list))))
	   (tabbar-mode))
	 (dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
	   (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
	 (defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
	   `(defun ,name (arg)
	      (interactive "P")
	      ,do-always
	      (if (equal nil arg)
		  ,on-no-prefix
		,on-prefix)))
	 (defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
	 (defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
	 (global-set-key (kbd "s-}") 'shk-tabbar-next)
	 (global-set-key (kbd "s-{") 'shk-tabbar-prev)))

(tabbar-mwheel-mode nil)
;; Do not show left button
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; Style and color configure
(set-face-attribute
 'tabbar-default nil
 :background "gray10"
 :foreground "gray10"
 :box '(:line-width 1 :color "gray10" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray10"
 :foreground "white"
 :box '(:line-width 1 :color "gray10" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "orange1"
 :foreground "black"
 :box '(:line-width 1 :color "orange1" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 1 :color "white" :style nil))
(set-face-attribute
 'tabbar-button t
 :box '(:line-width 1 :color "gray10" :style nil))
(set-face-attribute
 'tabbar-separator t
 :background "gray10"
 :height 0.6)

(custom-set-variables
 '(tabbar-separator (quote (1.0))))

(tabbar-mode 1)
