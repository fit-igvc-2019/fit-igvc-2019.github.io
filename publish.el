(require 'ox)
(require 'ox-publish)
(require 'ox-beamer)
(require 'ox-latex)
(require 'ox-html)

(defvar org-dir
  (concat default-directory "org/"))

(setq
 org-publish-timestamp-directory (concat default-directory ".timestamps/")
 make-backup-files nil
 org-export-with-toc nil
 org-export-with-date nil)

(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))

(setq org-latex-classes
      '(("beamer" "\\documentclass[presentation]{beamer}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
        ("article" "\\documentclass[12pt]{article}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

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

(shell-command (format "find %s -type f -not -iname \"*org\" -exec rm '{}' \\;" org-dir))
