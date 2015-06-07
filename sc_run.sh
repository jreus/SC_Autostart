#!/bin/sh
PWD=`pwd`
FILEPATH="${PWD}/$*"
cd /Applications/SuperCollider3.6.6/SuperCollider3.6.6.app/Contents/Resources
exec ./sclang "${FILEPATH}"