#!/bin/bash

# Launch headless Chrome with debugging enabled
google-chrome-stable \
  --headless=new \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu \
  --remote-debugging-port=13142 \
  --user-data-dir=/tmp/chrome-profile > /tmp/chrome.log 2>&1 &

# Optional: retain VNC or GUI tools if needed (can be removed if not using GUI)
exec /dockerstartup/vnc_startup.sh > /dev/null 2>&1 &
sleep 5
cd /app
python3 server.py
