//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'seat_axis.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SeatAxis {
  /// Returns a new [SeatAxis] instance.
  SeatAxis({

     this.min,

     this.max,

     this.minimum,

     this.maximum,
  });

      /// Minimum axis limit.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum axis limit.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Deprecated: Use min.
  @Deprecated('minimum has been deprecated')
  @JsonKey(
    
    name: r'minimum',
    required: false,
    includeIfNull: false,
  )


  final double? minimum;



      /// Deprecated: Use max.
  @Deprecated('maximum has been deprecated')
  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final double? maximum;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SeatAxis &&
      other.min == min &&
      other.max == max &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory SeatAxis.fromJson(Map<String, dynamic> json) => _$SeatAxisFromJson(json);

  Map<String, dynamic> toJson() => _$SeatAxisToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

