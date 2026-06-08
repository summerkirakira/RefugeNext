//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_rack.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponRack {
  /// Returns a new [WeaponRack] instance.
  WeaponRack({

     this.pistols,

     this.rifles,

     this.gadgets,

     this.totalWeaponSlots,
  });

      /// Number of small weapon slots.
  @JsonKey(
    
    name: r'pistols',
    required: false,
    includeIfNull: false,
  )


  final int? pistols;



      /// Number of medium and large weapon slots.
  @JsonKey(
    
    name: r'rifles',
    required: false,
    includeIfNull: false,
  )


  final int? rifles;



      /// Number of gadget slots.
  @JsonKey(
    
    name: r'gadgets',
    required: false,
    includeIfNull: false,
  )


  final int? gadgets;



      /// Total number of weapon slots across all categories.
  @JsonKey(
    
    name: r'total_weapon_slots',
    required: false,
    includeIfNull: false,
  )


  final int? totalWeaponSlots;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponRack &&
      other.pistols == pistols &&
      other.rifles == rifles &&
      other.gadgets == gadgets &&
      other.totalWeaponSlots == totalWeaponSlots;

    @override
    int get hashCode =>
        pistols.hashCode +
        rifles.hashCode +
        gadgets.hashCode +
        totalWeaponSlots.hashCode;

  factory WeaponRack.fromJson(Map<String, dynamic> json) => _$WeaponRackFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponRackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

