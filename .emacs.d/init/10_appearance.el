;;; 10_appearance.el - GUI appearance configure

;;; Code:
;; Fonts configure
(if window-system (progn
		    (create-fontset-from-ascii-font "Inconsolata-12:weight=Medium" nil "Inconsolata")
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
(require 'color-theme)
(setq color-theme-load-all-themes nil)
(require 'color-theme-github)

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
