//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_type.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationType {
  /// Returns a new [GameStarmapLocationType] instance.
  GameStarmapLocationType({

     this.uuid,

     this.name,

     this.classification,

     this.spawnNavPoints,

     this.validQuantumTravelDestination,
  });

      /// UUID of the location type.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Type name (e.g. Planet, Moon, Outpost, Asteroid).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Sub-classification of the location type (e.g. Outpost, LandingZone).
  @JsonKey(
    
    name: r'classification',
    required: false,
    includeIfNull: false,
  )


  final String? classification;



      /// Whether this location type spawns navigation points.
  @JsonKey(
    
    name: r'spawn_nav_points',
    required: false,
    includeIfNull: false,
  )


  final bool? spawnNavPoints;



      /// Whether this location type is a valid quantum travel destination.
  @JsonKey(
    
    name: r'valid_quantum_travel_destination',
    required: false,
    includeIfNull: false,
  )


  final bool? validQuantumTravelDestination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationType &&
      other.uuid == uuid &&
      other.name == name &&
      other.classification == classification &&
      other.spawnNavPoints == spawnNavPoints &&
      other.validQuantumTravelDestination == validQuantumTravelDestination;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        name.hashCode +
        (classification == null ? 0 : classification.hashCode) +
        (spawnNavPoints == null ? 0 : spawnNavPoints.hashCode) +
        (validQuantumTravelDestination == null ? 0 : validQuantumTravelDestination.hashCode);

  factory GameStarmapLocationType.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

