//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'harvestable_setup.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HarvestableSetup {
  /// Returns a new [HarvestableSetup] instance.
  HarvestableSetup({

     this.respawnSeconds,

     this.respawnFormatted,

     this.despawnSeconds,

     this.despawnFormatted,

     this.relativeProbability,

     this.relativeProbabilityPercent,

     this.respawnMultiplier,

     this.additionalWaitSeconds,

     this.additionalWaitFormatted,
  });

      /// Time in seconds before a harvested instance respawns.
  @JsonKey(
    
    name: r'respawn_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? respawnSeconds;



      /// Human-readable respawn duration (e.g. \"5m 30s\").
  @JsonKey(
    
    name: r'respawn_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? respawnFormatted;



      /// Time in seconds before an uncollected instance despawns.
  @JsonKey(
    
    name: r'despawn_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? despawnSeconds;



      /// Human-readable despawn duration (e.g. \"10m\").
  @JsonKey(
    
    name: r'despawn_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? despawnFormatted;



      /// Raw relative spawn probability for this harvestable (0-1).
  @JsonKey(
    
    name: r'relative_probability',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbability;



      /// Relative spawn probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'relative_probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityPercent;



      /// Multiplier applied to the base respawn time.
  @JsonKey(
    
    name: r'respawn_multiplier',
    required: false,
    includeIfNull: false,
  )


  final num? respawnMultiplier;



      /// Extra wait time in seconds added when nearby players are present.
  @JsonKey(
    
    name: r'additional_wait_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? additionalWaitSeconds;



      /// Human-readable additional wait duration (e.g. \"2m\").
  @JsonKey(
    
    name: r'additional_wait_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? additionalWaitFormatted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HarvestableSetup &&
      other.respawnSeconds == respawnSeconds &&
      other.respawnFormatted == respawnFormatted &&
      other.despawnSeconds == despawnSeconds &&
      other.despawnFormatted == despawnFormatted &&
      other.relativeProbability == relativeProbability &&
      other.relativeProbabilityPercent == relativeProbabilityPercent &&
      other.respawnMultiplier == respawnMultiplier &&
      other.additionalWaitSeconds == additionalWaitSeconds &&
      other.additionalWaitFormatted == additionalWaitFormatted;

    @override
    int get hashCode =>
        (respawnSeconds == null ? 0 : respawnSeconds.hashCode) +
        (respawnFormatted == null ? 0 : respawnFormatted.hashCode) +
        (despawnSeconds == null ? 0 : despawnSeconds.hashCode) +
        (despawnFormatted == null ? 0 : despawnFormatted.hashCode) +
        (relativeProbability == null ? 0 : relativeProbability.hashCode) +
        (relativeProbabilityPercent == null ? 0 : relativeProbabilityPercent.hashCode) +
        (respawnMultiplier == null ? 0 : respawnMultiplier.hashCode) +
        (additionalWaitSeconds == null ? 0 : additionalWaitSeconds.hashCode) +
        (additionalWaitFormatted == null ? 0 : additionalWaitFormatted.hashCode);

  factory HarvestableSetup.fromJson(Map<String, dynamic> json) => _$HarvestableSetupFromJson(json);

  Map<String, dynamic> toJson() => _$HarvestableSetupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

