//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_magazine.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentMagazine {
  /// Returns a new [WeaponAttachmentMagazine] instance.
  WeaponAttachmentMagazine({

     this.initialAmmoCount,

     this.maxAmmoCount,

     this.maxRestockCount,
  });

      /// Initial ammo count.
  @JsonKey(
    
    name: r'initial_ammo_count',
    required: false,
    includeIfNull: false,
  )


  final int? initialAmmoCount;



      /// Maximum ammo count.
  @JsonKey(
    
    name: r'max_ammo_count',
    required: false,
    includeIfNull: false,
  )


  final int? maxAmmoCount;



      /// Maximum restock count.
  @JsonKey(
    
    name: r'max_restock_count',
    required: false,
    includeIfNull: false,
  )


  final int? maxRestockCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentMagazine &&
      other.initialAmmoCount == initialAmmoCount &&
      other.maxAmmoCount == maxAmmoCount &&
      other.maxRestockCount == maxRestockCount;

    @override
    int get hashCode =>
        (initialAmmoCount == null ? 0 : initialAmmoCount.hashCode) +
        (maxAmmoCount == null ? 0 : maxAmmoCount.hashCode) +
        (maxRestockCount == null ? 0 : maxRestockCount.hashCode);

  factory WeaponAttachmentMagazine.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentMagazineFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentMagazineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

