//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits_min.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_cargo_limits_max.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_cargo_limits.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCargoLimits {
  /// Returns a new [GameVehicleCargoLimits] instance.
  GameVehicleCargoLimits({

     this.min,

     this.minScuBox,

     this.max,

     this.maxScuBox,
  });

  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleCargoLimitsMin? min;



      /// Smallest standard SCU box satisfying the min item size.
  @JsonKey(
    
    name: r'min_scu_box',
    required: false,
    includeIfNull: false,
  )


  final num? minScuBox;



  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleCargoLimitsMax? max;



      /// Largest standard SCU box that fits within the max item size.
  @JsonKey(
    
    name: r'max_scu_box',
    required: false,
    includeIfNull: false,
  )


  final num? maxScuBox;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCargoLimits &&
      other.min == min &&
      other.minScuBox == minScuBox &&
      other.max == max &&
      other.maxScuBox == maxScuBox;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (minScuBox == null ? 0 : minScuBox.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (maxScuBox == null ? 0 : maxScuBox.hashCode);

  factory GameVehicleCargoLimits.fromJson(Map<String, dynamic> json) => _$GameVehicleCargoLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCargoLimitsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

