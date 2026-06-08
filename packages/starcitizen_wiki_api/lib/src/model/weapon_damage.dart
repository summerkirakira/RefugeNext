//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_damage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponDamage {
  /// Returns a new [WeaponDamage] instance.
  WeaponDamage({

     this.type,

     this.name,

     this.damage,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponDamage &&
      other.type == type &&
      other.name == name &&
      other.damage == damage;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (damage == null ? 0 : damage.hashCode);

  factory WeaponDamage.fromJson(Map<String, dynamic> json) => _$WeaponDamageFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponDamageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

