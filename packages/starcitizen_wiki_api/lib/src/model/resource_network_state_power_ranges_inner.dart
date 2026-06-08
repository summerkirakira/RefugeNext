//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_state_power_ranges_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkStatePowerRangesInner {
  /// Returns a new [ResourceNetworkStatePowerRangesInner] instance.
  ResourceNetworkStatePowerRangesInner({

     this.start,

     this.modifier,

     this.registerRange,
  });

      /// Start value of the power range.
  @JsonKey(
    
    name: r'start',
    required: false,
    includeIfNull: false,
  )


  final double? start;



      /// Modifier applied within this power range.
  @JsonKey(
    
    name: r'modifier',
    required: false,
    includeIfNull: false,
  )


  final double? modifier;



      /// Whether this range should be registered.
  @JsonKey(
    
    name: r'register_range',
    required: false,
    includeIfNull: false,
  )


  final bool? registerRange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkStatePowerRangesInner &&
      other.start == start &&
      other.modifier == modifier &&
      other.registerRange == registerRange;

    @override
    int get hashCode =>
        (start == null ? 0 : start.hashCode) +
        (modifier == null ? 0 : modifier.hashCode) +
        (registerRange == null ? 0 : registerRange.hashCode);

  factory ResourceNetworkStatePowerRangesInner.fromJson(Map<String, dynamic> json) => _$ResourceNetworkStatePowerRangesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkStatePowerRangesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

