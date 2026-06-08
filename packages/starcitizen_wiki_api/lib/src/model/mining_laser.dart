//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mining_laser_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/mining_laser_power_band.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mining_laser.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningLaser {
  /// Returns a new [MiningLaser] instance.
  MiningLaser({

     this.laserPower,

     this.modifiers,

     this.moduleSlots,

     this.throttleLerpSpeed,

     this.throttleMinimum,

     this.powerTransfer,

     this.miningLaserPower,

     this.modifierMap,

     this.extractionLaserPower,

     this.optimalRange,

     this.maximumRange,

     this.extractionThroughput,

     this.collectionPointRadius,
  });

  @JsonKey(
    
    name: r'laser_power',
    required: false,
    includeIfNull: false,
  )


  final MiningLaserPowerBand? laserPower;



      /// Deprecated: Use modifier_map. List of non-null gameplay modifiers derived from stdItem.MiningLaser.Modifiers.
  @Deprecated('modifiers has been deprecated')
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final List<MiningLaserModifier>? modifiers;



      /// Number of mining module/consumable slots (ModuleSlots).
  @JsonKey(
    
    name: r'module_slots',
    required: false,
    includeIfNull: false,
  )


  final int? moduleSlots;



      /// How quickly the throttle responds to input changes.
  @JsonKey(
    
    name: r'throttle_lerp_speed',
    required: false,
    includeIfNull: false,
  )


  final double? throttleLerpSpeed;



      /// Minimum throttle value when firing.
  @JsonKey(
    
    name: r'throttle_minimum',
    required: false,
    includeIfNull: false,
  )


  final double? throttleMinimum;



      /// Deprecated. Use `laser_power.maximum`.
  @Deprecated('powerTransfer has been deprecated')
  @JsonKey(
    
    name: r'power_transfer',
    required: false,
    includeIfNull: false,
  )


  final double? powerTransfer;



      /// Deprecated. Use `laser_power.minimum` and `laser_power.maximum` (this is a formatted string range).
  @Deprecated('miningLaserPower has been deprecated')
  @JsonKey(
    
    name: r'mining_laser_power',
    required: false,
    includeIfNull: false,
  )


  final String? miningLaserPower;



      /// Key-value map of mining laser modifier names to their numeric values.
  @JsonKey(
    
    name: r'modifier_map',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? modifierMap;



      /// Deprecated. Prefer `extraction_throughput` when available (this value is taken from description text).
  @Deprecated('extractionLaserPower has been deprecated')
  @JsonKey(
    
    name: r'extraction_laser_power',
    required: false,
    includeIfNull: false,
  )


  final String? extractionLaserPower;



      /// Optimal mining distance in meters (OptimalRange).
  @JsonKey(
    
    name: r'optimal_range',
    required: false,
    includeIfNull: false,
  )


  final double? optimalRange;



      /// Maximum effective range in meters (MaximumRange).
  @JsonKey(
    
    name: r'maximum_range',
    required: false,
    includeIfNull: false,
  )


  final double? maximumRange;



      /// Rate at which ore is extracted from the target.
  @JsonKey(
    
    name: r'extraction_throughput',
    required: false,
    includeIfNull: false,
  )


  final double? extractionThroughput;



      /// Radius of the mining beam at the collection point.
  @JsonKey(
    
    name: r'collection_point_radius',
    required: false,
    includeIfNull: false,
  )


  final double? collectionPointRadius;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningLaser &&
      other.laserPower == laserPower &&
      other.modifiers == modifiers &&
      other.moduleSlots == moduleSlots &&
      other.throttleLerpSpeed == throttleLerpSpeed &&
      other.throttleMinimum == throttleMinimum &&
      other.powerTransfer == powerTransfer &&
      other.miningLaserPower == miningLaserPower &&
      other.modifierMap == modifierMap &&
      other.extractionLaserPower == extractionLaserPower &&
      other.optimalRange == optimalRange &&
      other.maximumRange == maximumRange &&
      other.extractionThroughput == extractionThroughput &&
      other.collectionPointRadius == collectionPointRadius;

    @override
    int get hashCode =>
        laserPower.hashCode +
        modifiers.hashCode +
        (moduleSlots == null ? 0 : moduleSlots.hashCode) +
        (throttleLerpSpeed == null ? 0 : throttleLerpSpeed.hashCode) +
        (throttleMinimum == null ? 0 : throttleMinimum.hashCode) +
        (powerTransfer == null ? 0 : powerTransfer.hashCode) +
        (miningLaserPower == null ? 0 : miningLaserPower.hashCode) +
        modifierMap.hashCode +
        (extractionLaserPower == null ? 0 : extractionLaserPower.hashCode) +
        (optimalRange == null ? 0 : optimalRange.hashCode) +
        (maximumRange == null ? 0 : maximumRange.hashCode) +
        (extractionThroughput == null ? 0 : extractionThroughput.hashCode) +
        (collectionPointRadius == null ? 0 : collectionPointRadius.hashCode);

  factory MiningLaser.fromJson(Map<String, dynamic> json) => _$MiningLaserFromJson(json);

  Map<String, dynamic> toJson() => _$MiningLaserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

