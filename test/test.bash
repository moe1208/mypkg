#!/bin/bash

dir=~
if [ "$1" != "" ]; then
  dir="$1"
fi

cd "$dir/ros2_ws"
colcon build
source "$dir/ros2_ws/install/setup.bash"
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep 'Listen: 10'
