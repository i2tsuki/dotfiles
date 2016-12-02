;;; 06_delete_whitespace.el - Deleting discard whitespace

;;; Code:
(setq delete-trailing-whitespace-exclude-patterns (list "\\.md$" "\\.markdown$"))

(defun delete-trailing-whitespace-with-exclude-pattern ()
  (interactive)
  (cond ((equal nil (loop for pattern in delete-trailing-whitespace-exclude-patterns
                          thereis (string-match pattern buffer-file-name)))
         (delete-trailing-whitespace))))
(add-hook 'before-save-hook 'delete-trailing-whitespace-with-exclude-pattern)

(defun my-delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))
(add-hook 'before-save-hook 'my-delete-trailing-blank-lines)

;; Text adjust configure
(require 'text-adjust)
(defun text-adjust-space-before-save-if-needed ()
  (when (memq major-mode
              '(org-mode mew-draft-mode TeX-mode tex-mode LaTeX-mode latex-mode))
    (text-adjust-space-buffer)))
(defalias 'spacer 'text-adjust-space-buffer)
(add-hook 'before-save-hook 'text-adjust-space-before-save-if-needed)
