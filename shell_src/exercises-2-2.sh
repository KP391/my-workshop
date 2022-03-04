#!/bin/bash
# + Task : Write a script that upon invocation shows the time and date,
# + - lists all logged-in users
# + - gives the system uptime
# + The script then saves this information to a logfile.

function ext_args {
  cat log.tmp >> /var/log/user_logged.log
  rm -v log.tmp
}

trap ext_args EXIT
cat <<EOF >> log.tmp
$(echo "-------------------------" + $(date +"%Y/%m/%d") + "-------------------------")
$(w)
$(echo -e "------------------------------------------------------------------\n")

EOF
#top_border
#w >> log.tmp
#border

cat log.tmp

exit $?

# read about cat with EOF thingy -> https://stackoverflow.com/a/30728472
