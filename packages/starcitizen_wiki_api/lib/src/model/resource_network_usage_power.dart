//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_usage_power.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkUsagePower {
  /// Returns a new [ResourceNetworkUsagePower] instance.
  ResourceNetworkUsagePower({

     this.min,

     this.max,

     this.minimum,

     this.maximum,
  });

      /// Minimum power usage.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum power usage.
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
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkUsagePower &&
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

  factory ResourceNetworkUsagePower.fromJson(Map<String, dynamic> json) => _$ResourceNetworkUsagePowerFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkUsagePowerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

