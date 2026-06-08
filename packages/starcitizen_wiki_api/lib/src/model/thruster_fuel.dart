//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'thruster_fuel.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ThrusterFuel {
  /// Returns a new [ThrusterFuel] instance.
  ThrusterFuel({

     this.burnRatePer10kNewton,
  });

      /// Fuel consumed per 10,000 newtons of thrust.
  @JsonKey(
    
    name: r'burn_rate_per_10k_newton',
    required: false,
    includeIfNull: false,
  )


  final double? burnRatePer10kNewton;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ThrusterFuel &&
      other.burnRatePer10kNewton == burnRatePer10kNewton;

    @override
    int get hashCode =>
        (burnRatePer10kNewton == null ? 0 : burnRatePer10kNewton.hashCode);

  factory ThrusterFuel.fromJson(Map<String, dynamic> json) => _$ThrusterFuelFromJson(json);

  Map<String, dynamic> toJson() => _$ThrusterFuelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

