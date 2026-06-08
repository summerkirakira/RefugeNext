//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_turrets.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleTurrets {
  /// Returns a new [GameVehicleTurrets] instance.
  GameVehicleTurrets({

     this.manned,

     this.remote,

     this.pdc,
  });

  @JsonKey(
    
    name: r'manned',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleTurret>? manned;



  @JsonKey(
    
    name: r'remote',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleTurret>? remote;



  @JsonKey(
    
    name: r'pdc',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleTurret>? pdc;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleTurrets &&
      other.manned == manned &&
      other.remote == remote &&
      other.pdc == pdc;

    @override
    int get hashCode =>
        (manned == null ? 0 : manned.hashCode) +
        (remote == null ? 0 : remote.hashCode) +
        (pdc == null ? 0 : pdc.hashCode);

  factory GameVehicleTurrets.fromJson(Map<String, dynamic> json) => _$GameVehicleTurretsFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleTurretsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

