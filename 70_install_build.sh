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
if [ $APP_HOME ]; then
    cd $APP_HOME && $APP_HOME/node_modules/bower/bin/bower install -q --allow-root && $APP_HOME/node_modules/brunch/bin/brunch build -P
fi
