//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_barrel_attachment.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentBarrelAttachment {
  /// Returns a new [WeaponAttachmentBarrelAttachment] instance.
  WeaponAttachmentBarrelAttachment({

     this.attachmentPoint,

     this.type,
  });

      /// Attachment point name.
  @JsonKey(
    
    name: r'attachment_point',
    required: false,
    includeIfNull: false,
  )


  final String? attachmentPoint;



      /// Barrel attachment type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentBarrelAttachment &&
      other.attachmentPoint == attachmentPoint &&
      other.type == type;

    @override
    int get hashCode =>
        (attachmentPoint == null ? 0 : attachmentPoint.hashCode) +
        (type == null ? 0 : type.hashCode);

  factory WeaponAttachmentBarrelAttachment.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentBarrelAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentBarrelAttachmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

