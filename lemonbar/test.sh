#!/usr/bin/bash

HIGHLIGHT="#ffffff"

# Define clock
clock() {
  DATETIME=$(date "+%a %b %d, %T")
  echo -n "$DATETIME"
}

# Define volume
volume() {
	VOL=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
	if [ $VOL = '0%' ]; then
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\ue04f")%{F-} Mute"
	else
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\ue050")%{F-} $VOL"
	fi
}

# Define wifi
wifi() {
    echo -e "%{F$HIGHLIGHT} \ue1af %{F-}$(iw wlp5s0 link | grep 'SSID' | cut -c 8-)"
}

# Define battery
bat() {
  BATPERC=$(acpi --battery | cut -d, -f2)
  echo "$BATPERC"
}

# Define Space
space() {
  echo "  |  "
}

workspace() {
  echo "x"
}

while true; do
  # echo "\
  # %{l}$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)\
  # %{c}$(Battery)\
  # %{r}%{F#FFFF00}%{B#0000FF}%{A:firefox:} $(Clock) %{F-}%{B-}"
  # sleep 1

  echo "%{B#2B2C2B}  ♪@ł€¶ŧ←↓iæſðđŋħ»«¢„“›‹©‚‘ÆẞÐªŊΩŁ€®ŦASD’›”» $(volume) $(space) SSID:$(wifi) $(space) Bat:$(bat) %{B-}%{r} $(clock) "

  sleep 1
done

# ./test.sh | lemonbar -B#2B2C2B
