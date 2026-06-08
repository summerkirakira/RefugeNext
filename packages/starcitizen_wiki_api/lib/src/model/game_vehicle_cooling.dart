//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_cooling.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCooling {
  /// Returns a new [GameVehicleCooling] instance.
  GameVehicleCooling({

     this.generationSegments,

     this.usageShieldsPct,

     this.usageQuantumPct,

     this.usedSegmentsShields,

     this.usedSegmentsQuantum,

     this.usedSegmentsShieldsGrouped,

     this.usedSegmentsQuantumGrouped,
  });

      /// Total cooling generation segments available.
  @JsonKey(
    
    name: r'generation_segments',
    required: false,
    includeIfNull: false,
  )


  final num? generationSegments;



      /// Percentage of cooling used by shields.
  @JsonKey(
    
    name: r'usage_shields_pct',
    required: false,
    includeIfNull: false,
  )


  final num? usageShieldsPct;



      /// Percentage of cooling used by quantum drive.
  @JsonKey(
    
    name: r'usage_quantum_pct',
    required: false,
    includeIfNull: false,
  )


  final num? usageQuantumPct;



      /// Cooling segments consumed by shields.
  @JsonKey(
    
    name: r'used_segments_shields',
    required: false,
    includeIfNull: false,
  )


  final num? usedSegmentsShields;



      /// Cooling segments consumed by quantum drive.
  @JsonKey(
    
    name: r'used_segments_quantum',
    required: false,
    includeIfNull: false,
  )


  final num? usedSegmentsQuantum;



      /// Grouped cooling segments for shields.
  @JsonKey(
    
    name: r'used_segments_shields_grouped',
    required: false,
    includeIfNull: false,
  )


  final List<num>? usedSegmentsShieldsGrouped;



      /// Grouped cooling segments for quantum drive.
  @JsonKey(
    
    name: r'used_segments_quantum_grouped',
    required: false,
    includeIfNull: false,
  )


  final List<num>? usedSegmentsQuantumGrouped;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCooling &&
      other.generationSegments == generationSegments &&
      other.usageShieldsPct == usageShieldsPct &&
      other.usageQuantumPct == usageQuantumPct &&
      other.usedSegmentsShields == usedSegmentsShields &&
      other.usedSegmentsQuantum == usedSegmentsQuantum &&
      other.usedSegmentsShieldsGrouped == usedSegmentsShieldsGrouped &&
      other.usedSegmentsQuantumGrouped == usedSegmentsQuantumGrouped;

    @override
    int get hashCode =>
        (generationSegments == null ? 0 : generationSegments.hashCode) +
        (usageShieldsPct == null ? 0 : usageShieldsPct.hashCode) +
        (usageQuantumPct == null ? 0 : usageQuantumPct.hashCode) +
        (usedSegmentsShields == null ? 0 : usedSegmentsShields.hashCode) +
        (usedSegmentsQuantum == null ? 0 : usedSegmentsQuantum.hashCode) +
        (usedSegmentsShieldsGrouped == null ? 0 : usedSegmentsShieldsGrouped.hashCode) +
        (usedSegmentsQuantumGrouped == null ? 0 : usedSegmentsQuantumGrouped.hashCode);

  factory GameVehicleCooling.fromJson(Map<String, dynamic> json) => _$GameVehicleCoolingFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCoolingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

