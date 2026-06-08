//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_quantum_travel.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationQuantumTravel {
  /// Returns a new [GameStarmapLocationQuantumTravel] instance.
  GameStarmapLocationQuantumTravel({

     this.obstructionRadius,

     this.obstructionRadiusFormatted,

     this.arrivalRadius,

     this.arrivalRadiusFormatted,

     this.arrivalPointDetectionOffset,

     this.adoptionRadius,

     this.adoptionRadiusFormatted,

     this.subPointRadiusMultiplier,
  });

      /// Radius around the location that obstructs quantum travel.
  @JsonKey(
    
    name: r'obstruction_radius',
    required: false,
    includeIfNull: false,
  )


  final num? obstructionRadius;



      /// Obstruction radius formatted as human-readable distance (GM/km/m).
  @JsonKey(
    
    name: r'obstruction_radius_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? obstructionRadiusFormatted;



      /// Radius at which a ship exits quantum travel near this location.
  @JsonKey(
    
    name: r'arrival_radius',
    required: false,
    includeIfNull: false,
  )


  final num? arrivalRadius;



      /// Arrival radius formatted as human-readable distance (GM/km/m).
  @JsonKey(
    
    name: r'arrival_radius_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? arrivalRadiusFormatted;



      /// Positional offset for detecting the quantum travel arrival point.
  @JsonKey(
    
    name: r'arrival_point_detection_offset',
    required: false,
    includeIfNull: false,
  )


  final num? arrivalPointDetectionOffset;



      /// Radius within which child locations are adopted into the quantum travel zone.
  @JsonKey(
    
    name: r'adoption_radius',
    required: false,
    includeIfNull: false,
  )


  final num? adoptionRadius;



      /// Adoption radius formatted as human-readable distance (GM/km/m).
  @JsonKey(
    
    name: r'adoption_radius_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? adoptionRadiusFormatted;



      /// Multiplier applied to the sub-point radius for quantum travel calculations.
  @JsonKey(
    
    name: r'sub_point_radius_multiplier',
    required: false,
    includeIfNull: false,
  )


  final num? subPointRadiusMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationQuantumTravel &&
      other.obstructionRadius == obstructionRadius &&
      other.obstructionRadiusFormatted == obstructionRadiusFormatted &&
      other.arrivalRadius == arrivalRadius &&
      other.arrivalRadiusFormatted == arrivalRadiusFormatted &&
      other.arrivalPointDetectionOffset == arrivalPointDetectionOffset &&
      other.adoptionRadius == adoptionRadius &&
      other.adoptionRadiusFormatted == adoptionRadiusFormatted &&
      other.subPointRadiusMultiplier == subPointRadiusMultiplier;

    @override
    int get hashCode =>
        obstructionRadius.hashCode +
        (obstructionRadiusFormatted == null ? 0 : obstructionRadiusFormatted.hashCode) +
        arrivalRadius.hashCode +
        (arrivalRadiusFormatted == null ? 0 : arrivalRadiusFormatted.hashCode) +
        arrivalPointDetectionOffset.hashCode +
        adoptionRadius.hashCode +
        (adoptionRadiusFormatted == null ? 0 : adoptionRadiusFormatted.hashCode) +
        subPointRadiusMultiplier.hashCode;

  factory GameStarmapLocationQuantumTravel.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationQuantumTravelFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationQuantumTravelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

