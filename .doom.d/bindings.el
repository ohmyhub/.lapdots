;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

(map! :leader
      :desc "Open config.org" :n                        "f k"   #'org-open-config-file          ; open my literate config
      :desc "Ace window" :n                             "w a"   #'ace-window                    ; easy access to ace-window
      (:prefix ("k" . "Grab Bag")                                                               ; my custom leader prefix
       :desc "Export pdf" :n                            "e"      #'org-latex-export-to-pdf      ; quick and dirty pdf export
       :desc "File from Deft dir" :n                    "d"      #'deft-find-file               ; use deft to quickly search ~/.../Org
       :desc "New empty ORG buffer" :n                  "g"      #'evil-buffer-org-new          ; open a new org buffer
       :desc "Paste as a subtree heading" :n            "o"      #'org-paste-subtree            ; quickly paste text as subtree
       :desc "Paste from clipboard" :n                  "p"      #'clipboard-yank               ; my C-v
       :desc "Ranger in emacs" :n                       "r"      #'ranger                       ; go go dired-ranger
       :desc "Insert today's date" :n                   "t"      #'today                        ; insert my flavor of date
       :desc "Copy region into kill ring" :n            "c"      #'copy-region-as-kill          ; quick copy without cutting
       :desc "Evaluate buffer and reload fonts" :n      "v"      #'evig                         ; eval buffer and reload fonts
       :desc "Activate webjump" :n                      "w"      #'webjump                      ; select url from list and open in web browser
       :desc "Scroll other window down" :n              "J"      (lambda () (interactive) (scroll-other-window 5))
       :desc "Scroll other window up" :n                "K"      (lambda () (interactive) (scroll-other-window -5))))
