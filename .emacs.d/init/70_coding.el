;;; 70_coding.el - Mode configure in coding

;;; Code:
;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;     '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;;; Agda-mode
(load-library "agda2")

;;; C/Cpp mode
;;; Warning: Its configure is too old.  Update to use this.
(require 'auto-complete-clang)
;; Configure pre-compile header
(defun my-ac-clang-setup ()
  (setq ac-auto-start nil)
  (setq ac-quick-help-delay 0.5)
  (setq ac-clang-prefix-header "~/.emacs.d/stdafx.pch")
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources))
  (setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
/usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4
/usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/x86_64-pc-linux-gnu
/usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include/g++-v4/backward
/usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include
/usr/local/include
/usr/lib/gcc/x86_64-pc-linux-gnu/4.6.3/include-fixed
/usr/include
"
               )))
  (add-to-list 'ac-sources ac-source-clang))
;; Add hooks to original mode
(add-hook 'c-mode-hook 'my-ac-clang-setup)
(add-hook 'c++-mode-hook 'my-ac-clang-setup)

;;; Ebuild-mode
(add-to-list 'load-path "@SITELISP@")
(autoload 'ebuild-mode "ebuild-mode" nil t)
(add-to-list 'auto-mode-alist
	     '("\\.\\(ebuild\\|eclass\\|eblit\\)\\'" . ebuild-mode))
(autoload 'gentoo-newsitem-mode "gentoo-newsitem-mode" nil t)
(add-to-list 'auto-mode-alist
	     '("/[0-9]\\{4\\}-[01][0-9]-[0-3][0-9]-.+\\.[a-z]\\{2\\}\\.txt\\'"
	       . gentoo-newsitem-mode))
(add-to-list 'interpreter-mode-alist '("runscript" . sh-mode))
(modify-coding-system-alist 'file "\\.\\(ebuild\\|eclass\\|eblit\\)\\'" 'utf-8)

;;; Go-mode
(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-eldoc)
(add-hook 'before-save-hook 'gofmt-before-save)

;;; Haskell-mode
(require 'haskell-mode)
(require 'haskell-cabal)
(require 'ghc)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
(defvar haskell-program-name "/usr/bin/ghci")
(defvar haskell-ghci-command "main")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-font-lock)
;; Auto complete for ghc mod
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(defun my-ac-haskell-mode ()
  (defvar ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod)))
(add-hook 'haskell-mode-hook 'my-ac-haskell-mode)

;;; Java-mode
(add-hook 'java-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (defvar c-basic-offset 4)))

;;; Php-mode
(require 'php-mode)

;;; Rust-mode
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(define-key global-map (kbd "C-c C-f") #'rustfmt-format-buffer)
(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
