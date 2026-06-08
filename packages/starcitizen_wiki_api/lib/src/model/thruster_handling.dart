//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'thruster_handling.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ThrusterHandling {
  /// Returns a new [ThrusterHandling] instance.
  ThrusterHandling({

     this.strengthSmoothing,
  });

      /// Smoothing factor applied to thrust changes.
  @JsonKey(
    
    name: r'strength_smoothing',
    required: false,
    includeIfNull: false,
  )


  final double? strengthSmoothing;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ThrusterHandling &&
      other.strengthSmoothing == strengthSmoothing;

    @override
    int get hashCode =>
        (strengthSmoothing == null ? 0 : strengthSmoothing.hashCode);

  factory ThrusterHandling.fromJson(Map<String, dynamic> json) => _$ThrusterHandlingFromJson(json);

  Map<String, dynamic> toJson() => _$ThrusterHandlingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

