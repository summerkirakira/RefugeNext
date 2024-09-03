class UpgradeInfo {
  int? id;
  String? name;
  String? upgradeType;
  Null? upgradeValue;
  List<MatchItems>? matchItems;
  List<MatchItems>? targetItems;

  UpgradeInfo(
      {this.id,
        this.name,
        this.upgradeType,
        this.upgradeValue,
        this.matchItems,
        this.targetItems});

  UpgradeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    upgradeType = json['upgrade_type'];
    upgradeValue = json['upgrade_value'];
    if (json['match_items'] != null) {
      matchItems = <MatchItems>[];
      json['match_items'].forEach((v) {
        matchItems!.add(new MatchItems.fromJson(v));
      });
    }
    if (json['target_items'] != null) {
      targetItems = <MatchItems>[];
      json['target_items'].forEach((v) {
        targetItems!.add(new MatchItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['upgrade_type'] = this.upgradeType;
    data['upgrade_value'] = this.upgradeValue;
    if (this.matchItems != null) {
      data['match_items'] = this.matchItems!.map((v) => v.toJson()).toList();
    }
    if (this.targetItems != null) {
      data['target_items'] = this.targetItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatchItems {
  int? id;
  String? name;

  MatchItems({this.id, this.name});

  MatchItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
