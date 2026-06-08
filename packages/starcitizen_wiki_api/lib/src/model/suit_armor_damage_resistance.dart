//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/suit_armor_type_resistance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suit_armor_damage_resistance.g.dart';


@Deprecated('SuitArmorDamageResistance has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuitArmorDamageResistance {
  /// Returns a new [SuitArmorDamageResistance] instance.
  SuitArmorDamageResistance({

     this.impact,

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

  @JsonKey(
    
    name: r'impact',
    required: false,
    includeIfNull: false,
  )


  final double? impact;



  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? physical;



  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? energy;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? distortion;



  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? thermal;



  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? biochemical;



  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorTypeResistance? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SuitArmorDamageResistance &&
      other.impact == impact &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun;

    @override
    int get hashCode =>
        (impact == null ? 0 : impact.hashCode) +
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode);

  factory SuitArmorDamageResistance.fromJson(Map<String, dynamic> json) => _$SuitArmorDamageResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$SuitArmorDamageResistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

