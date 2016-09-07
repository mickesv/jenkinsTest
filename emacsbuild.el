(princ "Initialising Emacs...")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; Other package archives:
;;  (("gnu" . "http://elpa.gnu.org/packages/")
;;   ("marmalade" . "http://marmalade-repo.org/packages/") ))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(princ "Loading org-mode...")

(use-package org
  :ensure t
  :config
  (progn
    ;; Org-babel
    (setq org-src-fontify-natively t)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((plantuml . t)
       (java . t)
       (C . t)
       (lisp . t)
       (emacs-lisp . t)
       (R . t)
       (shell . t)
       (ditaa . t)
       (dot . t)
       ))
    (setq org-plantuml-jar-path
	  (expand-file-name "~/.emacs.d/external/plantuml/plantuml.jar")) ;; TODO add script to install these
    (setq org-ditaa-jar-path
	  (expand-file-name "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar"))
    
    (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
    (setq org-export-babel-evaluate nil)

    ;; TODO Fix this
    ;; Project exports
    (require 'ox-publish)
    (setq org-publish-project-alist
	  '(("agile-notes"
	     :base-directory "~/Documents/Teaching/PROMPT/Agile_Lean/Course_Material/Version3/"
	     :base-extension "org"
	     :publishing-directory "~/Documents/Teaching/A_Publish/AgileLean/"
	     :recursive t
	     :publishing-function org-html-publish-to-html
	     :headline-levels 4             ; Just the default for this project.
	     :auto-preamble t
	     )
	    ("agile-static"
	     :base-directory "~/Documents/Teaching/PROMPT/Agile_Lean/Course_Material/Version3/"
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	     :publishing-directory "~/Documents/Teaching/A_Publish/AgileLean/"
	     :recursive t
	     :publishing-function org-publish-attachment
	     )
	    ("agile" :components ("agile-notes" "agile-static"))))

))
