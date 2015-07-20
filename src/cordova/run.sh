#!/usr/bin/env bash

puppet apply --modulepath=/src/cordova/run/modules /src/cordova/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
