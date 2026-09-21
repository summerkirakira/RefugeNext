import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/user.dart';
import 'package:refuge_next/src/repo/repo_ai_tool_executor.dart';

User _user() => User(
      handle: 'TestPilot',
      name: '测试用户',
      email: 'pilot@example.invalid',
      password: 'test-password',
      rsiToken: 'test-token',
      rsiDevice: 'test-device',
      profileImage: '',
      referralCode: '',
      referralCount: 3,
      referralProspectCount: 2,
      usd: 1234,
      uec: 20000,
      rec: 5000,
      hangarValue: 75025,
      currentHangarValue: 90050,
      totalSpent: 123456,
      orgLevel: 0,
      registerTime: DateTime.utc(2020),
      registerTimeString: '2020',
    );

void main() {
  test('AI JSON 使用美元金额，保留美分精度和游戏货币单位', () {
    final user = _user();
    final before = user.toJson();
    final result = jsonDecode(jsonEncode(shapeUserInfo(user, isVIP: true)));

    expect(result['totalSpent'], 1234.56);
    expect(result['hangarValue'], 750.25);
    expect(result['currentHangarValue'], 900.50);
    expect(result['usd'], 12.34);
    expect(result['currency'], 'USD');
    expect(result['moneyUnit'], 'dollars');
    expect(result['uec'], 20000);
    expect(result['rec'], 5000);
    expect(result['referralCount'], 3);
    expect(result['handle'], 'TestPilot');
    expect(result['isVIP'], isTrue);
    for (final field in ['email', 'password', 'rsiToken', 'rsiDevice']) {
      expect(result.containsKey(field), isFalse);
    }
    expect(user.toJson(), before);
    expect(shapeUserInfo(user, isVIP: true), result);
  });

  test('零金额和一美分不会丢失或被重复缩小', () {
    final user = _user().copyWith(
      usd: 0,
      totalSpent: 1,
      hangarValue: 100,
      currentHangarValue: 0,
    );
    final result = shapeUserInfo(user, isVIP: false);
    expect(result['usd'], 0);
    expect(result['totalSpent'], 0.01);
    expect(result['hangarValue'], 1);
    expect(result['currentHangarValue'], 0);
    expect(result['isVIP'], isFalse);
  });

  test('未登录时仅返回会员状态', () {
    expect(shapeUserInfo(null, isVIP: false), {'isVIP': false});
  });
}
