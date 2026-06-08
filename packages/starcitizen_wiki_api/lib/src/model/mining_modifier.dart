//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mining_modifier_value.dart';
import 'package:starcitizen_wiki_api/src/model/mining_modifier_power_modifier.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mining_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModifier {
  /// Returns a new [MiningModifier] instance.
  MiningModifier({

     this.type,

     this.itemType,

     this.charges,

     this.duration,

     this.powerModifier,

     this.modifierMap,
  });

      /// Modifier type (from MiningModule.Type).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`.
  @JsonKey(
    
    name: r'item_type',
    required: false,
    includeIfNull: false,
  )


  final MiningModifierItemTypeEnum? itemType;



      /// Remaining charges (MiningModule.Charges). `null` when the source value is -1 (unlimited).
  @JsonKey(
    
    name: r'charges',
    required: false,
    includeIfNull: false,
  )


  final int? charges;



      /// Lifetime/duration in seconds (MiningModule.Lifetime).
  @JsonKey(
    
    name: r'duration',
    required: false,
    includeIfNull: false,
  )


  final double? duration;



  @JsonKey(
    
    name: r'power_modifier',
    required: false,
    includeIfNull: false,
  )


  final MiningModifierPowerModifier? powerModifier;



      /// Map of modifier keys to values.
  @JsonKey(
    
    name: r'modifier_map',
    required: false,
    includeIfNull: false,
  )


  final Map<String, MiningModifierValue>? modifierMap;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModifier &&
      other.type == type &&
      other.itemType == itemType &&
      other.charges == charges &&
      other.duration == duration &&
      other.powerModifier == powerModifier &&
      other.modifierMap == modifierMap;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (itemType == null ? 0 : itemType.hashCode) +
        (charges == null ? 0 : charges.hashCode) +
        (duration == null ? 0 : duration.hashCode) +
        (powerModifier == null ? 0 : powerModifier.hashCode) +
        modifierMap.hashCode;

  factory MiningModifier.fromJson(Map<String, dynamic> json) => _$MiningModifierFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`.
enum MiningModifierItemTypeEnum {
    /// Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`.
@JsonValue(r'Gadget')
gadget(r'Gadget'),
    /// Derived from classification: `Gadget` when classification is `Mining.Gadget`, otherwise `Module`.
@JsonValue(r'Module')
module(r'Module');

const MiningModifierItemTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


