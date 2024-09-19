class UpgradeTargetResponse {
  final int success;
  final String code;
  final String msg;
  final UpgradeData data;

  UpgradeTargetResponse({
    required this.success,
    required this.code,
    required this.msg,
    required this.data,
  });

  factory UpgradeTargetResponse.fromJson(Map<String, dynamic> json) {
    return UpgradeTargetResponse(
      success: json['success'],
      code: json['code'],
      msg: json['msg'],
      data: UpgradeData.fromJson(json['data']),
    );
  }
}

class UpgradeData {
  final String rendered;

  UpgradeData({required this.rendered});

  factory UpgradeData.fromJson(Map<String, dynamic> json) {
    return UpgradeData(
      rendered: json['rendered'],
    );
  }
}