//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'shield_damage_range.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShieldDamageRange {
  /// Returns a new [ShieldDamageRange] instance.
  ShieldDamageRange({

     this.min,

     this.max,
  });

      /// Minimum value.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum value.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShieldDamageRange &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory ShieldDamageRange.fromJson(Map<String, dynamic> json) => _$ShieldDamageRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldDamageRangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

