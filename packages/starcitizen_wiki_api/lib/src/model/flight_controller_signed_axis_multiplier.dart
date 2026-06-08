//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_signed_axis_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerSignedAxisMultiplier {
  /// Returns a new [FlightControllerSignedAxisMultiplier] instance.
  FlightControllerSignedAxisMultiplier({

     this.positive,

     this.negative,
  });

      /// Multiplier for positive thrust on this axis.
  @JsonKey(
    
    name: r'positive',
    required: false,
    includeIfNull: false,
  )


  final double? positive;



      /// Multiplier for negative thrust on this axis.
  @JsonKey(
    
    name: r'negative',
    required: false,
    includeIfNull: false,
  )


  final double? negative;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerSignedAxisMultiplier &&
      other.positive == positive &&
      other.negative == negative;

    @override
    int get hashCode =>
        (positive == null ? 0 : positive.hashCode) +
        (negative == null ? 0 : negative.hashCode);

  factory FlightControllerSignedAxisMultiplier.fromJson(Map<String, dynamic> json) => _$FlightControllerSignedAxisMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerSignedAxisMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

