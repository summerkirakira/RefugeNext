// 避难所账号相关的数据模型

/// 账号注册请求
class AccountRegisterRequest {
  final String email;
  final String password;

  AccountRegisterRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

/// 账号登录请求
class AccountLoginRequest {
  final String email;
  final String password;

  AccountLoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

/// 账号登录响应
class AccountLoginResponse {
  final String accessToken;
  final String tokenType;
  final String email;

  AccountLoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.email,
  });

  factory AccountLoginResponse.fromJson(Map<String, dynamic> json) {
    return AccountLoginResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'bearer',
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'email': email,
    };
  }
}

/// 账号绑定的设备信息
class AccountDeviceInfo {
  final String uuid;
  final String? createdAt;
  final double? totalVipSeconds;
  final int? totalCredit;

  AccountDeviceInfo({
    required this.uuid,
    this.createdAt,
    this.totalVipSeconds,
    this.totalCredit,
  });

  factory AccountDeviceInfo.fromJson(Map<String, dynamic> json) {
    return AccountDeviceInfo(
      uuid: json['uuid'] as String,
      createdAt: json['created_at'] as String?,
      totalVipSeconds: (json['total_vip_seconds'] as num?)?.toDouble(),
      totalCredit: json['total_credit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (totalVipSeconds != null) 'total_vip_seconds': totalVipSeconds,
      if (totalCredit != null) 'total_credit': totalCredit,
    };
  }
}

/// 账号信息响应
class AccountInfoResponse {
  final String email;
  final String createdAt;
  final double totalVipSeconds;
  final int totalCredit;
  final List<AccountDeviceInfo> devices;

  AccountInfoResponse({
    required this.email,
    required this.createdAt,
    required this.totalVipSeconds,
    required this.totalCredit,
    required this.devices,
  });

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      email: json['email'] as String,
      createdAt: json['created_at'] as String,
      totalVipSeconds: (json['total_vip_seconds'] as num).toDouble(),
      totalCredit: json['total_credit'] as int,
      devices: (json['devices'] as List<dynamic>)
          .map((e) => AccountDeviceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'created_at': createdAt,
      'total_vip_seconds': totalVipSeconds,
      'total_credit': totalCredit,
      'devices': devices.map((e) => e.toJson()).toList(),
    };
  }
}

/// 单条游戏日志请求
class GameLogRequest {
  final String logTime;
  final String? gameAccountName;
  final String logType;
  final String? content;

  GameLogRequest({
    required this.logTime,
    this.gameAccountName,
    required this.logType,
    this.content,
  });

  factory GameLogRequest.fromJson(Map<String, dynamic> json) {
    return GameLogRequest(
      logTime: json['log_time'] as String,
      gameAccountName: json['game_account_name'] as String?,
      logType: json['log_type'] as String,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'log_time': logTime,
      if (gameAccountName != null) 'game_account_name': gameAccountName,
      'log_type': logType,
      if (content != null) 'content': content,
    };
  }
}

/// 批量游戏日志请求
class GameLogBatchRequest {
  final List<GameLogRequest> logs;

  GameLogBatchRequest({
    required this.logs,
  });

  Map<String, dynamic> toJson() {
    return {
      'logs': logs.map((e) => e.toJson()).toList(),
    };
  }
}

/// 游戏日志上传结果
class GameLogResult {
  final int code;
  final String message;
  final int total;
  final int inserted;
  final int duplicated;

  GameLogResult({
    required this.code,
    required this.message,
    required this.total,
    required this.inserted,
    required this.duplicated,
  });

  factory GameLogResult.fromJson(Map<String, dynamic> json) {
    return GameLogResult(
      code: json['code'] as int,
      message: json['message'] as String,
      total: json['total'] as int,
      inserted: json['inserted'] as int,
      duplicated: json['duplicated'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'total': total,
      'inserted': inserted,
      'duplicated': duplicated,
    };
  }
}
