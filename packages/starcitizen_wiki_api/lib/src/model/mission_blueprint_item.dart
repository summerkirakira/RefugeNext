//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_blueprint_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionBlueprintItem {
  /// Returns a new [MissionBlueprintItem] instance.
  MissionBlueprintItem({

     this.name,

     this.uuid,

     this.itemLink,

     this.blueprintLink,

     this.webItemLink,

     this.webBlueprintLink,
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
    
    name: r'item_link',
    required: false,
    includeIfNull: false,
  )


  final String? itemLink;



  @JsonKey(
    
    name: r'blueprint_link',
    required: false,
    includeIfNull: false,
  )


  final String? blueprintLink;



  @JsonKey(
    
    name: r'web_item_link',
    required: false,
    includeIfNull: false,
  )


  final String? webItemLink;



  @JsonKey(
    
    name: r'web_blueprint_link',
    required: false,
    includeIfNull: false,
  )


  final String? webBlueprintLink;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionBlueprintItem &&
      other.name == name &&
      other.uuid == uuid &&
      other.itemLink == itemLink &&
      other.blueprintLink == blueprintLink &&
      other.webItemLink == webItemLink &&
      other.webBlueprintLink == webBlueprintLink;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (itemLink == null ? 0 : itemLink.hashCode) +
        (blueprintLink == null ? 0 : blueprintLink.hashCode) +
        (webItemLink == null ? 0 : webItemLink.hashCode) +
        (webBlueprintLink == null ? 0 : webBlueprintLink.hashCode);

  factory MissionBlueprintItem.fromJson(Map<String, dynamic> json) => _$MissionBlueprintItemFromJson(json);

  Map<String, dynamic> toJson() => _$MissionBlueprintItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

