//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_dismantle.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintDismantle {
  /// Returns a new [BlueprintDismantle] instance.
  BlueprintDismantle({

     this.timeSeconds,

     this.timeLabel,

     this.efficiency,
  });

      /// Dismantle duration in seconds
  @JsonKey(
    
    name: r'time_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? timeSeconds;



      /// Human-readable dismantle duration
  @JsonKey(
    
    name: r'time_label',
    required: false,
    includeIfNull: false,
  )


  final String? timeLabel;



      /// Dismantle efficiency ratio
  @JsonKey(
    
    name: r'efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? efficiency;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintDismantle &&
      other.timeSeconds == timeSeconds &&
      other.timeLabel == timeLabel &&
      other.efficiency == efficiency;

    @override
    int get hashCode =>
        (timeSeconds == null ? 0 : timeSeconds.hashCode) +
        (timeLabel == null ? 0 : timeLabel.hashCode) +
        (efficiency == null ? 0 : efficiency.hashCode);

  factory BlueprintDismantle.fromJson(Map<String, dynamic> json) => _$BlueprintDismantleFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintDismantleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

