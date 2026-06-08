//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_tag.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationTag {
  /// Returns a new [GameStarmapLocationTag] instance.
  GameStarmapLocationTag({

     this.uuid,

     this.name,
  });

      /// Unique identifier of the hierarchy entity tag.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Tag name, typically an orbital or navigational marker code (e.g. HUR_L1, ARC_L2).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationTag &&
      other.uuid == uuid &&
      other.name == name;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode;

  factory GameStarmapLocationTag.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationTagFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationTagToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

