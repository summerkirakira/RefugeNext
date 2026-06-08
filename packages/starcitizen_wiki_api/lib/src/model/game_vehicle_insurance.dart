//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_insurance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleInsurance {
  /// Returns a new [GameVehicleInsurance] instance.
  GameVehicleInsurance({

     this.claimTime,

     this.expediteTime,

     this.expediteCost,
  });

      /// Standard claim time in minutes.
  @JsonKey(
    
    name: r'claim_time',
    required: false,
    includeIfNull: false,
  )


  final num? claimTime;



      /// Expedited claim time in minutes.
  @JsonKey(
    
    name: r'expedite_time',
    required: false,
    includeIfNull: false,
  )


  final num? expediteTime;



      /// Cost to expedite the claim in aUEC.
  @JsonKey(
    
    name: r'expedite_cost',
    required: false,
    includeIfNull: false,
  )


  final num? expediteCost;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleInsurance &&
      other.claimTime == claimTime &&
      other.expediteTime == expediteTime &&
      other.expediteCost == expediteCost;

    @override
    int get hashCode =>
        (claimTime == null ? 0 : claimTime.hashCode) +
        (expediteTime == null ? 0 : expediteTime.hashCode) +
        (expediteCost == null ? 0 : expediteCost.hashCode);

  factory GameVehicleInsurance.fromJson(Map<String, dynamic> json) => _$GameVehicleInsuranceFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleInsuranceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

