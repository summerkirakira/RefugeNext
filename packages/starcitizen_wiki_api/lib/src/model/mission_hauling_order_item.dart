//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_hauling_order_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionHaulingOrderItem {
  /// Returns a new [MissionHaulingOrderItem] instance.
  MissionHaulingOrderItem({

     this.name,

     this.uuid,

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
    bool operator ==(Object other) => identical(this, other) || other is MissionHaulingOrderItem &&
      other.name == name &&
      other.uuid == uuid &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionHaulingOrderItem.fromJson(Map<String, dynamic> json) => _$MissionHaulingOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$MissionHaulingOrderItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

