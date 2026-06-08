//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_fuel_usage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_fuel.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleFuel {
  /// Returns a new [GameVehicleFuel] instance.
  GameVehicleFuel({

     this.capacity,

     this.intakeRate,

     this.usage,
  });

      /// Total hydrogen fuel capacity.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final num? capacity;



      /// Fuel intake rate from scoops.
  @JsonKey(
    
    name: r'intake_rate',
    required: false,
    includeIfNull: false,
  )


  final num? intakeRate;



  @JsonKey(
    
    name: r'usage',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleFuelUsage? usage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleFuel &&
      other.capacity == capacity &&
      other.intakeRate == intakeRate &&
      other.usage == usage;

    @override
    int get hashCode =>
        capacity.hashCode +
        (intakeRate == null ? 0 : intakeRate.hashCode) +
        (usage == null ? 0 : usage.hashCode);

  factory GameVehicleFuel.fromJson(Map<String, dynamic> json) => _$GameVehicleFuelFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleFuelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

