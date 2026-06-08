//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam_tether.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeamTether {
  /// Returns a new [TractorBeamTether] instance.
  TractorBeamTether({

     this.tetherBreakTime,

     this.safeRangeValueFactor,

     this.allowScrollingIntoBreakingRange,
  });

      /// Seconds before the tether breaks under excessive strain.
  @JsonKey(
    
    name: r'tether_break_time',
    required: false,
    includeIfNull: false,
  )


  final double? tetherBreakTime;



      /// Safety factor used to determine stable range.
  @JsonKey(
    
    name: r'safe_range_value_factor',
    required: false,
    includeIfNull: false,
  )


  final double? safeRangeValueFactor;



      /// Whether players can scroll past the safe range into breaking range.
  @JsonKey(
    
    name: r'allow_scrolling_into_breaking_range',
    required: false,
    includeIfNull: false,
  )


  final bool? allowScrollingIntoBreakingRange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeamTether &&
      other.tetherBreakTime == tetherBreakTime &&
      other.safeRangeValueFactor == safeRangeValueFactor &&
      other.allowScrollingIntoBreakingRange == allowScrollingIntoBreakingRange;

    @override
    int get hashCode =>
        (tetherBreakTime == null ? 0 : tetherBreakTime.hashCode) +
        (safeRangeValueFactor == null ? 0 : safeRangeValueFactor.hashCode) +
        (allowScrollingIntoBreakingRange == null ? 0 : allowScrollingIntoBreakingRange.hashCode);

  factory TractorBeamTether.fromJson(Map<String, dynamic> json) => _$TractorBeamTetherFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamTetherToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

