//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_missiles_damage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weaponry_missiles.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponryMissiles {
  /// Returns a new [GameVehicleWeaponryMissiles] instance.
  GameVehicleWeaponryMissiles({

     this.count,

     this.damage,
  });

  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleWeaponryMissilesDamage? damage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponryMissiles &&
      other.count == count &&
      other.damage == damage;

    @override
    int get hashCode =>
        (count == null ? 0 : count.hashCode) +
        (damage == null ? 0 : damage.hashCode);

  factory GameVehicleWeaponryMissiles.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponryMissilesFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponryMissilesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

