//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_zeroing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierZeroing {
  /// Returns a new [WeaponModifierZeroing] instance.
  WeaponModifierZeroing({

     this.defaultRange,

     this.maxRange,

     this.rangeIncrement,

     this.autoZeroingTime,
  });

      /// Default zeroing range in meters.
  @JsonKey(
    
    name: r'default_range',
    required: false,
    includeIfNull: false,
  )


  final double? defaultRange;



      /// Maximum zeroing range in meters.
  @JsonKey(
    
    name: r'max_range',
    required: false,
    includeIfNull: false,
  )


  final double? maxRange;



      /// Zeroing range increment in meters.
  @JsonKey(
    
    name: r'range_increment',
    required: false,
    includeIfNull: false,
  )


  final double? rangeIncrement;



      /// Auto-zeroing time in seconds.
  @JsonKey(
    
    name: r'auto_zeroing_time',
    required: false,
    includeIfNull: false,
  )


  final double? autoZeroingTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierZeroing &&
      other.defaultRange == defaultRange &&
      other.maxRange == maxRange &&
      other.rangeIncrement == rangeIncrement &&
      other.autoZeroingTime == autoZeroingTime;

    @override
    int get hashCode =>
        (defaultRange == null ? 0 : defaultRange.hashCode) +
        (maxRange == null ? 0 : maxRange.hashCode) +
        (rangeIncrement == null ? 0 : rangeIncrement.hashCode) +
        (autoZeroingTime == null ? 0 : autoZeroingTime.hashCode);

  factory WeaponModifierZeroing.fromJson(Map<String, dynamic> json) => _$WeaponModifierZeroingFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierZeroingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

