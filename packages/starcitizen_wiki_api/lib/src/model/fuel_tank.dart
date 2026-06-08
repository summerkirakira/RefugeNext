//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'fuel_tank.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FuelTank {
  /// Returns a new [FuelTank] instance.
  FuelTank({

     this.fillRate,

     this.drainRate,

     this.capacity,

     this.dischargeRate,
  });

      /// Maximum generation/refill rate in standard resource units per second.
  @JsonKey(
    
    name: r'fill_rate',
    required: false,
    includeIfNull: false,
  )


  final double? fillRate;



      /// Maximum consumption/usage rate in standard resource units per second.
  @JsonKey(
    
    name: r'drain_rate',
    required: false,
    includeIfNull: false,
  )


  final double? drainRate;



      /// Maximum fuel capacity in standard resource units.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final double? capacity;



      /// Deprecated: No longer meaningful.
  @Deprecated('dischargeRate has been deprecated')
  @JsonKey(
    
    name: r'discharge_rate',
    required: false,
    includeIfNull: false,
  )


  final double? dischargeRate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FuelTank &&
      other.fillRate == fillRate &&
      other.drainRate == drainRate &&
      other.capacity == capacity &&
      other.dischargeRate == dischargeRate;

    @override
    int get hashCode =>
        (fillRate == null ? 0 : fillRate.hashCode) +
        (drainRate == null ? 0 : drainRate.hashCode) +
        (capacity == null ? 0 : capacity.hashCode) +
        (dischargeRate == null ? 0 : dischargeRate.hashCode);

  factory FuelTank.fromJson(Map<String, dynamic> json) => _$FuelTankFromJson(json);

  Map<String, dynamic> toJson() => _$FuelTankToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

