//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weaponry_fixed_weapons_weapons_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponryFixedWeaponsWeaponsInner {
  /// Returns a new [GameVehicleWeaponryFixedWeaponsWeaponsInner] instance.
  GameVehicleWeaponryFixedWeaponsWeaponsInner({

     this.name,

     this.dps,

     this.sustainedDps,

     this.alpha,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'dps',
    required: false,
    includeIfNull: false,
  )


  final num? dps;



  @JsonKey(
    
    name: r'sustained_dps',
    required: false,
    includeIfNull: false,
  )


  final num? sustainedDps;



  @JsonKey(
    
    name: r'alpha',
    required: false,
    includeIfNull: false,
  )


  final num? alpha;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponryFixedWeaponsWeaponsInner &&
      other.name == name &&
      other.dps == dps &&
      other.sustainedDps == sustainedDps &&
      other.alpha == alpha;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (dps == null ? 0 : dps.hashCode) +
        (sustainedDps == null ? 0 : sustainedDps.hashCode) +
        (alpha == null ? 0 : alpha.hashCode);

  factory GameVehicleWeaponryFixedWeaponsWeaponsInner.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponryFixedWeaponsWeaponsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponryFixedWeaponsWeaponsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

