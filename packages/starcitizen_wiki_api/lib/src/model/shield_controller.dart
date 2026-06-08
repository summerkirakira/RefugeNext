//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'shield_controller.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShieldController {
  /// Returns a new [ShieldController] instance.
  ShieldController({

     this.faceType,

     this.maxReallocation,

     this.reconfigurationCooldown,

     this.maxElectricalChargeDamageRate,
  });

      /// Shield face layout type.
  @JsonKey(
    
    name: r'face_type',
    required: false,
    includeIfNull: false,
  )


  final String? faceType;



      /// Maximum shield reallocation fraction.
  @JsonKey(
    
    name: r'max_reallocation',
    required: false,
    includeIfNull: false,
  )


  final double? maxReallocation;



      /// Cooldown after shield reconfiguration in seconds.
  @JsonKey(
    
    name: r'reconfiguration_cooldown',
    required: false,
    includeIfNull: false,
  )


  final double? reconfigurationCooldown;



      /// Maximum electrical charge damage rate.
  @JsonKey(
    
    name: r'max_electrical_charge_damage_rate',
    required: false,
    includeIfNull: false,
  )


  final double? maxElectricalChargeDamageRate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShieldController &&
      other.faceType == faceType &&
      other.maxReallocation == maxReallocation &&
      other.reconfigurationCooldown == reconfigurationCooldown &&
      other.maxElectricalChargeDamageRate == maxElectricalChargeDamageRate;

    @override
    int get hashCode =>
        (faceType == null ? 0 : faceType.hashCode) +
        (maxReallocation == null ? 0 : maxReallocation.hashCode) +
        (reconfigurationCooldown == null ? 0 : reconfigurationCooldown.hashCode) +
        (maxElectricalChargeDamageRate == null ? 0 : maxElectricalChargeDamageRate.hashCode);

  factory ShieldController.fromJson(Map<String, dynamic> json) => _$ShieldControllerFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldControllerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

