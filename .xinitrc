xrdb -merge ~/.Xresources
urxvtd -q -o -f
xrandr --output DVI-I-1 --auto --left-of DVI-D-1
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -O $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f2) 2>/dev/null
then
    eval $(cat "$envfile")
else
    eval $(gpg-agent --daemon --write-envfile "$envfile")
fi
export GPG_AGENT_INFO
exec i3
