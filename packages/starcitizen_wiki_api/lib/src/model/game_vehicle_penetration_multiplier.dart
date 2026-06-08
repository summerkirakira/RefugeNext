//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_penetration_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePenetrationMultiplier {
  /// Returns a new [GameVehiclePenetrationMultiplier] instance.
  GameVehiclePenetrationMultiplier({

     this.fuse,

     this.components,
  });

      /// Fuse penetration multiplier.
  @JsonKey(
    
    name: r'fuse',
    required: false,
    includeIfNull: false,
  )


  final num? fuse;



      /// Components penetration multiplier.
  @JsonKey(
    
    name: r'components',
    required: false,
    includeIfNull: false,
  )


  final num? components;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePenetrationMultiplier &&
      other.fuse == fuse &&
      other.components == components;

    @override
    int get hashCode =>
        (fuse == null ? 0 : fuse.hashCode) +
        (components == null ? 0 : components.hashCode);

  factory GameVehiclePenetrationMultiplier.fromJson(Map<String, dynamic> json) => _$GameVehiclePenetrationMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePenetrationMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

