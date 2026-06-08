//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_affiliation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationAffiliation {
  /// Returns a new [GameStarmapLocationAffiliation] instance.
  GameStarmapLocationAffiliation({

     this.uuid,

     this.name,
  });

      /// UUID of the affiliated faction or organization.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the affiliated faction or organization (e.g. UEE, Private Security).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationAffiliation &&
      other.uuid == uuid &&
      other.name == name;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode);

  factory GameStarmapLocationAffiliation.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationAffiliationFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationAffiliationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

