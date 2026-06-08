//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'thruster_backwash.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ThrusterBackwash {
  /// Returns a new [ThrusterBackwash] instance.
  ThrusterBackwash({

     this.enabled,

     this.automateSize,

     this.maxSpeed,

     this.maxDensity,

     this.maxResistance,

     this.afterburnerMultiplier,
  });

      /// Whether backwash effects are enabled.
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;



      /// Automatically size backwash based on output.
  @JsonKey(
    
    name: r'automate_size',
    required: false,
    includeIfNull: false,
  )


  final bool? automateSize;



      /// Max speed (m/s) at which backwash applies.
  @JsonKey(
    
    name: r'max_speed',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeed;



      /// Max atmospheric density where backwash is considered.
  @JsonKey(
    
    name: r'max_density',
    required: false,
    includeIfNull: false,
  )


  final double? maxDensity;



      /// Max resistance value for backwash interaction.
  @JsonKey(
    
    name: r'max_resistance',
    required: false,
    includeIfNull: false,
  )


  final double? maxResistance;



      /// Backwash intensity multiplier while afterburning.
  @JsonKey(
    
    name: r'afterburner_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? afterburnerMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ThrusterBackwash &&
      other.enabled == enabled &&
      other.automateSize == automateSize &&
      other.maxSpeed == maxSpeed &&
      other.maxDensity == maxDensity &&
      other.maxResistance == maxResistance &&
      other.afterburnerMultiplier == afterburnerMultiplier;

    @override
    int get hashCode =>
        (enabled == null ? 0 : enabled.hashCode) +
        (automateSize == null ? 0 : automateSize.hashCode) +
        (maxSpeed == null ? 0 : maxSpeed.hashCode) +
        (maxDensity == null ? 0 : maxDensity.hashCode) +
        (maxResistance == null ? 0 : maxResistance.hashCode) +
        (afterburnerMultiplier == null ? 0 : afterburnerMultiplier.hashCode);

  factory ThrusterBackwash.fromJson(Map<String, dynamic> json) => _$ThrusterBackwashFromJson(json);

  Map<String, dynamic> toJson() => _$ThrusterBackwashToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

