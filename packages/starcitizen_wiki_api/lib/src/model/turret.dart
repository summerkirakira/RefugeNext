//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/turret_axis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'turret.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Turret {
  /// Returns a new [Turret] instance.
  Turret({

     this.rotationStyle,

     this.mounts,

     this.minSize,

     this.maxSize,

     this.yawAxis,

     this.pitchAxis,
  });

      /// Turret rotation style.
  @JsonKey(
    
    name: r'rotation_style',
    required: false,
    includeIfNull: false,
  )


  final String? rotationStyle;



      /// Number of weapon mounts.
  @JsonKey(
    
    name: r'mounts',
    required: false,
    includeIfNull: false,
  )


  final int? mounts;



      /// Minimum supported weapon size.
  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final int? minSize;



      /// Maximum supported weapon size.
  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final int? maxSize;



  @JsonKey(
    
    name: r'yaw_axis',
    required: false,
    includeIfNull: false,
  )


  final TurretAxis? yawAxis;



  @JsonKey(
    
    name: r'pitch_axis',
    required: false,
    includeIfNull: false,
  )


  final TurretAxis? pitchAxis;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Turret &&
      other.rotationStyle == rotationStyle &&
      other.mounts == mounts &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.yawAxis == yawAxis &&
      other.pitchAxis == pitchAxis;

    @override
    int get hashCode =>
        (rotationStyle == null ? 0 : rotationStyle.hashCode) +
        (mounts == null ? 0 : mounts.hashCode) +
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        (yawAxis == null ? 0 : yawAxis.hashCode) +
        (pitchAxis == null ? 0 : pitchAxis.hashCode);

  factory Turret.fromJson(Map<String, dynamic> json) => _$TurretFromJson(json);

  Map<String, dynamic> toJson() => _$TurretToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

