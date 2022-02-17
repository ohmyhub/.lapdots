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

    # iGPU
    set -gx LIBVA_DRIVER_NAME iHD
    set -gx VDPAU_DRIVER va_gl

    # user dirs
    set -gx XDG_PUBLICSHARE_DIR /home/kevin
    set -gx XDG_TEMPLATES_DIR /home/kevin
    set -gx XDG_DESKTOP_DIR /home/kevin

    # misc
    set -gx MANPAGER "fish --command 'col --no-backspaces --spaces | bat --language man --plain'" # use bat to colourise man

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

    bass source ~/.profile
    starship init fish | source

end
