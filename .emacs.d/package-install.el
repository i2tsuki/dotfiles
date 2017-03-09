;;; package-install.el - Install packages for my local emacs

;;; Code:
;; el-get initialization
;; (unless (require 'el-get nil 'noerror)
;;   (require 'package)
;;   (add-to-list 'package-archives
;;                '("melpa" . "http://melpa.org/packages/"))
;;   (package-initialize)
;;   (package-install 'el-get)
;;   (require 'el-get)
;;   )

(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)

;; See info to enter "C-u M-x info RET" and view "~/.emacs.d/el-get/el-get/el-get.info"
(setq el-get-sources
      '(
	(:name text-adjust
	     :type http
	     :url "http://rubikitch.com/f/text-adjust.el"
	     )
	(:name mell
	     :type http
	     :url "http://rubikitch.com/f/mell.el"
	     )
	(:name ox-hatena
	     :type http
	     :url "https://raw.githubusercontent.com/akisute3/ox-hatena/master/ox-hatena.el"
	     )
	))

;; (el-get-lock)
;; Use (el-get-lock-checkout) to restore package from ~/.emacs.d/el-get.lock

;; (el-get 'sync)
(setq el-get-dir (locate-user-emacs-file "elisp"))
(add-to-list 'load-path (locate-user-emacs-file "elisp"))
(setq el-get-verbose t)
(setq el-get-default-process-sync t)

;; (el-get 'sync)

(el-get-install "init-loader")

;; ---
;; Documentation
(el-get-install "auctex")

;; ---
;; Auto completion
;; (el-get-install "fuzzy")
(el-get-install "auto-complete")
(el-get-install "popup")
;;(el-get-install "pos-tip")
(el-get-install "company-mode")
(el-get-install "company-quickhelp")

;; ---
;; Appearance
(el-get-install "color-theme")
(el-get-bundle elpa:color-theme-github)

(el-get-install "smooth-scroll")
(el-get-install "smooth-scrolling")

(el-get-install "powerline")

(el-get-install "nyan-mode")

(el-get-install "popwin")

;; Concurrent
;; (el-get-bundle elpa:concurrent)

;; Input Method
(el-get-bundle elpa:ddskk)
(el-get-install "migemo")

;; ---
;; Utilities
(el-get-install "exec-path-from-shell")

(el-get-install "helm")
(el-get-install "helm-c-yasnippet")

(el-get-install "undo-tree")
(el-get-install "stripe-buffer")
(el-get-install "htmlize")
(el-get-install "yasnippet")
(el-get-install "yascroll")
(el-get-install "zlc")

;; mew
(el-get-install "mew")

;; flycheck
(el-get-install "flycheck")
(el-get-install "flycheck-pos-tip")

;; ----
;; Documentation tool
;; markdown-mode
(el-get-install "markdown-mode")

;; org-mode
;; (el-get-install "org")
(el-get-install "org-bullets")
;; (el-get-bundle elpa:http-post-simple)
;; (el-get-bundle elpa:ox-qmd)

;; Markup
(el-get-install "yaml-mode")
(el-get-install "toml-mode")

;; ----
;; Other
(el-get-install "dockerfile-mode")
(el-get-install "nginx-mode")

;; ----
;; Coding
(el-get-install "company-irony")
(el-get-install "irony-mode")

(el-get-install "cperl-mode")

(el-get-install "elpy")

(el-get-install "go-mode")
(el-get-install "go-autocomplete")
(el-get-install "go-eldoc")

;; (el-get-bundle elpa:groovy-mode)

(el-get-install "haskell-mode")
(el-get-install "company-ghc")

(el-get-install "php-mode")

(el-get-install "rust-mode")
;; (el-get-bundle elpa:rustfmt)
(el-get-install "flycheck-rust")
(el-get-install "rust-racer")
;; (el-get-bundle elpa:company-racer)

;; My package recipe installation
(el-get-install "text-adjust")
(el-get-install "mell")
(el-get-install "ox-hatena")

;; Before executing the following command install clang package
(irony-install-server "cmake -DCMAKE_INSTALL_PREFIX\=/home/kinoo/.emacs.d/irony/ /home/kinoo/.emacs.d/elisp/irony-mode/server && cmake --build . --use-stderr --config Release --target install")
