//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_rgb_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_flashlight_profile.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentFlashlightProfile {
  /// Returns a new [WeaponAttachmentFlashlightProfile] instance.
  WeaponAttachmentFlashlightProfile({

     this.portName,

     this.name,

     this.lightType,

     this.lightRadius,

     this.intensity,

     this.color,

     this.colorCss,
  });

      /// Light port name.
  @JsonKey(
    
    name: r'port_name',
    required: false,
    includeIfNull: false,
  )


  final String? portName;



      /// Profile name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Light type.
  @JsonKey(
    
    name: r'light_type',
    required: false,
    includeIfNull: false,
  )


  final String? lightType;



      /// Light radius in meters.
  @JsonKey(
    
    name: r'light_radius',
    required: false,
    includeIfNull: false,
  )


  final double? lightRadius;



      /// Light intensity.
  @JsonKey(
    
    name: r'intensity',
    required: false,
    includeIfNull: false,
  )


  final double? intensity;



  @JsonKey(
    
    name: r'color',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentRgbColor? color;



  @JsonKey(
    
    name: r'color_css',
    required: false,
    includeIfNull: false,
  )


  final String? colorCss;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentFlashlightProfile &&
      other.portName == portName &&
      other.name == name &&
      other.lightType == lightType &&
      other.lightRadius == lightRadius &&
      other.intensity == intensity &&
      other.color == color &&
      other.colorCss == colorCss;

    @override
    int get hashCode =>
        (portName == null ? 0 : portName.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (lightType == null ? 0 : lightType.hashCode) +
        (lightRadius == null ? 0 : lightRadius.hashCode) +
        (intensity == null ? 0 : intensity.hashCode) +
        (color == null ? 0 : color.hashCode) +
        (colorCss == null ? 0 : colorCss.hashCode);

  factory WeaponAttachmentFlashlightProfile.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentFlashlightProfileFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentFlashlightProfileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

