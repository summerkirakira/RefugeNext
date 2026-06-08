//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_rgb_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_laser_pointer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentLaserPointer {
  /// Returns a new [WeaponAttachmentLaserPointer] instance.
  WeaponAttachmentLaserPointer({

     this.range,

     this.color,

     this.colorCss,
  });

      /// Laser range in meters.
  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final double? range;



  @JsonKey(
    
    name: r'color',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentRgbColor? color;



      /// CSS color string.
  @JsonKey(
    
    name: r'color_css',
    required: false,
    includeIfNull: false,
  )


  final String? colorCss;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentLaserPointer &&
      other.range == range &&
      other.color == color &&
      other.colorCss == colorCss;

    @override
    int get hashCode =>
        (range == null ? 0 : range.hashCode) +
        (color == null ? 0 : color.hashCode) +
        (colorCss == null ? 0 : colorCss.hashCode);

  factory WeaponAttachmentLaserPointer.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentLaserPointerFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentLaserPointerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

