#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources

compton --config ~/.config/compton/compton.conf -b
feh --bg-center ~/Images/the_piano_lesson.jpg
sxhkd &
panel &
exec bspwm