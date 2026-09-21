import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:refuge_next/src/datasource/models/user.dart';
import 'package:refuge_next/src/repo/user.dart';

class _TemporaryPaths extends PathProviderPlatform {
  _TemporaryPaths(this.path);
  final String path;
  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

User account(String handle) => User(
    handle: handle,
    name: handle,
    email: '$handle@example.invalid',
    password: 'test-only',
    rsiToken: 'old-$handle',
    rsiDevice: 'device-$handle',
    profileImage: '',
    referralCode: '',
    referralCount: 0,
    referralProspectCount: 0,
    usd: 0,
    uec: 0,
    rec: 0,
    hangarValue: 0,
    currentHangarValue: 0,
    totalSpent: 0,
    orgLevel: 0,
    registerTime: DateTime.utc(2020),
    registerTimeString: '2020');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory directory;
  late PathProviderPlatform originalPaths;
  setUp(() async {
    originalPaths = PathProviderPlatform.instance;
    directory = await Directory.systemTemp.createTemp('refuge-session-test-');
    PathProviderPlatform.instance = _TemporaryPaths(directory.path);
    SharedPreferences.setMockInitialValues({});
  });
  tearDown(() async {
    PathProviderPlatform.instance = originalPaths;
    await directory.delete(recursive: true);
  });

  test('legacy user without device remains readable', () {
    final json = account('Alice').toJson()..remove('rsiDevice');
    expect(User.fromJson(json).rsiDevice, '');
  });

  test('session persistence does not change selected account', () async {
    await UserRepo().addUser(account('Alice'), selectUser: true);
    await UserRepo().addUser(account('Bob'), selectUser: true);
    await UserRepo()
        .updateSession(handle: 'Alice', token: 'new', device: 'new-device');
    expect((await UserRepo().getCurrentUser())?.handle, 'Bob');
    final saved = await UserRepo().getUser(handle: 'Alice');
    expect(saved?.rsiToken, 'new');
    expect(saved?.rsiDevice, 'new-device');
  });

  test('saving cached profile cannot overwrite rotated credentials', () async {
    final stale = account('Alice');
    await UserRepo().addUser(stale, selectUser: true);
    await UserRepo()
        .updateSession(handle: 'Alice', token: 'rotated==', device: 'fresh');
    await UserRepo().addUser(stale.copyWith(hangarValue: 100));
    final saved = await UserRepo().getUser(handle: 'Alice');
    expect(saved?.rsiToken, 'rotated==');
    expect(saved?.rsiDevice, 'fresh');
    expect(saved?.hangarValue, 100);
  });

  test('late credential persistence does not recreate a removed account',
      () async {
    await UserRepo().addUser(account('Alice'));
    await UserRepo().removeUser(handle: 'Alice');
    await UserRepo()
        .updateSession(handle: 'Alice', token: 'late', device: 'late');
    expect(await UserRepo().getUser(handle: 'Alice'), isNull);
  });
}
