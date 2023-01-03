xrdb -merge ~/.Xresources
xrandr --output DP-2 --auto --right-of DP-4
# xrandr --output DP-4 --auto
# xrandr --output DP-2 --off
setterm --powersave off --powerdown 0
xset s off
xset +fp ~/.local/share/fonts
xset fp rehash
dunst -config $HOME/.config/dunst/dunstrc &
export $(dbus-launch)

exec i3
