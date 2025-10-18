// 避难所账号相关的数据模型

/// 账号注册请求
class AccountRegisterRequest {
  final String email;
  final String password;
  final String username;

  AccountRegisterRequest({
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
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
  final String version;
  final String lastSeen;
  final String systemModel;
  final int vipType;
  final String vipExpire;
  final int credit;

  AccountDeviceInfo({
    required this.uuid,
    required this.version,
    required this.lastSeen,
    required this.systemModel,
    required this.vipType,
    required this.vipExpire,
    required this.credit,
  });

  factory AccountDeviceInfo.fromJson(Map<String, dynamic> json) {
    return AccountDeviceInfo(
      uuid: json['uuid'] as String,
      version: json['version'] as String,
      lastSeen: json['last_seen'] as String,
      systemModel: json['system_model'] as String,
      vipType: json['vip_type'] as int,
      vipExpire: json['vip_expire'] as String,
      credit: json['credit'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'version': version,
      'last_seen': lastSeen,
      'system_model': systemModel,
      'vip_type': vipType,
      'vip_expire': vipExpire,
      'credit': credit,
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
  final String? username;
  final String? avatar;
  final String? extraInfo;

  AccountInfoResponse({
    required this.email,
    required this.createdAt,
    required this.totalVipSeconds,
    required this.totalCredit,
    required this.devices,
    this.username,
    this.avatar,
    this.extraInfo,
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
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      extraInfo: json['extra_info'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'created_at': createdAt,
      'total_vip_seconds': totalVipSeconds,
      'total_credit': totalCredit,
      'devices': devices.map((e) => e.toJson()).toList(),
      if (username != null) 'username': username,
      if (avatar != null) 'avatar': avatar,
      if (extraInfo != null) 'extra_info': extraInfo,
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

/// 游戏日志同步信息响应
class GameLogSyncInfoResponse {
  final String? latestLogTime;
  final int totalLogs;
  final String? oldestLogTime;

  GameLogSyncInfoResponse({
    this.latestLogTime,
    required this.totalLogs,
    this.oldestLogTime,
  });

  factory GameLogSyncInfoResponse.fromJson(Map<String, dynamic> json) {
    return GameLogSyncInfoResponse(
      latestLogTime: json['latest_log_time'] as String?,
      totalLogs: json['total_logs'] as int,
      oldestLogTime: json['oldest_log_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (latestLogTime != null) 'latest_log_time': latestLogTime,
      'total_logs': totalLogs,
      if (oldestLogTime != null) 'oldest_log_time': oldestLogTime,
    };
  }
}

/// 更新账号详细信息请求
class UpdateAccountDetailRequest {
  final String? username;
  final String? avatar;
  final String? extraInfo;

  UpdateAccountDetailRequest({
    this.username,
    this.avatar,
    this.extraInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      if (username != null) 'username': username,
      if (avatar != null) 'avatar': avatar,
      if (extraInfo != null) 'extra_info': extraInfo,
    };
  }
}

/// 账号详细信息响应
class AccountDetailResponse {
  final String? username;
  final String? avatar;
  final String? extraInfo;
  final String createdAt;
  final String updatedAt;

  AccountDetailResponse({
    this.username,
    this.avatar,
    this.extraInfo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AccountDetailResponse.fromJson(Map<String, dynamic> json) {
    return AccountDetailResponse(
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      extraInfo: json['extra_info'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (username != null) 'username': username,
      if (avatar != null) 'avatar': avatar,
      if (extraInfo != null) 'extra_info': extraInfo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
