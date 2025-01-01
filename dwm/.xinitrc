picom --backend glx &
feh --bg-scale /usr/share/backgrounds/background.png
xset s off -dpms

# touchpad settings
xinput set-prop "MSFT0001:00 06CB:7E7E Touchpad" "libinput Click Method Enabled" 0 1
xinput set-prop "MSFT0001:00 06CB:7E7E Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "MSFT0001:00 06CB:7E7E Touchpad" "libinput Natural Scrolling Enabled" 1

# keyboard settings
setxkbmap -model pc104 -layout us,gr -option 'grp:win_space_toggle'

dwm-autostart &

exec dwm
