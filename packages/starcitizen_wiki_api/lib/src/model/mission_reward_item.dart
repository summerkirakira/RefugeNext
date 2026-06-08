//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_reward_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionRewardItem {
  /// Returns a new [MissionRewardItem] instance.
  MissionRewardItem({

     this.name,

     this.uuid,

     this.amount,

     this.sendToHome,

     this.link,

     this.webUrl,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final int? amount;



  @JsonKey(
    
    name: r'send_to_home',
    required: false,
    includeIfNull: false,
  )


  final bool? sendToHome;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionRewardItem &&
      other.name == name &&
      other.uuid == uuid &&
      other.amount == amount &&
      other.sendToHome == sendToHome &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (amount == null ? 0 : amount.hashCode) +
        (sendToHome == null ? 0 : sendToHome.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionRewardItem.fromJson(Map<String, dynamic> json) => _$MissionRewardItemFromJson(json);

  Map<String, dynamic> toJson() => _$MissionRewardItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

