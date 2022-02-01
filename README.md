<div align="center">

# *Work in Progress*

![Image of Current Configuration](https://raw.githubusercontent.com/ohmyhub/.lapdots/main/misc/images/dumptser-fire.png)

</div>

# Who put all these ⏺'s in my files?

Hello and welcome to this repository of configuration files. You may find
something useful here, or at least be amused by my hamfisted system
configuration. It's hard to make something elegant and efficient when your hands
are made out of greasy hams.

## Table of Contents
-   [System information](#system-information)
-   [Attribution](#attribution)
-   [Desktop Environment](#desktop-environment)
    -   [Sway Window Manager](#sway-window-manager)
    -   [Waybar](#waybar)
    -   [Colorschemes](#colorschemes)
-   [Box of Loose Configuration](#box-of-loose-configuration)
    -   [Ranger File Manager](#ranger-file-manager)
    -   [Mako Notification Daemon](#mako-notification-daemon)
    -   [Tridactyl Firefox Extension](#tridactyl-firefox-extension)
    -   [Zathura Document Viewer](#zathura-document-viewer)

## system Information

-   **Machine** — *Lenovo ThinkPad Yoga 260*
-   **Kernel** — *5.16.4-arch1-1*
-   **Distro** — *Arch Linux*
-   **Window Manager** — *Sway (Wayland)*
-   **Terminal** — *kitty*
-   **Shell** — *fish*


## Attribution

-   Most of what you will find here has been lifted from the dotfiles of others.
    I wish I'd kept better track of all the people I've pilfered from. A list
    that is not exhaustive can be found here:
    -   [@lokesh-krishna](https://github.com/lokesh-krishna/dotfiles)
    -   [@fosskers](https://github.com/fosskers/dotfiles)
    -   [Manjaro Sway Edition](https://github.com/Manjaro-Sway/manjaro-sway)
    -   [EndeavourOS Sway Edition](https://github.com/EndeavourOS-Community-Editions/sway)


## Desktop Environment

### Sway Window Manager
-   I wanted to setup an environment that relied on the Wayland display server
    protocol as much as possible. There are a few things I use that still rely
    on XWayland but I don't want to track those down and list them here.
    
-   This isn't my first time using mostly Wayland native applications or the
    Sway window manager. My desktop PC uses the Manjaro Sway Community Edition
    distribution.
    
-   Before trying this pure Arch setup I tinkered with the EndeavorOS Sway
    distribution on this laptop.
    
-   I really like tiling window managers. I took a few runs at it before it
    stuck but now it feels natural and enjoyable to use.
    
-   Sway's default configuration is robust and useable. It also allows for
    detailed customization.

### Waybar
-   This is what I use instead of the default swaybar. Waybar is a customizable
    statusbar, similar to the MS Windows taskbar, for Sway and other wlroots
    based compositors.

### Colorschemes
-   There is no single unified colorscheme that I use for everything. However,
    the main colorscheme is tokyo-night and I try to use colorschemes that work
    well with that.

## Box of Loose Configuration
-   I don't feel like categorizing these at the moment.

### Ranger File Manager
-   A powerful terminal file manager. It is designed for keyboard navigation and
    has keybinds that are familiar to vim users. One of it's most well known
    features is file previews. You can preview most files. Your code previews
    can have syntax highlighting. You can preview images and have image previews
    for video files. You can show a full preview of a pdf file. It's excellent.

### Mako Notification Daemon
-   This little guy is what I use to get desktop notifications. It's great
    because without it I wouldn't have Discord notifications popping up to
    remind me I need to disable Discord desktop notifications.
    
### Tridactyl Firefox Extension
-  Vim-like keyboard navigation? In my internet browser!? Yes.

### Zathura Document Viewer
-  Minimal document viewer with vim-like keyboard navigation. I'm starting to
   see a pattern.
