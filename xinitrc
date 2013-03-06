#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# exec gnome-session
# exec startkde
# execn startxfce4
# ...or the Window Manager of your choice

xset +fp /usr/share/fonts/local
xset fp rehash

xrdb -merge .Xresources

setxkbmap -option terminate:ctrl_alt_bksp
xsetroot  -cursor_name left_ptr

exec xmonad
