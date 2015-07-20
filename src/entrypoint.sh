#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/cordova/build.sh && /src/cordova/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/cordova/variables.sh && /src/cordova/run.sh"
    ;;
esac
