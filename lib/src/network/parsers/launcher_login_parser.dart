import '../../datasource/models/login/login_property.dart';

/// Launcher 的验证挑战/错误响应可能用 [] 表示没有 data。
/// 保留 code/msg 供登录流程判断，不能因空数据而丢失验证码状态。
LauncherLoginProperty parseLauncherLoginResponse(Object? response) {
  if (response is! Map<String, dynamic>) {
    throw const FormatException('登录响应不是对象');
  }
  final json = Map<String, dynamic>.from(response);
  final data = json['data'];
  if (data is List && data.isEmpty) {
    json['data'] = null;
  } else if (data is Map<String, dynamic>) {
    json['data'] = {
      ...data,
      // 挑战响应可能只返回 device_id，session_id 由前一步或 Cookie 保留。
      'session_id': data['session_id'] ?? '',
    };
  } else if (data != null) {
    throw const FormatException('登录响应 data 类型无效');
  }
  return LauncherLoginProperty.fromJson(json);
}
