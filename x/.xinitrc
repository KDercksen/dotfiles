xrdb -merge ~/.Xresources
urxvtd -q -o -f
xrandr --output DVI-I-1 --auto --left-of DVI-D-1
setterm --powersave off --powerdown 0
xset s off

# Do gpg-agent stuff
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement)")" ]]

export GPG_AGENT_INFO
exec i3
