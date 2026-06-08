//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/shield_damage_range.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shield_damage_map.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShieldDamageMap {
  /// Returns a new [ShieldDamageMap] instance.
  ShieldDamageMap({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? physical;



  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? energy;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? distortion;



  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? thermal;



  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? biochemical;



  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageRange? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShieldDamageMap &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun;

    @override
    int get hashCode =>
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode);

  factory ShieldDamageMap.fromJson(Map<String, dynamic> json) => _$ShieldDamageMapFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldDamageMapToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

