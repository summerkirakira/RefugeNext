//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'suit_armor_type_resistance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuitArmorTypeResistance {
  /// Returns a new [SuitArmorTypeResistance] instance.
  SuitArmorTypeResistance({

     this.type,

     this.multiplier,

     this.threshold,
  });

      /// Damage type identifier (lowercase).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Damage multiplier. Incoming damage is scaled by this value (1.0 = no resistance, <1.0 = reduced damage).
  @JsonKey(
    
    name: r'multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? multiplier;



      /// Damage threshold before resistance applies.
  @JsonKey(
    
    name: r'threshold',
    required: false,
    includeIfNull: false,
  )


  final double? threshold;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SuitArmorTypeResistance &&
      other.type == type &&
      other.multiplier == multiplier &&
      other.threshold == threshold;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (multiplier == null ? 0 : multiplier.hashCode) +
        (threshold == null ? 0 : threshold.hashCode);

  factory SuitArmorTypeResistance.fromJson(Map<String, dynamic> json) => _$SuitArmorTypeResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$SuitArmorTypeResistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

