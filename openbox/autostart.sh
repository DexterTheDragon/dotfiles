# Run the system-wide support stuff
. $GLOBALAUTOSTART

xsetroot -solid "#303030" &
display -window root $HOME/.wallpaper.jpg &

docker &
# volwheel &
conky &
xscreensaver -no-splash &
