//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_index_hauling_summary_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndexHaulingSummaryInner {
  /// Returns a new [MissionIndexHaulingSummaryInner] instance.
  MissionIndexHaulingSummaryInner({

     this.name,

     this.minAmount,

     this.maxAmount,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'min_amount',
    required: false,
    includeIfNull: false,
  )


  final int? minAmount;



  @JsonKey(
    
    name: r'max_amount',
    required: false,
    includeIfNull: false,
  )


  final int? maxAmount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndexHaulingSummaryInner &&
      other.name == name &&
      other.minAmount == minAmount &&
      other.maxAmount == maxAmount;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (minAmount == null ? 0 : minAmount.hashCode) +
        (maxAmount == null ? 0 : maxAmount.hashCode);

  factory MissionIndexHaulingSummaryInner.fromJson(Map<String, dynamic> json) => _$MissionIndexHaulingSummaryInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexHaulingSummaryInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

