# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# something I noticed while looking at these dotfiles (https://github.com/SqrtMinusOne/dotfiles/blob/master/.config/qutebrowser/config.py)
from qutebrowser.api import interceptor

def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (url.host() == 'www.youtube.com' and
                    url.path() == '/get_video_info' and
                    '&adformat=' in url.query()):
            info.block()


interceptor.register(filter_yt)

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Automatically start playing `<video>` elements.
# Type: Bool
c.content.autoplay = False

# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set("content.cookies.accept", "all", "chrome-devtools://*")

# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set("content.cookies.accept", "all", "devtools://*")

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")

# User agent to send.
# Type: FormatString
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)

# User agent to send.
# Type: FormatString
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0",
    "https://accounts.google.com/*",
)

# User agent to send.
# Type: FormatString
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)

# Load images automatically in web pages.
# Type: Bool
config.set("content.images", True, "chrome-devtools://*")

# Load images automatically in web pages.
# Type: Bool
config.set("content.images", True, "devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "chrome-devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "chrome://*/*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "qute://*/*")

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set("content.notifications.enabled", False, "https://www.reddit.com")

# Allow pdf.js to view PDF files in the browser. Note that the files can
# still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = True

# Command (and arguments) to use for selecting a single file in forms.
# The command should write the selected file path to the specified file
# or stdout. The following placeholders are defined: * `{}`: Filename of
# the file to be written to. If not contained in any argument, the
# standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.single_file.command = ["kitty", "-e", "ranger", "--choosefile={}"]

# Command (and arguments) to use for selecting multiple files in forms.
# The command should write the selected file paths to the specified file
# or to stdout, separated by newlines. The following placeholders are
# defined: * `{}`: Filename of the file to be written to. If not
# contained in any argument, the   standard output of the command is
# read instead.
# Type: ShellCommand
c.fileselect.multiple_files.command = ["kitty", "-e", "ranger", "--choosefiles={}"]

# Command (and arguments) to use for selecting a single folder in forms.
# The command should write the selected folder path to the specified
# file or stdout. The following placeholders are defined: * `{}`:
# Filename of the file to be written to. If not contained in any
# argument, the   standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.folder.command = ["kitty", "-e", "ranger", "--choosedir={}"]

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}

c.statusbar.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}

# Default zoom level.
# Type: Perc
c.zoom.default = "90"

# Render all web contents using a dark theme.
# Type: Bool
c.colors.webpage.darkmode.enabled = True

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = ["DejaVu Sans"]

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = "14pt"

# My eyes aint so good
c.fonts.web.size.minimum = 14

# I want hints to be uppercase characters
c.hints.uppercase = True

# hint font size
c.fonts.hints = "bold 14px Monospace"

# default search engine
c.url.searchengines = {"DEFAULT": "https://www.google.com/search?q={}"}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ["https://kagi.com/"]

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Load a restored tab as soon as it takes focus
c.session.lazy_restore = True

# general
c.content.default_encoding = "utf-8"
c.content.javascript.can_access_clipboard = True
c.tabs.last_close = "close"

# completion
c.completion.open_categories = ["searchengines", "history"]
c.completion.web_history.max_items = 10
c.completion.height = "25%"
c.completion.delay = 0

# keybindings
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("j", "scroll-px 0 50")
config.bind("k", "scroll-px 0 -50")

# open youtube videos in mpv using the umpv script
config.bind(",M", "hint links spawn --detach umpv --force-window yes {hint-url}")

# hackerman download youtube videos with yt-dlp
config.bind(",y", "hint links spawn -u yt-get {hint-url}")

# download url
config.bind(";D", "hint all userscript url-dl")
config.bind(";i", "hint images userscript url-dl")

# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Tokyo Night scheme by enkia (https://github.com/enkia)

base00 = "#1a1b26"
base01 = "#24283b"
base02 = "#373b41"
base03 = "#b4f9f8"
base04 = "#2ac3de"
base05 = "#7dcfff"
base06 = "#7aa2f7"
base07 = "#ffffff"
base08 = "#f7768e"
base09 = "#ff9e64"
base0A = "#e0af68"
base0B = "#9ece6a"
base0C = "#73daca"
base0D = "#9aa5ce"
base0E = "#bb9af7"
base0F = "#cfc9c2"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base01

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base05

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base02

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = base02

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base02

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = base0B

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = base01

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = base04

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base02

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base05

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0E

# Border color of a warning message.
c.colors.messages.warning.border = base0E

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base03

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base03

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base02

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = base05

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base0D

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base01

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0E

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0D

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base01

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base00

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = base0C

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = base07

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = base0B

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = base07

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = base02

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = base05

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = base02

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = base05

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base05

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = base02

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base05

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = base02

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00

# # base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# # Base16 qutebrowser template by theova
# # Solarized Dark scheme by Ethan Schoonover (modified by aramisgithub)

# base00 = "#002b36"
# base01 = "#073642"
# base02 = "#586e75"
# base03 = "#657b83"
# base04 = "#839496"
# base05 = "#93a1a1"
# base06 = "#eee8d5"
# base07 = "#fdf6e3"
# base08 = "#dc322f"
# base09 = "#cb4b16"
# base0A = "#b58900"
# base0B = "#859900"
# base0C = "#2aa198"
# base0D = "#268bd2"
# base0E = "#6c71c4"
# base0F = "#d33682"

# # set qutebrowser colors

# # Text color of the completion widget. May be a single color to use for
# # all columns or a list of three colors, one for each column.
# c.colors.completion.fg = base05

# # Background color of the completion widget for odd rows.
# c.colors.completion.odd.bg = base01

# # Background color of the completion widget for even rows.
# c.colors.completion.even.bg = base00

# # Foreground color of completion widget category headers.
# c.colors.completion.category.fg = base0A

# # Background color of the completion widget category headers.
# c.colors.completion.category.bg = base00

# # Top border color of the completion widget category headers.
# c.colors.completion.category.border.top = base00

# # Bottom border color of the completion widget category headers.
# c.colors.completion.category.border.bottom = base00

# # Foreground color of the selected completion item.
# c.colors.completion.item.selected.fg = base05

# # Background color of the selected completion item.
# c.colors.completion.item.selected.bg = base02

# # Top border color of the selected completion item.
# c.colors.completion.item.selected.border.top = base02

# # Bottom border color of the selected completion item.
# c.colors.completion.item.selected.border.bottom = base02

# # Foreground color of the matched text in the selected completion item.
# c.colors.completion.item.selected.match.fg = base0B

# # Foreground color of the matched text in the completion.
# c.colors.completion.match.fg = base0B

# # Color of the scrollbar handle in the completion view.
# c.colors.completion.scrollbar.fg = base05

# # Color of the scrollbar in the completion view.
# c.colors.completion.scrollbar.bg = base00

# # Background color of disabled items in the context menu.
# c.colors.contextmenu.disabled.bg = base01

# # Foreground color of disabled items in the context menu.
# c.colors.contextmenu.disabled.fg = base04

# # Background color of the context menu. If set to null, the Qt default is used.
# c.colors.contextmenu.menu.bg = base00

# # Foreground color of the context menu. If set to null, the Qt default is used.
# c.colors.contextmenu.menu.fg = base05

# # Background color of the context menu’s selected item. If set to null, the Qt default is used.
# c.colors.contextmenu.selected.bg = base02

# # Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
# c.colors.contextmenu.selected.fg = base05

# # Background color for the download bar.
# c.colors.downloads.bar.bg = base00

# # Color gradient start for download text.
# c.colors.downloads.start.fg = base00

# # Color gradient start for download backgrounds.
# c.colors.downloads.start.bg = base0D

# # Color gradient end for download text.
# c.colors.downloads.stop.fg = base00

# # Color gradient stop for download backgrounds.
# c.colors.downloads.stop.bg = base0C

# # Foreground color for downloads with errors.
# c.colors.downloads.error.fg = base08

# # Font color for hints.
# c.colors.hints.fg = base00

# # Background color for hints. Note that you can use a `rgba(...)` value
# # for transparency.
# c.colors.hints.bg = base0A

# # Font color for the matched part of hints.
# c.colors.hints.match.fg = base05

# # Text color for the keyhint widget.
# c.colors.keyhint.fg = base05

# # Highlight color for keys to complete the current keychain.
# c.colors.keyhint.suffix.fg = base05

# # Background color of the keyhint widget.
# c.colors.keyhint.bg = base00

# # Foreground color of an error message.
# c.colors.messages.error.fg = base00

# # Background color of an error message.
# c.colors.messages.error.bg = base08

# # Border color of an error message.
# c.colors.messages.error.border = base08

# # Foreground color of a warning message.
# c.colors.messages.warning.fg = base00

# # Background color of a warning message.
# c.colors.messages.warning.bg = base0E

# # Border color of a warning message.
# c.colors.messages.warning.border = base0E

# # Foreground color of an info message.
# c.colors.messages.info.fg = base05

# # Background color of an info message.
# c.colors.messages.info.bg = base00

# # Border color of an info message.
# c.colors.messages.info.border = base00

# # Foreground color for prompts.
# c.colors.prompts.fg = base05

# # Border used around UI elements in prompts.
# c.colors.prompts.border = base00

# # Background color for prompts.
# c.colors.prompts.bg = base00

# # Background color for the selected item in filename prompts.
# c.colors.prompts.selected.bg = base02

# # Foreground color for the selected item in filename prompts.
# c.colors.prompts.selected.fg = base05

# # Foreground color of the statusbar.
# c.colors.statusbar.normal.fg = base0B

# # Background color of the statusbar.
# c.colors.statusbar.normal.bg = base00

# # Foreground color of the statusbar in insert mode.
# c.colors.statusbar.insert.fg = base00

# # Background color of the statusbar in insert mode.
# c.colors.statusbar.insert.bg = base0D

# # Foreground color of the statusbar in passthrough mode.
# c.colors.statusbar.passthrough.fg = base00

# # Background color of the statusbar in passthrough mode.
# c.colors.statusbar.passthrough.bg = base0C

# # Foreground color of the statusbar in private browsing mode.
# c.colors.statusbar.private.fg = base00

# # Background color of the statusbar in private browsing mode.
# c.colors.statusbar.private.bg = base01

# # Foreground color of the statusbar in command mode.
# c.colors.statusbar.command.fg = base05

# # Background color of the statusbar in command mode.
# c.colors.statusbar.command.bg = base00

# # Foreground color of the statusbar in private browsing + command mode.
# c.colors.statusbar.command.private.fg = base05

# # Background color of the statusbar in private browsing + command mode.
# c.colors.statusbar.command.private.bg = base00

# # Foreground color of the statusbar in caret mode.
# c.colors.statusbar.caret.fg = base00

# # Background color of the statusbar in caret mode.
# c.colors.statusbar.caret.bg = base0E

# # Foreground color of the statusbar in caret mode with a selection.
# c.colors.statusbar.caret.selection.fg = base00

# # Background color of the statusbar in caret mode with a selection.
# c.colors.statusbar.caret.selection.bg = base0D

# # Background color of the progress bar.
# c.colors.statusbar.progress.bg = base0D

# # Default foreground color of the URL in the statusbar.
# c.colors.statusbar.url.fg = base05

# # Foreground color of the URL in the statusbar on error.
# c.colors.statusbar.url.error.fg = base08

# # Foreground color of the URL in the statusbar for hovered links.
# c.colors.statusbar.url.hover.fg = base05

# # Foreground color of the URL in the statusbar on successful load
# # (http).
# c.colors.statusbar.url.success.http.fg = base0C

# # Foreground color of the URL in the statusbar on successful load
# # (https).
# c.colors.statusbar.url.success.https.fg = base0B

# # Foreground color of the URL in the statusbar when there's a warning.
# c.colors.statusbar.url.warn.fg = base0E

# # Background color of the tab bar.
# c.colors.tabs.bar.bg = base00

# # Color gradient start for the tab indicator.
# c.colors.tabs.indicator.start = base0D

# # Color gradient end for the tab indicator.
# c.colors.tabs.indicator.stop = base0C

# # Color for the tab indicator on errors.
# c.colors.tabs.indicator.error = base08

# # Foreground color of unselected odd tabs.
# c.colors.tabs.odd.fg = base05

# # Background color of unselected odd tabs.
# c.colors.tabs.odd.bg = base01

# # Foreground color of unselected even tabs.
# c.colors.tabs.even.fg = base05

# # Background color of unselected even tabs.
# c.colors.tabs.even.bg = base00

# # Background color of pinned unselected even tabs.
# c.colors.tabs.pinned.even.bg = base0C

# # Foreground color of pinned unselected even tabs.
# c.colors.tabs.pinned.even.fg = base07

# # Background color of pinned unselected odd tabs.
# c.colors.tabs.pinned.odd.bg = base0B

# # Foreground color of pinned unselected odd tabs.
# c.colors.tabs.pinned.odd.fg = base07

# # Background color of pinned selected even tabs.
# c.colors.tabs.pinned.selected.even.bg = base02

# # Foreground color of pinned selected even tabs.
# c.colors.tabs.pinned.selected.even.fg = base05

# # Background color of pinned selected odd tabs.
# c.colors.tabs.pinned.selected.odd.bg = base02

# # Foreground color of pinned selected odd tabs.
# c.colors.tabs.pinned.selected.odd.fg = base05

# # Foreground color of selected odd tabs.
# c.colors.tabs.selected.odd.fg = base05

# # Background color of selected odd tabs.
# c.colors.tabs.selected.odd.bg = base02

# # Foreground color of selected even tabs.
# c.colors.tabs.selected.even.fg = base05

# # Background color of selected even tabs.
# c.colors.tabs.selected.even.bg = base02

# # Background color for webpages if unset (or empty to use the theme's
# # color).
# # c.colors.webpage.bg = base00
