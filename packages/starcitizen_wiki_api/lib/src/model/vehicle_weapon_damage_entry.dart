//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_damage_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponDamageEntry {
  /// Returns a new [VehicleWeaponDamageEntry] instance.
  VehicleWeaponDamageEntry({

     this.type,

     this.name,

     this.damage,
  });

      /// Damage phase bucket.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Damage type name (lowercase).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Damage value.
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponDamageEntry &&
      other.type == type &&
      other.name == name &&
      other.damage == damage;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (damage == null ? 0 : damage.hashCode);

  factory VehicleWeaponDamageEntry.fromJson(Map<String, dynamic> json) => _$VehicleWeaponDamageEntryFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponDamageEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

