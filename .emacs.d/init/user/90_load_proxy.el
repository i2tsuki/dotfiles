;;; user/90_load_proxy.el - Configure to use proxy and connect net

;;; Code:
(defun load-proxy()
  (interactive)
  (let (
	(http_proxy (read-string "Enter your http_proxy address: "))
	(http_proxy_port (read-string "Enter your http_proxy port: "))
	)
    (setq twittering-proxy-use t)
    (setq twittering-proxy-server http_proxy)
    (setq twittering-proxy-port http_proxy_port)
    (setenv "http_proxy" (concat http_proxy ":" http_proxy_port))
    (setenv "https_proxy" (getenv "http_proxy"))
    (setenv "ftp_proxy" (getenv "http_proxy"))
    )
  (message "Load proxy done."))

(defun unload-proxy()
  (interactive)
  (defvar twittering-proxy-use nil)
  (defvar twittering-proxy-server nil)
  (defvar twittering-proxy-port nil)
  (setenv "http_proxy" nil)
  (setenv "https_proxy" nil)
  (setenv "ftp_proxy" nil)
  (message "unload proxy done.")
  )

(global-set-key (kbd "C-c C-t") 'load-proxy)
