//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_repair.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkRepair {
  /// Returns a new [ResourceNetworkRepair] instance.
  ResourceNetworkRepair({

     this.maxRepairCount,

     this.timeToRepair,

     this.healthRatio,
  });

      /// Maximum number of repairs allowed.
  @JsonKey(
    
    name: r'max_repair_count',
    required: false,
    includeIfNull: false,
  )


  final int? maxRepairCount;



      /// Time required to perform a repair (seconds).
  @JsonKey(
    
    name: r'time_to_repair',
    required: false,
    includeIfNull: false,
  )


  final double? timeToRepair;



      /// Health ratio threshold for repair eligibility.
  @JsonKey(
    
    name: r'health_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? healthRatio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkRepair &&
      other.maxRepairCount == maxRepairCount &&
      other.timeToRepair == timeToRepair &&
      other.healthRatio == healthRatio;

    @override
    int get hashCode =>
        (maxRepairCount == null ? 0 : maxRepairCount.hashCode) +
        (timeToRepair == null ? 0 : timeToRepair.hashCode) +
        (healthRatio == null ? 0 : healthRatio.hashCode);

  factory ResourceNetworkRepair.fromJson(Map<String, dynamic> json) => _$ResourceNetworkRepairFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkRepairToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

