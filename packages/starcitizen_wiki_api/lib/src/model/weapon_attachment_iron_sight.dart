//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_attachment_iron_sight.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponAttachmentIronSight {
  /// Returns a new [WeaponAttachmentIronSight] instance.
  WeaponAttachmentIronSight({

     this.defaultRange,

     this.maxRange,

     this.rangeIncrement,

     this.autoZeroingTime,

     this.zoomScale,

     this.zoomTimeScale,

     this.zoomTimeChange,
  });

      /// Default zeroing range in meters.
  @JsonKey(
    
    name: r'default_range',
    required: false,
    includeIfNull: false,
  )


  final double? defaultRange;



      /// Maximum zeroing range in meters.
  @JsonKey(
    
    name: r'max_range',
    required: false,
    includeIfNull: false,
  )


  final double? maxRange;



      /// Zeroing range increment in meters.
  @JsonKey(
    
    name: r'range_increment',
    required: false,
    includeIfNull: false,
  )


  final double? rangeIncrement;



      /// Auto-zeroing time in seconds.
  @JsonKey(
    
    name: r'auto_zeroing_time',
    required: false,
    includeIfNull: false,
  )


  final double? autoZeroingTime;



      /// Zoom magnification scale.
  @JsonKey(
    
    name: r'zoom_scale',
    required: false,
    includeIfNull: false,
  )


  final double? zoomScale;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponAttachmentIronSight &&
      other.defaultRange == defaultRange &&
      other.maxRange == maxRange &&
      other.rangeIncrement == rangeIncrement &&
      other.autoZeroingTime == autoZeroingTime &&
      other.zoomScale == zoomScale &&
      other.zoomTimeScale == zoomTimeScale &&
      other.zoomTimeChange == zoomTimeChange;

    @override
    int get hashCode =>
        (defaultRange == null ? 0 : defaultRange.hashCode) +
        (maxRange == null ? 0 : maxRange.hashCode) +
        (rangeIncrement == null ? 0 : rangeIncrement.hashCode) +
        (autoZeroingTime == null ? 0 : autoZeroingTime.hashCode) +
        (zoomScale == null ? 0 : zoomScale.hashCode) +
        (zoomTimeScale == null ? 0 : zoomTimeScale.hashCode) +
        (zoomTimeChange == null ? 0 : zoomTimeChange.hashCode);

  factory WeaponAttachmentIronSight.fromJson(Map<String, dynamic> json) => _$WeaponAttachmentIronSightFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponAttachmentIronSightToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

