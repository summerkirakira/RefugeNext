import 'package:flutter/material.dart';

class FriendsLocationPage extends StatelessWidget {
  const FriendsLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            '暂无好友位置信息',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
