//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_rgb_color.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentRgbColor {
  /// Returns a new [WeaponAttachmentRgbColor] instance.
  WeaponAttachmentRgbColor({

     this.r,

     this.g,

     this.b,
  });

      /// Red component.
  @JsonKey(
    
    name: r'r',
    required: false,
    includeIfNull: false,
  )


  final double? r;



      /// Green component.
  @JsonKey(
    
    name: r'g',
    required: false,
    includeIfNull: false,
  )


  final double? g;



      /// Blue component.
  @JsonKey(
    
    name: r'b',
    required: false,
    includeIfNull: false,
  )


  final double? b;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentRgbColor &&
      other.r == r &&
      other.g == g &&
      other.b == b;

    @override
    int get hashCode =>
        (r == null ? 0 : r.hashCode) +
        (g == null ? 0 : g.hashCode) +
        (b == null ? 0 : b.hashCode);

  factory WeaponAttachmentRgbColor.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentRgbColorFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentRgbColorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

