//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_linked_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationLinkedSummary {
  /// Returns a new [GameStarmapLocationLinkedSummary] instance.
  GameStarmapLocationLinkedSummary({

     this.uuid,

     this.name,

     this.typeName,

     this.slug,
  });

      /// Unique identifier of the linked location.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the linked location.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Type name of the linked location (e.g. Planet, Moon, Outpost).
  @JsonKey(
    
    name: r'type_name',
    required: false,
    includeIfNull: false,
  )


  final String? typeName;



      /// URL-friendly slug for the linked location.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationLinkedSummary &&
      other.uuid == uuid &&
      other.name == name &&
      other.typeName == typeName &&
      other.slug == slug;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        typeName.hashCode +
        (slug == null ? 0 : slug.hashCode);

  factory GameStarmapLocationLinkedSummary.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationLinkedSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationLinkedSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

