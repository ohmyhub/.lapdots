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

;; editing mode for tridactylrc
(package! tridactyl-mode
  :recipe (:host github
           :repo "Fuco1/tridactyl-mode"))

;; control mpv from within emacs
(package! mpv)

;; pretty hydras
(package! pretty-hydra)

;; taking notes on my media
(package! org-media-note :recipe (:host github :repo "yuchen-lea/org-media-note"))

;; I read a book once
(package! org-volume :recipe (:host github :repo "akirak/org-volume"))

;; vertico in a childframe
(package! vertico-posframe)

;; focus!
(package! focus)

;; logos package, fresh from prot
(package! logos)

;; don't allow native compilation
(package! with-editor :recipe (:build (:not native-compile)))
(package! vterm :recipe (:build (:not native-compile)))
(package! evil-collection :recipe (:build (:not native-compile)))
