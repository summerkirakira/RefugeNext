//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'shield_regen_delay.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShieldRegenDelay {
  /// Returns a new [ShieldRegenDelay] instance.
  ShieldRegenDelay({

     this.downed,

     this.damage,
  });

      /// Delay after shields are fully downed.
  @JsonKey(
    
    name: r'downed',
    required: false,
    includeIfNull: false,
  )


  final double? downed;



      /// Delay after taking damage (without being fully downed).
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShieldRegenDelay &&
      other.downed == downed &&
      other.damage == damage;

    @override
    int get hashCode =>
        (downed == null ? 0 : downed.hashCode) +
        (damage == null ? 0 : damage.hashCode);

  factory ShieldRegenDelay.fromJson(Map<String, dynamic> json) => _$ShieldRegenDelayFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldRegenDelayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

