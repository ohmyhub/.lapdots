;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

;; org packages
;;
(unpin! org)

(package! mixed-pitch)

(package! company-org-block)

(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

;; taking notes on my media
(package! org-media-note :recipe (:host github :repo "yuchen-lea/org-media-note"))

;; I read a book once
(package! org-volume :recipe (:host github :repo "akirak/org-volume"))

;; not org packages
;;
;; colorize color names in the buffer
(package! rainbow-mode)

;; hot fresh themes
(unpin! doom-themes)

(package! doom-moonfly-theme
  :recipe (:host github
           :repo "stackmystack/doom-moonfly-theme"))

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

;; emacs somewhere
(package! atomic-chrome)

;; imenu list
(package! imenu-list)

;; debugging fonts
(package! font-lock-studio
  :recipe (:host github
           :repo "Lindydancer/font-lock-studio"))

;; don't allow native compilation
(package! with-editor :recipe (:build (:not native-compile)))
(package! vterm :recipe (:build (:not native-compile)))
(package! evil-collection :recipe (:build (:not native-compile)))
