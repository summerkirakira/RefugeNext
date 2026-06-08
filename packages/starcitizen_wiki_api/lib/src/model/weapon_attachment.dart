//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_magazine.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_flashlight_profile.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_barrel_attachment.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_iron_sight.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_attachment_laser_pointer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachment {
  /// Returns a new [WeaponAttachment] instance.
  WeaponAttachment({

     this.ironSight,

     this.laserPointer,

     this.flashlight,

     this.magazine,

     this.compensator,

     this.flashHider,
  });

  @JsonKey(
    
    name: r'iron_sight',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentIronSight? ironSight;



  @JsonKey(
    
    name: r'laser_pointer',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentLaserPointer? laserPointer;



      /// Flashlight profiles keyed by beam type (`narrow`, `wide`) when present.
  @JsonKey(
    
    name: r'flashlight',
    required: false,
    includeIfNull: false,
  )


  final Map<String, WeaponAttachmentFlashlightProfile>? flashlight;



  @JsonKey(
    
    name: r'magazine',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentMagazine? magazine;



  @JsonKey(
    
    name: r'compensator',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentBarrelAttachment? compensator;



  @JsonKey(
    
    name: r'flash_hider',
    required: false,
    includeIfNull: false,
  )


  final WeaponAttachmentBarrelAttachment? flashHider;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachment &&
      other.ironSight == ironSight &&
      other.laserPointer == laserPointer &&
      other.flashlight == flashlight &&
      other.magazine == magazine &&
      other.compensator == compensator &&
      other.flashHider == flashHider;

    @override
    int get hashCode =>
        (ironSight == null ? 0 : ironSight.hashCode) +
        (laserPointer == null ? 0 : laserPointer.hashCode) +
        (flashlight == null ? 0 : flashlight.hashCode) +
        (magazine == null ? 0 : magazine.hashCode) +
        (compensator == null ? 0 : compensator.hashCode) +
        (flashHider == null ? 0 : flashHider.hashCode);

  factory WeaponAttachment.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

