//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_blueprint_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemBlueprintLink {
  /// Returns a new [ItemBlueprintLink] instance.
  ItemBlueprintLink({

     this.uuid,

     this.name,

     this.link,
  });

      /// Unique identifier of the blueprint.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the blueprint.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// API URL for the blueprint detail endpoint.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemBlueprintLink &&
      other.uuid == uuid &&
      other.name == name &&
      other.link == link;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        link.hashCode;

  factory ItemBlueprintLink.fromJson(Map<String, dynamic> json) => _$ItemBlueprintLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBlueprintLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

