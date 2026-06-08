//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_seating.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleSeating {
  /// Returns a new [GameVehicleSeating] instance.
  GameVehicleSeating({

     this.crewStations,

     this.ejectionSeats,

     this.escapePods,

     this.jumpSeats,

     this.beds,

     this.medicalBeds,
  });

      /// Total number of crew stations.
  @JsonKey(
    
    name: r'crew_stations',
    required: false,
    includeIfNull: false,
  )


  final int? crewStations;



      /// Number of ejection seats.
  @JsonKey(
    
    name: r'ejection_seats',
    required: false,
    includeIfNull: false,
  )


  final int? ejectionSeats;



      /// Number of escape pods. Null when absent.
  @JsonKey(
    
    name: r'escape_pods',
    required: false,
    includeIfNull: false,
  )


  final int? escapePods;



      /// Number of jump seats. Null when absent.
  @JsonKey(
    
    name: r'jump_seats',
    required: false,
    includeIfNull: false,
  )


  final int? jumpSeats;



      /// Total number of beds.
  @JsonKey(
    
    name: r'beds',
    required: false,
    includeIfNull: false,
  )


  final int? beds;



      /// Medical bed counts by tier. Null if no medical beds.
  @JsonKey(
    
    name: r'medical_beds',
    required: false,
    includeIfNull: false,
  )


  final Object? medicalBeds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleSeating &&
      other.crewStations == crewStations &&
      other.ejectionSeats == ejectionSeats &&
      other.escapePods == escapePods &&
      other.jumpSeats == jumpSeats &&
      other.beds == beds &&
      other.medicalBeds == medicalBeds;

    @override
    int get hashCode =>
        crewStations.hashCode +
        ejectionSeats.hashCode +
        (escapePods == null ? 0 : escapePods.hashCode) +
        (jumpSeats == null ? 0 : jumpSeats.hashCode) +
        beds.hashCode +
        (medicalBeds == null ? 0 : medicalBeds.hashCode);

  factory GameVehicleSeating.fromJson(Map<String, dynamic> json) => _$GameVehicleSeatingFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleSeatingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

