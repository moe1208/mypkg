#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from datetime import datetime

class AgeCalculator(Node):
    def __init__(self):
        super().__init__('age_calculator_node')
        self.timer = self.create_timer(1.0, self.calculate_age)  # 1秒ごとに実行

    def calculate_age(self):
        birth_year = 2004
        current_year = datetime.now().year
        current_month = datetime.now().month

        # 現在の年齢を計算
        age = current_year - birth_year

        # 詳細な情報を出力
        self.get_logger().info(f"現在の年齢は {age} 歳です。（基準：{birth_year} 年生まれ）")

def main(args=None):
    rclpy.init(args=args)
    node = AgeCalculator()

    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass

    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
