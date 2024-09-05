class BasicResponseBody {
  final int success;
  final String code;
  final String msg;

  BasicResponseBody({
    required this.success,
    required this.code,
    required this.msg,
  });

  // 从JSON创建对象的工厂构造函数
  factory BasicResponseBody.fromJson(Map<String, dynamic> json) {
    return BasicResponseBody(
      success: json['success'] as int,
      code: json['code'] as String,
      msg: json['msg'] as String,
    );
  }

  // 将对象转换为JSON的方法
  Map<String, dynamic> toJson() => {
    'success': success,
    'code': code,
    'msg': msg,
  };
}

class ReclaimRequestBody {
  final String pledgeId;
  final String currentPassword;

  ReclaimRequestBody({
    required this.pledgeId,
    required this.currentPassword,
  });


  Map<String, dynamic> toJson() => {
    'pledge_id': pledgeId,
    'current_password': currentPassword,
  };


  factory ReclaimRequestBody.fromJson(Map<String, dynamic> json) {
    return ReclaimRequestBody(
      pledgeId: json['pledge_id'],
      currentPassword: json['current_password'],
    );
  }
}

class GiftPledgeRequestBody {
  final String pledgeId;
  final String currentPassword;
  final String email;
  final String name;

  GiftPledgeRequestBody({
    required this.pledgeId,
    required this.currentPassword,
    required this.email,
    required this.name,
  });

  // 如果需要将对象转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'pledge_id': pledgeId,
      'current_password': currentPassword,
      'email': email,
      'name': name,
    };
  }

  // 如果需要从JSON创建对象
  factory GiftPledgeRequestBody.fromJson(Map<String, dynamic> json) {
    return GiftPledgeRequestBody(
      pledgeId: json['pledge_id'],
      currentPassword: json['current_password'],
      email: json['email'],
      name: json['name'],
    );
  }
}

class CancelPledgeRequestBody {
  final String pledgeId;

  CancelPledgeRequestBody({required this.pledgeId});

  Map<String, dynamic> toJson() {
    return {
      'pledge_id': pledgeId,
    };
  }
}
