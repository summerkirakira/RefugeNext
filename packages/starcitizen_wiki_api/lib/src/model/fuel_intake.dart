//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'fuel_intake.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FuelIntake {
  /// Returns a new [FuelIntake] instance.
  FuelIntake({

     this.fuelPushRate,

     this.minimumRate,
  });

      /// Fuel push rate into the fuel tanks. A value of 0 means no active push capability.
  @JsonKey(
    
    name: r'fuel_push_rate',
    required: false,
    includeIfNull: false,
  )


  final double? fuelPushRate;



      /// Minimum fuel collection rate.
  @JsonKey(
    
    name: r'minimum_rate',
    required: false,
    includeIfNull: false,
  )


  final double? minimumRate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FuelIntake &&
      other.fuelPushRate == fuelPushRate &&
      other.minimumRate == minimumRate;

    @override
    int get hashCode =>
        (fuelPushRate == null ? 0 : fuelPushRate.hashCode) +
        (minimumRate == null ? 0 : minimumRate.hashCode);

  factory FuelIntake.fromJson(Map<String, dynamic> json) => _$FuelIntakeFromJson(json);

  Map<String, dynamic> toJson() => _$FuelIntakeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

