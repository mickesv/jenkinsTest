(message "==> Initialising Emacs...")
(message (version))
(prefer-coding-system 'utf-8)

;; Working directories
(setq dir-base "/root/")
(message (concat "Base Dir is" dir-base))

(setq dir-source (concat dir-base "Sprints")
      dir-pub (concat dir-base "Sprints"))

;; Set up package install
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(message "==> Bootstrap Use-Package...")
(unless (package-installed-p 'use-package)
  (message "Refreshing...")
  (package-refresh-contents)
  (message "Installing...")
  (package-install 'use-package))

(message "Loading...")
(require 'use-package)

(message "==> Loading org-mode...")

(use-package org
  :ensure t
  :config
  (progn
    (message "Org-mode loaded.")
    (message (org-version))

    (message "==> Setting up Org-Babel...")
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
       (ditaa . t)
       (dot . t)
       ))

    ;; (setq org-plantuml-jar-path
    ;; 	  (expand-file-name "~/.emacs.d/external/plantuml/plantuml.jar")) ;; TODO add script to install these
    ;; (setq org-ditaa-jar-path
    ;; 	  (expand-file-name "/usr/local/Cellar/ditaa/0.9/libexec/ditaa0_9.jar"))
    
    (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
    (setq org-export-babel-evaluate nil)

    ;; TODO Fix this
    ;; Project exports

    (message "==> Set up ox-publish...")
    
    (require 'ox-publish)
    (setq org-publish-project-alist
	  `(("sprint-notes"
	     :base-directory ,dir-source
	     :base-extension "org"
	     :publishing-directory ,dir-pub
	     :recursive t
	     :publishing-function org-html-publish-to-html
	     :headline-levels 4             ; Just the default for this project.
	     :auto-preamble t
	     )
	    ("sprint-static"
	     :base-directory ,dir-source
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	     :publishing-directory ,dir-pub
	     :recursive t
	     :publishing-function org-publish-attachment
	     )
	    ("sprints" :components ("sprint-notes" "sprint-static"))))

))

(message "==> Exporting...")
(org-publish-project "sprints")
