#!/bin/sh

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

DEFAULT_SESSION=openbox-session
case $1 in
openbox-session) exec openbox-session ;;
dwm)
    feh --bg-tile .config/wallpapers/assassinsCreed.jpeg
    urxvtd &
    offlineimap &
    exec ck-launch-session dwm ;;
*) exec $DEFAULT_SESSION  ;;
esac
