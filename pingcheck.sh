#!/usr/bin/env bash 

# pingcheck.sh
# It doesn't take arguments, I have the address hardcoded
# It also breaks if there isn't any response, faithfully continuing on
# Note: It won't tell you if the host is completely down because of above line
# I don't really care enough to fix either at the moment
# This will be done nicer at a later time, probably in ruby
# Don't hold this ugly mess against me
# anthony.hook3@gmail.com

limit_ms=150
sleep_duration=1
while [ true ]; do
pong_res=$(ping -c 1 10.0.0.30 | sed -n 's/.*time=\([0-9]*\).*/\1/p')
echo "$(date +%s): pong response is $pong_res"
if [ "$pong_res" -gt "$limit_ms" ]; then
  /usr/bin/notify-send -u critical -t 30000 "Ping Alert" "Above Threshhold: $pong_res";
fi
sleep "$sleep_duration"
done
