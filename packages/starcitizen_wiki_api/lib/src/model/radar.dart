//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/radar_aim_assist_block.dart';
import 'package:starcitizen_wiki_api/src/model/radar_sensitivity_block.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radar.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Radar {
  /// Returns a new [Radar] instance.
  Radar({

     this.detectionLifetime,

     this.altitudeCeiling,

     this.enableCrossSectionOcclusion,

     this.cooldown,

     this.sensitivity,

     this.groundVehicleSensitivity,

     this.piercing,

     this.aimAssist,
  });

      /// Deprecated legacy field. Always null in this resource output.
  @Deprecated('detectionLifetime has been deprecated')
  @JsonKey(
    
    name: r'detection_lifetime',
    required: false,
    includeIfNull: false,
  )


  final double? detectionLifetime;



      /// Deprecated legacy field. Always null in this resource output.
  @Deprecated('altitudeCeiling has been deprecated')
  @JsonKey(
    
    name: r'altitude_ceiling',
    required: false,
    includeIfNull: false,
  )


  final double? altitudeCeiling;



      /// Deprecated legacy field. Always null in this resource output.
  @Deprecated('enableCrossSectionOcclusion has been deprecated')
  @JsonKey(
    
    name: r'enable_cross_section_occlusion',
    required: false,
    includeIfNull: false,
  )


  final bool? enableCrossSectionOcclusion;



      /// Radar ping cooldown in seconds.
  @JsonKey(
    
    name: r'cooldown',
    required: false,
    includeIfNull: false,
  )


  final double? cooldown;



      /// Detection sensitivity per signature type.
  @JsonKey(
    
    name: r'sensitivity',
    required: false,
    includeIfNull: false,
  )


  final RadarSensitivityBlock? sensitivity;



      /// Detection sensitivity for ground vehicles, derived from sensitivity modifiers.
  @JsonKey(
    
    name: r'ground_vehicle_sensitivity',
    required: false,
    includeIfNull: false,
  )


  final RadarSensitivityBlock? groundVehicleSensitivity;



      /// Signal piercing strength per signature type, controlling detection through occlusion.
  @JsonKey(
    
    name: r'piercing',
    required: false,
    includeIfNull: false,
  )


  final RadarSensitivityBlock? piercing;



      /// Aim assist range parameters.
  @JsonKey(
    
    name: r'aim_assist',
    required: false,
    includeIfNull: false,
  )


  final RadarAimAssistBlock? aimAssist;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Radar &&
      other.detectionLifetime == detectionLifetime &&
      other.altitudeCeiling == altitudeCeiling &&
      other.enableCrossSectionOcclusion == enableCrossSectionOcclusion &&
      other.cooldown == cooldown &&
      other.sensitivity == sensitivity &&
      other.groundVehicleSensitivity == groundVehicleSensitivity &&
      other.piercing == piercing &&
      other.aimAssist == aimAssist;

    @override
    int get hashCode =>
        (detectionLifetime == null ? 0 : detectionLifetime.hashCode) +
        (altitudeCeiling == null ? 0 : altitudeCeiling.hashCode) +
        (enableCrossSectionOcclusion == null ? 0 : enableCrossSectionOcclusion.hashCode) +
        (cooldown == null ? 0 : cooldown.hashCode) +
        (sensitivity == null ? 0 : sensitivity.hashCode) +
        (groundVehicleSensitivity == null ? 0 : groundVehicleSensitivity.hashCode) +
        (piercing == null ? 0 : piercing.hashCode) +
        (aimAssist == null ? 0 : aimAssist.hashCode);

  factory Radar.fromJson(Map<String, dynamic> json) => _$RadarFromJson(json);

  Map<String, dynamic> toJson() => _$RadarToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

