//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_fixed_weapons_weapons_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weaponry_fixed_weapons.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponryFixedWeapons {
  /// Returns a new [GameVehicleWeaponryFixedWeapons] instance.
  GameVehicleWeaponryFixedWeapons({

     this.dpsTotal,

     this.sustainedDpsTotal,

     this.alphaTotal,

     this.weapons,
  });

  @JsonKey(
    
    name: r'dps_total',
    required: false,
    includeIfNull: false,
  )


  final num? dpsTotal;



  @JsonKey(
    
    name: r'sustained_dps_total',
    required: false,
    includeIfNull: false,
  )


  final num? sustainedDpsTotal;



  @JsonKey(
    
    name: r'alpha_total',
    required: false,
    includeIfNull: false,
  )


  final num? alphaTotal;



  @JsonKey(
    
    name: r'weapons',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleWeaponryFixedWeaponsWeaponsInner>? weapons;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponryFixedWeapons &&
      other.dpsTotal == dpsTotal &&
      other.sustainedDpsTotal == sustainedDpsTotal &&
      other.alphaTotal == alphaTotal &&
      other.weapons == weapons;

    @override
    int get hashCode =>
        (dpsTotal == null ? 0 : dpsTotal.hashCode) +
        (sustainedDpsTotal == null ? 0 : sustainedDpsTotal.hashCode) +
        (alphaTotal == null ? 0 : alphaTotal.hashCode) +
        (weapons == null ? 0 : weapons.hashCode);

  factory GameVehicleWeaponryFixedWeapons.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponryFixedWeaponsFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponryFixedWeaponsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

