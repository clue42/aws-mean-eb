#!/bin/bash
#include env variables and node version
. /opt/elasticbeanstalk/env.vars

function error_exit
{
    eventHelper.py --msg "$1" --severity ERROR
    exit $2
}

#check if we have node binaries available globally
if [ ! -L /usr/bin/node ]; then
    ln -s /opt/elasticbeanstalk/node-install/node-v$NODE_VER-linux-$ARCH/bin/node /usr/bin/node
fi
if [ /var/app/current ]; then
    cd /var/app/current && bower install && brunch build -P
fi
