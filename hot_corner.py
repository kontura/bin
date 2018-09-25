#!/usr/bin/env python3
import subprocess
import time

cornersize = 20

commands = [
        None,
        "gedit",
        None,
        "gnome-terminal",
        ]

def get(cmd):
    return subprocess.check_output(cmd).decode("utf-8").strip()

def get_pos():
    return [int(s.split(":")[1]) for s in get(["xdotool", "getmouselocation"]).split()[:2]]

scrdata = get("xrandr").split(); resindex = scrdata.index("connected")+2
res = [int(n) for n in scrdata[resindex].split("+")[0].split("x")]

match1 = None

while True:
    time.sleep(1)
    xy = get_pos()
    x = xy[0]; y = xy[1]
    test = [
       [x < cornersize, y < cornersize],
       [x > res[0]-cornersize, y < cornersize],
       [x < cornersize, y > res[1]-cornersize],
       [x > res[0]-cornersize, y > res[1]-cornersize],
       ]
    match2 = [i for i, p in enumerate(test) if all(p)]
    if match2 != match1:
        if match2:
            cmd = commands[match2[0]]
            if cmd:
                subprocess.Popen(["/bin/bash", "-c", cmd])
    match1 = match2
