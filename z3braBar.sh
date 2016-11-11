
#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

clock() {
    date '+ %H:%M'
}

battery() {
    BATC=/sys/class/power_supply/BAT1/capacity
    BATS=/sys/class/power_supply/BAT1/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

volume() {
    amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p'
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "$int connected" || echo "$int disconnected"
}

nowplaying() {
    cur=`mpc current`
    # this line allow to choose whether the output will scroll or not
    test "$1" = "scroll" && PARSER='skroll -n20 -d0.5 -r' || PARSER='cat'
    test -n "$cur" && echo $cur || echo "- stopped -"
    #test -n "$cur" && $PARSER <<< $cur || echo "- stopped -"
}

# This loop will fill a buffer with our infos, and output it to stdout.
h="#666"
while :; do
    buf=""
    buf="${buf} %{cF#fff}"
    buf="${buf} $(clock)"
    buf="${buf} %{r}"
    buf="${buf} %{F${h}}NET: %{F#fff}$(network)"
    buf="${buf} %{F${h}}CPU: %{F#fff}$(cpuload)%"
    buf="${buf} %{l}"
    buf="${buf} %{F${h}}VOL:%{F#fff} $(volume)"
    buf="${buf} %{F${h}}MPD:%{F#fff} $(nowplaying)"

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done
