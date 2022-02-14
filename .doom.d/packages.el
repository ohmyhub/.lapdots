;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; org packages
(unpin! org)
(package! mixed-pitch)
(package! company-org-block)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

(package! elfeed-dashboard
  :recipe (:host github
           :repo "Manoj321/elfeed-dashboard"))

;; colorize color names in the buffer
(package! rainbow-mode)

;; hot fresh themes
(unpin! doom-themes)

;; hot fresh terminal
(unpin! vterm)

;; avoiding dired-git-info error because it annoys me
(unpin! dired-git-info)

;; reading log files
(package! logview)

;; don't allow native compilation
(package! with-editor :recipe (:build (:not native-compile)))
(package! vterm :recipe (:build (:not native-compile)))
(package! evil-collection :recipe (:build (:not native-compile)))
