xrdb -merge ~/.Xresources
xrandr --output DVI-I-1 --auto --left-of DVI-D-1
setterm --powersave off --powerdown 0
xset s off
xset +fp ~/.local/share/fonts
xset fp rehash
dunst -config $HOME/.config/dunst/dunstrc &

exec i3
