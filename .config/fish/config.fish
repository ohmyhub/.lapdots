if status is-interactive

    # swayland
    set -gx QT_QPA_PLATFORM wayland-egl
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx MOZ_DBUS_REMOTE 1
    set -gx MOZ_WEBRENDER 1
    set -gx MOZ_ACCELERATED 1
    set -gx XDG_CURRENT_DESKTOP sway
    set -gx XDG_SESSION_DESKTOP sway
    set -gx XDG_SESSION_TYPE wayland
    set -gx CLUTTER_BACKEND wayland
    set -gx ECORE_EVAS_ENGINE wayland-egl
    set -gx ELM_ENGINE wayland_egl
    set -gx SDL_VIDEODRIVER wayland
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx NO_AT_BRIDGE 1
    set -gx STATUSBAR waybar
    set -gx SWAY_CURSOR_SIZE 16

    # hush now
    set -gx fish_greeting ""

    # fzf
    set -gx FZF_DEFAULT_OPTS "--cycle --layout=reverse --border --height=90% --marker='*' --exact"
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

    # ranger
    set -gx RANGER_LOAD_DEFAULT_RC FALSE

    # node
    set -gx npm_config_prefix /home/kevin/.local

    # golang
    set -gx GOPATH /home/kevin/.local/lib/go

    # iGPU
    set -gx LIBVA_DRIVER_NAME iHD
    set -gx VDPAU_DRIVER va_gl

    # user dirs
    set -gx XDG_PUBLICSHARE_DIR /home/kevin
    set -gx XDG_TEMPLATES_DIR /home/kevin
    set -gx XDG_DESKTOP_DIR /home/kevin

    # misc
    set -gx MANPAGER "fish --command 'col --no-backspaces --spaces | bat --language man --plain'" # use bat to colourise man

    # Trying to map the right alt key to Hyper
    set -gx DEVNODE /dev/input/by-path/platform-i8042-serio-0-event-kbd

    # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    # # Catppuccin Color Palette
    # # --> special
    # set -l foreground dadae8
    # set -l selection 3e4058

    # # --> palette
    # set -l teal bee4ed
    # set -l flamingo f2cecf
    # set -l magenta c6aae8
    # set -l pink e5b4e2
    # set -l red e38c8f
    # set -l peach f9c096
    # set -l green b1e3ad
    # set -l yellow ebddaa
    # set -l blue a4b9ef
    # set -l gray 6e6c7e

    # # Syntax Highlighting
    # set -g fish_color_normal $foreground
    # set -g fish_color_command $blue
    # set -g fish_color_param $flamingo
    # set -g fish_color_keyword $red
    # set -g fish_color_quote $green
    # set -g fish_color_redirection $pink
    # set -g fish_color_end $peach
    # set -g fish_color_error $red
    # set -g fish_color_gray $gray
    # set -g fish_color_selection --background=$selection
    # set -g fish_color_search_match --background=$selection
    # set -g fish_color_operator $pink
    # set -g fish_color_escape $flamingo
    # set -g fish_color_autosuggestion $gray
    # set -g fish_color_cancel $red

    # # Prompt
    # set -g fish_color_cwd $yellow
    # set -g fish_color_user $teal
    # set -g fish_color_host $blue

    # # Completion Pager
    # set -g fish_pager_color_progress $gray
    # set -g fish_pager_color_prefix $pink
    # set -g fish_pager_color_completion $foreground
    # set -g fish_pager_color_description $gray

    bass source ~/.profile
    starship init fish | source

end
