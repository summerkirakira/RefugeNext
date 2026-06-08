//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_drive_travel_time10gm.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumDriveTravelTime10gm {
  /// Returns a new [QuantumDriveTravelTime10gm] instance.
  QuantumDriveTravelTime10gm({

     this.seconds,

     this.formatted,
  });

      /// Travel time in seconds.
  @JsonKey(
    
    name: r'seconds',
    required: false,
    includeIfNull: false,
  )


  final double? seconds;



      /// Formatted travel time string.
  @JsonKey(
    
    name: r'formatted',
    required: false,
    includeIfNull: false,
  )


  final String? formatted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumDriveTravelTime10gm &&
      other.seconds == seconds &&
      other.formatted == formatted;

    @override
    int get hashCode =>
        (seconds == null ? 0 : seconds.hashCode) +
        (formatted == null ? 0 : formatted.hashCode);

  factory QuantumDriveTravelTime10gm.fromJson(Map<String, dynamic> json) => _$QuantumDriveTravelTime10gmFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumDriveTravelTime10gmToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

