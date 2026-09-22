import 'package:flutter/material.dart';
import 'package:refuge_next/src/widgets/user_info/user_login_page.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20), // 调整这个值来改变圆角大小
              child: const Image(
                image: AssetImage('assets/images/cirno_avatar.jpeg'),
                width: 100,
                height: 100,
              )),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                openLoginPage(context);
              },
              child: const Text('点此登录'))
        ],
      ),
    );
  }
}
