import 'package:shared_preferences/shared_preferences.dart';

/// 避难所账号仓库 - 管理 JWT token 和账号信息的持久化
class RefugeAccountRepo {
  static final RefugeAccountRepo _instance = RefugeAccountRepo._internal();

  RefugeAccountRepo._internal();

  factory RefugeAccountRepo() => _instance;

  // SharedPreferences keys
  static const String _jwtTokenKey = 'refuge.account.jwt_token';
  static const String _accountEmailKey = 'refuge.account.email';

  /// 获取保存的 JWT token
  Future<String?> getJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_jwtTokenKey);
  }

  /// 保存 JWT token
  Future<void> setJwtToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_jwtTokenKey, token);
  }

  /// 清除 JWT token
  Future<void> clearJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_jwtTokenKey);
  }

  /// 获取保存的账号邮箱
  Future<String?> getAccountEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accountEmailKey);
  }

  /// 保存账号邮箱
  Future<void> setAccountEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accountEmailKey, email);
  }

  /// 清除账号邮箱
  Future<void> clearAccountEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accountEmailKey);
  }

  /// 检查是否已登录（JWT token 是否存在）
  Future<bool> isLoggedIn() async {
    final token = await getJwtToken();
    return token != null && token.isNotEmpty;
  }

  /// 清除所有账号数据（登出）
  Future<void> clearAll() async {
    await clearJwtToken();
    await clearAccountEmail();
  }

  /// 保存登录信息（同时保存 token 和邮箱）
  Future<void> saveLoginInfo({
    required String token,
    required String email,
  }) async {
    await setJwtToken(token);
    await setAccountEmail(email);
  }
}
