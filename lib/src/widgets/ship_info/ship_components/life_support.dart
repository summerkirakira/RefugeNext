import 'package:flutter/material.dart';

class LifeSupportListItem extends StatelessWidget {
  final String name;
  final String manufacturer;
  final String energyCount;
  // final String coolingValue;
  final int size;

  const LifeSupportListItem({
    Key? key,
    required this.name,
    required this.manufacturer,
    required this.energyCount,
    // required this.coolingValue,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 左侧部分：S1标签、风扇图标和数字
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'S$size',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/power.png',
                      width: 20,
                      height: 20,
                      color: Colors.orange[300],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$energyCount',
                      style: TextStyle(
                        color: Colors.orange[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 16),

            // 中间部分：名称和等级
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    manufacturer,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // 右侧部分：制冷效率
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Text(
            //       coolingValue.toString(),
            //       style: const TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(
            //       '冷却效率',
            //       style: TextStyle(
            //         color: Colors.orange[300],
            //         fontSize: 12,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
