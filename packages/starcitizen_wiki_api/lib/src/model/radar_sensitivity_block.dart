//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'radar_sensitivity_block.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RadarSensitivityBlock {
  /// Returns a new [RadarSensitivityBlock] instance.
  RadarSensitivityBlock({

     this.infrared,

     this.crossSection,

     this.electromagnetic,

     this.resource,

     this.db,
  });

      /// Infrared signature detection sensitivity.
  @JsonKey(
    
    name: r'infrared',
    required: false,
    includeIfNull: false,
  )


  final double? infrared;



      /// Cross-section signature detection sensitivity.
  @JsonKey(
    
    name: r'cross_section',
    required: false,
    includeIfNull: false,
  )


  final double? crossSection;



      /// Electromagnetic signature detection sensitivity.
  @JsonKey(
    
    name: r'electromagnetic',
    required: false,
    includeIfNull: false,
  )


  final double? electromagnetic;



      /// Resource signature detection sensitivity.
  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final double? resource;



      /// Decibel signature detection sensitivity.
  @JsonKey(
    
    name: r'db',
    required: false,
    includeIfNull: false,
  )


  final double? db;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RadarSensitivityBlock &&
      other.infrared == infrared &&
      other.crossSection == crossSection &&
      other.electromagnetic == electromagnetic &&
      other.resource == resource &&
      other.db == db;

    @override
    int get hashCode =>
        (infrared == null ? 0 : infrared.hashCode) +
        (crossSection == null ? 0 : crossSection.hashCode) +
        (electromagnetic == null ? 0 : electromagnetic.hashCode) +
        (resource == null ? 0 : resource.hashCode) +
        (db == null ? 0 : db.hashCode);

  factory RadarSensitivityBlock.fromJson(Map<String, dynamic> json) => _$RadarSensitivityBlockFromJson(json);

  Map<String, dynamic> toJson() => _$RadarSensitivityBlockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

