(require 'ox)
(require 'ox-publish)
(require 'ox-beamer)
(require 'ox-latex)
(require 'ox-html)

(defvar org-dir
  (concat default-directory "org/"))

(setq
 org-publish-timestamp-directory
 (concat default-directory ".timestamps/"))

(setq make-backup-files nil)

(setq org-export-with-toc nil)

(setq org-export-with-date nil)

(setq
 org-publish-project-alist
 `(("pdf"
    :base-directory ,(concat org-dir "pdf")
    :base-extension "org"
    :publishing-directory ,(concat default-directory "pdf")
    :publishing-function org-latex-publish-to-pdf
    )
   ("presentation"
    :base-directory ,(concat org-dir "presentation")
    :base-extension "org"
    :publishing-directory ,(concat default-directory "presentation")
    :publishing-function org-beamer-publish-to-pdf
    )
   ("html"
    :base-directory ,(concat org-dir "html")
    :base-extension "org"
    :publishing-directory ,default-directory
    :publishing-function org-html-publish-to-html
    )))

(org-publish-all)

(shell-command (concat "bash " default-directory "cleanup.sh"))
