//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_aim.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierAim {
  /// Returns a new [WeaponModifierAim] instance.
  WeaponModifierAim({

     this.zoomScale,

     this.secondZoomScale,

     this.zoomTimeScale,

     this.zoomTimeChange,

     this.hideWeaponInAds,

     this.fstopMultiplier,
  });

      /// Zoom magnification scale.
  @JsonKey(
    
    name: r'zoom_scale',
    required: false,
    includeIfNull: false,
  )


  final double? zoomScale;



      /// Secondary zoom magnification scale.
  @JsonKey(
    
    name: r'second_zoom_scale',
    required: false,
    includeIfNull: false,
  )


  final double? secondZoomScale;



      /// Zoom transition time scale.
  @JsonKey(
    
    name: r'zoom_time_scale',
    required: false,
    includeIfNull: false,
  )


  final double? zoomTimeScale;



      /// Zoom transition time change.
  @JsonKey(
    
    name: r'zoom_time_change',
    required: false,
    includeIfNull: false,
  )


  final double? zoomTimeChange;



      /// Whether the weapon is hidden while aiming.
  @JsonKey(
    
    name: r'hide_weapon_in_ads',
    required: false,
    includeIfNull: false,
  )


  final bool? hideWeaponInAds;



      /// Aperture stop multiplier.
  @JsonKey(
    
    name: r'fstop_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? fstopMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierAim &&
      other.zoomScale == zoomScale &&
      other.secondZoomScale == secondZoomScale &&
      other.zoomTimeScale == zoomTimeScale &&
      other.zoomTimeChange == zoomTimeChange &&
      other.hideWeaponInAds == hideWeaponInAds &&
      other.fstopMultiplier == fstopMultiplier;

    @override
    int get hashCode =>
        (zoomScale == null ? 0 : zoomScale.hashCode) +
        (secondZoomScale == null ? 0 : secondZoomScale.hashCode) +
        (zoomTimeScale == null ? 0 : zoomTimeScale.hashCode) +
        (zoomTimeChange == null ? 0 : zoomTimeChange.hashCode) +
        (hideWeaponInAds == null ? 0 : hideWeaponInAds.hashCode) +
        (fstopMultiplier == null ? 0 : fstopMultiplier.hashCode);

  factory WeaponModifierAim.fromJson(Map<String, dynamic> json) => _$WeaponModifierAimFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierAimToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

