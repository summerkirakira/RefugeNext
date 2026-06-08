//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'clothing_resistances_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClothingResistancesInner {
  /// Returns a new [ClothingResistancesInner] instance.
  ClothingResistancesInner({

     this.type,

     this.multiplier,

     this.threshold,
  });

      /// Damage type (physical, energy, distortion, thermal, biochemical, stun).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Damage multiplier for this resistance. Lower values mean more resistance.
  @JsonKey(
    
    name: r'multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? multiplier;



      /// Damage threshold value for this resistance type.
  @JsonKey(
    
    name: r'threshold',
    required: false,
    includeIfNull: false,
  )


  final double? threshold;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClothingResistancesInner &&
      other.type == type &&
      other.multiplier == multiplier &&
      other.threshold == threshold;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (multiplier == null ? 0 : multiplier.hashCode) +
        (threshold == null ? 0 : threshold.hashCode);

  factory ClothingResistancesInner.fromJson(Map<String, dynamic> json) => _$ClothingResistancesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ClothingResistancesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

