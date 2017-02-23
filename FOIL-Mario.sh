#!/bin/bash
#Disable DPMS
xset -dpms
# Clean up previously running apps, gracefully at first then harshly
killall -TERM chromium 2>/dev/null;
killall -TERM matchbox-window-manager 2>/dev/null;
sleep 2;
killall -9 chromium 2>/dev/null;
killall -9 matchbox-window-manager 2>/dev/null;
# Launch window manager without title bar.
exec matchbox-window-manager &
# Launch browser.
chromium -app="https://scratch.mit.edu/projects/64057444/#fullscreen"
