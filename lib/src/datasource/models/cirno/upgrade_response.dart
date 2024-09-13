class ShipUpgradeResponse {
  final int code;
  final String message;
  final List<int> shipPath;
  final List<HistoryWbCcu> historyWbCcuList;

  ShipUpgradeResponse({
    required this.code,
    required this.message,
    required this.shipPath,
    required this.historyWbCcuList,
  });

  factory ShipUpgradeResponse.fromJson(Map<String, dynamic> json) {
    return ShipUpgradeResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      shipPath: List<int>.from(json['ship_path']),
      historyWbCcuList: (json['history_wb_ccu_list'] as List)
          .map((item) => HistoryWbCcu.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'ship_path': shipPath,
      'history_wb_ccu_list': historyWbCcuList.map((item) => item.toJson()).toList(),
    };
  }
}

class HistoryWbCcu {
  final int fromShipId;
  final int toShipId;
  final int value;
  final String title;

  HistoryWbCcu({
    required this.fromShipId,
    required this.toShipId,
    required this.value,
    required this.title,
  });

  factory HistoryWbCcu.fromJson(Map<String, dynamic> json) {
    return HistoryWbCcu(
      fromShipId: json['from_ship_id'] as int,
      toShipId: json['to_ship_id'] as int,
      value: json['value'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from_ship_id': fromShipId,
      'to_ship_id': toShipId,
      'value': value,
      'title': title,
    };
  }
}