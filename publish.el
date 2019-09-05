(require 'ox)
(require 'ox-publish)
(require 'ox-beamer)
(require 'ox-latex)
(require 'ox-html)

(defvar pdf-dir
  (concat default-directory "pdf/"))

(defvar presentation-dir
  (concat default-directory "presentation/"))

(defvar html-dir
  (concat default-directory "html/"))

(setq
 org-publish-timestamp-directory
 (concat default-directory ".timestamps/"))

(setq make-backup-files nil)

(setq org-export-with-toc nil)

(setq
 org-publish-project-alist
 `(("pdf"
    :base-directory ,pdf-dir
    :base-extension "org"
    :publishing-directory ,pdf-dir
    :publishing-function org-latex-publish-to-pdf
    )
   ("presentation"
    :base-directory ,presentation-dir
    :base-extension "org"
    :publishing-directory ,presentation-dir
    :publishing-function org-beamer-publish-to-pdf
    )
   ("html"
    :base-directory ,html-dir
    :base-extension "org"
    :publishing-directory ,default-directory
    :publishing-function org-html-publish-to-html
    )
   ))

(org-publish-all)
