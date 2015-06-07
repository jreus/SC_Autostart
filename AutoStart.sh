#!/bin/sh
FILEPATH="/Volumes/Store/Box Sync/_Projects/SC_Autostart/AutoStart.scd"
cd /Applications/SuperCollider3.6.6/SuperCollider3.6.6.app/Contents/Resources
echo "RUNNING SUPERCOLLIDER"
exec ./sclang "${FILEPATH}"