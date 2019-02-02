#!/bin/sh

set -e

/greengrass/ggc/core/greengrassd start

daemon_pid=`cat /var/run/greengrassd.pid`
# block docker exit until daemon process dies.
while [ -d /proc/$daemon_pid ]
do
 # Sleep for 1s before checking that greengrass daemon is still alive
 daemon_cmdline=`cat /proc/$daemon_pid/cmdline`
 if awk 'BEGIN{ exit(!(ARGV[1] ~ /^\/greengrass\/ggc\/packages\/1.7.0\/bin\/daemon.*/))}' "$daemon_cmdline"; then 
  sleep 1;
 else
  break;
 fi;
done 

