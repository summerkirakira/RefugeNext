//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_damage_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponDamageEntry {
  /// Returns a new [WeaponDamageEntry] instance.
  WeaponDamageEntry({

     this.type,

     this.name,

     this.damage,
  });

      /// Damage context.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Damage type name.
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
    bool operator ==(Object other) => identical(this, other) || other is WeaponDamageEntry &&
      other.type == type &&
      other.name == name &&
      other.damage == damage;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (damage == null ? 0 : damage.hashCode);

  factory WeaponDamageEntry.fromJson(Map<String, dynamic> json) => _$WeaponDamageEntryFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponDamageEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

