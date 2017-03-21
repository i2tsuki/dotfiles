;;; package-bundle.el - bundle packages for my local emacs

;;; Code:
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)

(setq el-get-dir (locate-user-emacs-file "elisp"))
(add-to-list 'load-path (locate-user-emacs-file "elisp"))
(setq el-get-verbose t)
(setq el-get-default-process-sync t)

(el-get-bundle elpa:ddskk)
(el-get-bundle elpa:color-theme-github)
(el-get-bundle elpa:concurrent)
(el-get-bundle elpa:rustfmt)
(el-get-bundle elpa:company-racer)

;; Before executing the following command install clang package
(irony-install-server "cmake -DCMAKE_INSTALL_PREFIX\=/home/kinoo/.emacs.d/irony/ /home/kinoo/.emacs.d/elisp/irony-mode/server && cmake --build . --use-stderr --config Release --target install")
