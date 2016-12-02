;;; 70_latex.el - LaTeX configure

;;; Code:
(defvar TeX-default-mode 'japanese-latex-mode)
(defvar japanese-LaTeX-default-style "jsarticle")
(defvar TeX-engine-alist
  '((ptex "pTeX" "eptex" "platex" "eptex")
    (jtex "jTeX" "jtex" "jlatex" nil)
    (uptex "upTeX" "euptex" "uplatex" "euptex")))
(defvar TeX-engine 'ptex)
(defvar TeX-view-program-list
  '(("qpdfview" "qpdfview --unique \"%o#src:%b:%n:0\"")
    ("acroread" "acroread %o")
    ("pdfopen" "pdfopen -viewer ar9-tab %o")))
(defvar TeX-view-program-selection '((output-dvi "pxdvi")))

(defvar preview-image-type 'dvipng)
(defvar TeX-source-correlate-method 'synctex)
(defvar TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(defvar TeX-command-list '())
(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                      (add-to-list 'TeX-command-list
                                   '("Latexmk" "latexmk %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk"))
                      (add-to-list 'TeX-command-list
                                   '("Latexmk1" "latexmk -e '$latex=q/platex %S %(mode)/' -e '$bibtex=q/pbibtex/' -e '$makeindex=q/mendex/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
                                     TeX-run-TeX nil (latex-mode) :help "Run Latexmk1"))
                      (add-to-list 'TeX-command-list
                                   '("pdfpLaTeX" "platex %S %(mode) %t && dvipdfmx %d"
                                     TeX-run-TeX nil (latex-mode) :help "Run pLaTeX and dvipdfmx"))
                      (add-to-list 'TeX-command-list
                                   '("pBibTeX" "pbibtex %s"
                                     TeX-run-BibTeX nil t :help "Run pBibTeX"))
                      (add-to-list 'TeX-command-list
                                   '("Evince" "evince %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Evince"))
                      (add-to-list 'TeX-command-list
                                   '("acroread" "acroread %s.pdf"
                                     TeX-run-discard-or-function t t :help "Run Adobe Reader")))))

(setq auto-mode-alist
      (cons '("\\.tex$" . LaTeX-mode) auto-mode-alist))
