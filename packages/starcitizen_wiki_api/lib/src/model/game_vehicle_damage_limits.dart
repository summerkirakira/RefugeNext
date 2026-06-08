//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_damage_limits.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleDamageLimits {
  /// Returns a new [GameVehicleDamageLimits] instance.
  GameVehicleDamageLimits({

     this.beforeDestruction,

     this.beforeDetach,
  });

      /// Map of part name => damage capacity before destruction.
  @JsonKey(
    
    name: r'before_destruction',
    required: false,
    includeIfNull: false,
  )


  final Object? beforeDestruction;



      /// Map of part name => damage before detachment.
  @JsonKey(
    
    name: r'before_detach',
    required: false,
    includeIfNull: false,
  )


  final Object? beforeDetach;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleDamageLimits &&
      other.beforeDestruction == beforeDestruction &&
      other.beforeDetach == beforeDetach;

    @override
    int get hashCode =>
        (beforeDestruction == null ? 0 : beforeDestruction.hashCode) +
        (beforeDetach == null ? 0 : beforeDetach.hashCode);

  factory GameVehicleDamageLimits.fromJson(Map<String, dynamic> json) => _$GameVehicleDamageLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleDamageLimitsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

