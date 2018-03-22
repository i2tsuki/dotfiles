;;; 10_appearance.el - GUI appearance configure

;;; Code:
;; Fonts configure
(if window-system (progn
		    (create-fontset-from-ascii-font "Inconsolata-15:weight=Medium" nil "Inconsolata")
		    (set-fontset-font "fontset-Inconsolata"
				      'unicode
				      (font-spec :family "Ricty Diminished")
				      nil
				      'append)
		    (set-fontset-font "fontset-Inconsolata"
				      'unicode
				      (font-spec :family "Noto Emoji")
				      nil
				      'append)
		    (add-to-list 'default-frame-alist '(font . "fontset-Inconsolata"))))
;; Fonts decolation
(defvar w32-enable-synthesized-fonts t)
(setq-default line-spacing 0.16)

;; Color Theme
(if window-system (progn
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "gray15"))
  (add-to-list 'default-frame-alist '(cursor-color . "SlateBlue2"))
  (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
  (set-face-foreground 'mode-line "white")
  (set-face-background 'mode-line "MediumPurple2")
  (set-face-background 'region "LightSteelBlue1")
  (set-face-foreground 'mode-line-inactive "gray30")
  (set-face-background 'mode-line-inactive "gray85")
))
(load-theme 'github t t)

;; Stripe buffer
(require 'stripe-buffer)
(add-hook 'dired-mode-hook 'turn-on-stripe-buffer-mode)
(add-hook 'org-mode-hook 'turn-on-stripe-table-mode)

;; Yascroll Configure
(require 'yascroll)
(global-yascroll-bar-mode 1)

;; Hi-light line
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#88FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(defvar hl-line-face 'hlline-face)
(global-hl-line-mode)

;; Powerline
(require' powerline)
(powerline-default-theme)
(defvar ns-use-srgb-colorspace nil)

;; Popwin
(defun my/popwin-helm-p (buffer)
  (let ((name (buffer-name buffer)))
    (unless (string= name "*helm-mode-execute-extended-command*")
      (string-match-p "Helm" buffer))))
(if (require 'popwin nil t)
    (progn
      (defvar display-buffer-function 'popwin:display-buffer)
      (defvar popwin:popup-window-height 0.24)
      (defvar popwin:close-popup-window-timer-interval 0.5)
      (push '(my/popwin-helm-p :position bottom :height 0.4) popwin:special-display-config)
      (push '(dired-mode :position top) popwin:special-display-config)
      (push '("\\*[Vv][Cc]" :regexp t :position top) popwin:special-display-config)
      (push '("\\*git-" :regexp t :position top) popwin:special-display-config)
      ))

;; Nyan-mode
(require 'nyan-mode)
(nyan-mode 1)
(nyan-toggle-wavy-trail)
