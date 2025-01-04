#!/bin/bash

# デフォルトのディレクトリ設定
dir=~
if [ "$1" != "" ]; then
  dir="$1"
fi

# 作業ディレクトリに移動
cd "$dir/ros2_ws"

# colcon ビルド
colcon build

# ビルド後、環境設定
source "$dir/ros2_ws/install/setup.bash"

# ノードを起動、出力をログにリダイレクト
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

# ログファイルから特定の文字列を検索して表示
cat /tmp/mypkg.log | grep 'Listen: 10'
