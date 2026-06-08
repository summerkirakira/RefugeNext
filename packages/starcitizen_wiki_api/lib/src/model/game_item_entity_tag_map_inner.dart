//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_item_entity_tag_map_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemEntityTagMapInner {
  /// Returns a new [GameItemEntityTagMapInner] instance.
  GameItemEntityTagMapInner({

     this.uuid,

     this.name,
  });

      /// Unique identifier of the entity tag.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Name of the entity tag.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemEntityTagMapInner &&
      other.uuid == uuid &&
      other.name == name;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode;

  factory GameItemEntityTagMapInner.fromJson(Map<String, dynamic> json) => _$GameItemEntityTagMapInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemEntityTagMapInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

