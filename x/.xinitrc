xrdb -merge ~/.Xresources
xrandr --output DP-2 --auto --right-of DP-4
setterm --powersave off --powerdown 0
xset s off
xset +fp ~/.local/share/fonts
xset fp rehash
dunst -config $HOME/.config/dunst/dunstrc &

exec i3
