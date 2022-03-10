;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; who am I
(setq user-full-name "Kevin Ward"
      user-mail-address "k.warden.89@gmail.com")

;; choose your fonts!
(setq doom-font (font-spec :family "Bespoke Iosevka Mono" :size 22 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font" :size 20 :weight 'medium)
      doom-unicode-font (font-spec :family "Noto Color Emoji")
      doom-serif-font (font-spec :family "BlexMono Nerd Font" :weight 'light))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  '(org-verse :slant italic))

(setq org-fontify-quote-and-verse-blocks t)

;; we snazzy
(setq doom-theme 'doom-snazzy)

;; fancy splash screen image
(setq fancy-splash-image "~/Pictures/unbridled-unicorn.png")

;; simplify the startup screen
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; where the org at?
(setq org-directory "~/Dropbox/Org/")

;; where ever I may roam
(setq org-roam-directory "~/Dropbox/Roam/")
(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

;; I don't care about line numbers
(setq display-line-numbers-type nil)

(setq evil-move-beyond-eol t)           ; let me go where I want to go!
(setq evil-move-cursor-back nil)        ; don't move my cursor around!

;; better defaults
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t                               ; Stretch cursor to the glyph width
 uniquify-buffer-name-style 'forward)

;; mash jk without thinking
(setq evil-escape-unordered-key-sequence t)

;; more better defaults
(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"               ; Unicode ellispis are nicer than "...", and also save /precious/ space
      scroll-margin 2                             ; It's nice to maintain a little margin
      inhibit-compacting-font-caches t)

;; add padding and height to the modeline
(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(bar workspace-name window-number modals matches follow buffer-info remote-host buffer-position word-count parrot selection-info)
    '(objed-state misc-info persp-name battery grip irc mu4e gnus github debug repl lsp minor-modes input-method indent-info buffer-encoding major-mode process vcs checker "  ")))

(setq doom-modeline-height 40)

;; what time is it?
(display-time-mode 1)
(setq display-time-load-average nil)

;; which key? this one.
(setq which-key-idle-delay 0.0)
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))

;; all of them!
(setq avy-all-windows t)

;; Make the ace window number easier to see
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "#f7768e"
    :weight bold :height 1.0 :box (:line-width 10 :color "#f7768e")))

;; do the splits
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

;; I like prompt prompts
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.0)
(setq company-tooltip-align-annotations t)
(setq company-selection-wrap-around t)

;; My default image directory. It's literally the name of the variable.
(setq my-default-image-directory "~/Dropbox/Org/linked-images/")

;; Function to aid in inserting org-mode image links.
(defun insert-image-org-link (img caption)
  "Insert an org image link, choosing the file with completion
and starting from `my-default-image-directory'. This prompts for
an optional caption (leave it empty for no caption)."
  (interactive
   (list (read-file-name
          "Image: " my-default-image-directory nil t nil
          (lambda (name)
            (or (directory-name-p name)
                (member (file-name-extension name)
                        image-file-name-extensions))))
         (read-string "Caption: ")))
  (insert
   (if (string-empty-p caption)
       (format "[[%s]]" img)
     (format "#+caption: %s\n[[%s]]" caption img))))

(defun kev/get-timestamp ()
  "Calls org-time-stamp with 2 prefix arguments"
  :repeat nil
  (interactive)
  (org-time-stamp '(16) t))

;; a function to see my font tweaks quickly
(defun evig ()
  "Evaluate the current buffer and reload fonts."
  (interactive)
  (eval-buffer)
  (doom/reload-font))

;; what day is it?
(defun today ()
  "Insert string for today's date nicely formatted as yyyy-MM-dd, Day of the Week"
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%Y-%m-%d, %A")))

;; create new empty org-mode buffer
(evil-define-command evil-buffer-org-new (count file)
  "Creates a new ORG buffer replacing the current window, optionally
   editing a certain FILE"
  :repeat nil
  (interactive "P<f>")
  (if file
      (evil-edit file)
    (let ((buffer (generate-new-buffer "*new org*")))
      (set-window-buffer nil buffer)
      (with-current-buffer buffer
        (org-mode)))))

;; my pitches getting all mixed up
(defvar mixed-pitch-modes '(org-mode LaTeX-mode markdown-mode gfm-mode Info-mode)
  "Modes that `mixed-pitch-mode' should be enabled in, but only after UI initialisation.")
(defun init-mixed-pitch-h ()
  "Hook `mixed-pitch-mode' into each mode in `mixed-pitch-modes'.
Also immediately enables `mixed-pitch-modes' if currently in one of the modes."
  (when (memq major-mode mixed-pitch-modes)
    (mixed-pitch-mode 1))
  (dolist (hook mixed-pitch-modes)
    (add-hook (intern (concat (symbol-name hook) "-hook")) #'mixed-pitch-mode)))
(add-hook 'doom-init-ui-hook #'init-mixed-pitch-h)

;; red is too aggressive, so let's make it orange
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; tecos pdf modeline
(after! (pdf-tools doom-modeline)
  (doom-modeline-def-segment pdf-icon
    (concat
     (doom-modeline-spc)
     (doom-modeline-icon 'octicon "file-pdf" nil nil
                         :face (if (doom-modeline--active)
                                   'all-the-icons-red
                                 'mode-line-inactive)
                         :v-adjust 0.02)))

  (doom-modeline-def-segment buffer-name
    (concat
     (doom-modeline-spc)
     (doom-modeline--buffer-name)))

  (defun doom-modeline-update-pdf-pages ()
    "Update PDF pages."
    (setq doom-modeline--pdf-pages
          (concat " P"
                  (number-to-string (eval `(pdf-view-current-page)))
                  (propertize (concat "/" (number-to-string (pdf-cache-number-of-pages))) 'face 'doom-modeline-buffer-minor-mode))))

  (doom-modeline-def-segment pdf-pages
    "Display PDF pages."
    (if (doom-modeline--active) doom-modeline--pdf-pages
      (propertize doom-modeline--pdf-pages 'face 'mode-line-inactive)))

  (doom-modeline-def-modeline 'pdf
    '(bar window-number matches pdf-pages pdf-icon buffer-name)
    '(misc-info major-mode process vcs))

  (defun doom-set-pdf-modeline-h ()
    "sets the pdf modeline"
    (doom-modeline-set-modeline 'pdf))

  (add-hook! 'pdf-view-mode-hook 'doom-set-pdf-modeline-h))

;; keybinds
(load! "bindings")

;; abbrev mode definitions
(load! "abbrev")

;; stay out of my personal space
(setq org-cycle-separator-lines -1)

;; my org document wants to have a Word with you
(use-package! org-pandoc-import :after org)

;; this is a priorities
(after! org
  (setq org-priority-faces
        '((65 :foreground "red" :weight bold)
          (66 :foreground "orange" :weight bold)
          (67 :foreground "yellow" :weight bold)
          (68 :foreground "blue" :weight normal))
        org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL")
        org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)" "REMINDER(r)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#34f455" :weight bold :underline t)
          ("INPROGRESS" :foreground "#f4f434" :weight normal :underline t)
          ("WAIT" :foreground "#83cec8" :weight normal :underline nil)
          ("DONE" :foreground "#a98bf4" :weight normal :strike-through t)
          ("CANCELLED" :foreground "#818178" :weight normal :strike-through t)
          ("REMINDER" :foreground "#8DDFF3" :weight normal :underline nil))))

;; you got custom on my face
(custom-set-faces!
  '(outline-1 :weight extra-bold :height 1.4)
  '(outline-2 :weight bold :height 1.2)
  '(outline-3 :weight bold :height 1.15)
  '(outline-4 :weight semi-bold :height 1.10)
  '(outline-5 :weight semi-bold :height 1.08)
  '(outline-6 :weight semi-bold :height 1.05)
  '(outline-8 :weight semi-bold)
  '(outline-9 :weight semi-bold))

(custom-set-faces!
  '(org-document-title :height 1.5))

;; so pretty
(add-hook 'org-mode-hook #'+org-pretty-mode)

;; you're a superstar!
(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "•" "◆" "✜" "✤" "▹")
        org-superstar-prettify-item-bullets t ))

;; more fancy please
(setq org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest ?A
      org-priority-lowest ?E
      org-priority-faces
      '((?A . 'all-the-icons-red)
        (?B . 'all-the-icons-orange)
        (?C . 'all-the-icons-yellow)
        (?D . 'all-the-icons-green)
        (?E . 'all-the-icons-blue)))

;; More. Fancy.
(add-hook! org-mode 'org-fancy-priorities-mode)

;; get out of my face stars
(setq org-hide-leading-stars t)

;; you will stay hidden until I summon you
(use-package! org-appear
  :after org
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t))

;; blocks of code
(use-package! company-org-block
  :after org
  :config
  (setq company-org-block-edit-style 'auto))

(after! org
  (set-company-backend! 'org-mode-hook '(company-org-block company-capf)))

;; set defaults for opening files
(setq org-file-apps
      '((remote . emacs)
        (auto-mode . emacs)
        (directory . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . default)
        ("\\.epub\\'" . "foliate %s")))

;; I can see colors
(add-hook! org-mode 'rainbow-mode)
(add-hook! prog-mode 'rainbow-mode)

;; Not all the agendas
(setq org-agenda-files '("~/Dropbox/Org/manage-self.org"))

;; rust language config
(after! rustic
  (setq rustic-lsp-server 'rls))

;; Stop trying to format my shitty C code
(setq +format-on-save-enabled-modes
      '(not c-mode
            make-mode))

;; Feed me
(after! elfeed
  (setq elfeed-search-filter "@2-month-ago +unread"))

(setq elfeed-dashboard-file "~/Dropbox/Org/elfeed-dashboard.org")

;; config for org-media-note
(use-package! org-media-note
  :hook (org-mode .  org-media-note-mode)
  :bind (
         ("C-M-s-v" . org-media-note-hydra/body))  ;; Main entrance
  :config
  (setq org-media-note-screenshot-image-dir "~/Pictures/"))  ;; Folder to save screenshot

;; vertico but posframey
(require 'vertico-posframe)
(vertico-posframe-mode 1)

(setq vertico-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))

;; playing with org-volume
(setq org-volume-image-download-method nil)

;; save images to default org image directory
(setq org-download-image-dir "~/Dropbox/Org/linked-images/")

;; let's get spooky… and foxy
(setq spookfox-saved-tabs-target '(file+headline "~/Dropbox/Org/spookfox.org" "Open Tabs"))
(setq spookfox-native-installation-dir "~/.local/bin/")
