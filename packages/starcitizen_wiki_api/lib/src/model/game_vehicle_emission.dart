//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_emission.g.dart';


@Deprecated('GameVehicleEmission has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleEmission {
  /// Returns a new [GameVehicleEmission] instance.
  GameVehicleEmission({

     this.ir,

     this.emIdle,

     this.emMax,
  });

  @JsonKey(
    
    name: r'ir',
    required: false,
    includeIfNull: false,
  )


  final num? ir;



  @JsonKey(
    
    name: r'em_idle',
    required: false,
    includeIfNull: false,
  )


  final num? emIdle;



  @JsonKey(
    
    name: r'em_max',
    required: false,
    includeIfNull: false,
  )


  final num? emMax;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleEmission &&
      other.ir == ir &&
      other.emIdle == emIdle &&
      other.emMax == emMax;

    @override
    int get hashCode =>
        (ir == null ? 0 : ir.hashCode) +
        (emIdle == null ? 0 : emIdle.hashCode) +
        (emMax == null ? 0 : emMax.hashCode);

  factory GameVehicleEmission.fromJson(Map<String, dynamic> json) => _$GameVehicleEmissionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleEmissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

