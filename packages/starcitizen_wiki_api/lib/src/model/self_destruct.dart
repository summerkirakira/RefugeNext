//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'self_destruct.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SelfDestruct {
  /// Returns a new [SelfDestruct] instance.
  SelfDestruct({

     this.damage,

     this.radius,

     this.minRadius,

     this.physRadius,

     this.minPhysRadius,

     this.time,

     this.countdown,
  });

      /// Peak blast damage at the center of the explosion.
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;



      /// Maximum damage radius in meters.
  @JsonKey(
    
    name: r'radius',
    required: false,
    includeIfNull: false,
  )


  final double? radius;



      /// Inner radius in meters that always receives full damage before falloff begins.
  @JsonKey(
    
    name: r'min_radius',
    required: false,
    includeIfNull: false,
  )


  final double? minRadius;



      /// Physical impact radius in meters.
  @JsonKey(
    
    name: r'phys_radius',
    required: false,
    includeIfNull: false,
  )


  final double? physRadius;



      /// Inner physical impact radius in meters.
  @JsonKey(
    
    name: r'min_phys_radius',
    required: false,
    includeIfNull: false,
  )


  final double? minPhysRadius;



      /// Countdown duration in seconds before detonation once armed.
  @Deprecated('time has been deprecated')
  @JsonKey(
    
    name: r'time',
    required: false,
    includeIfNull: false,
  )


  final double? time;



      /// Countdown duration in seconds before detonation.
  @JsonKey(
    
    name: r'countdown',
    required: false,
    includeIfNull: false,
  )


  final double? countdown;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SelfDestruct &&
      other.damage == damage &&
      other.radius == radius &&
      other.minRadius == minRadius &&
      other.physRadius == physRadius &&
      other.minPhysRadius == minPhysRadius &&
      other.time == time &&
      other.countdown == countdown;

    @override
    int get hashCode =>
        (damage == null ? 0 : damage.hashCode) +
        (radius == null ? 0 : radius.hashCode) +
        (minRadius == null ? 0 : minRadius.hashCode) +
        (physRadius == null ? 0 : physRadius.hashCode) +
        (minPhysRadius == null ? 0 : minPhysRadius.hashCode) +
        (time == null ? 0 : time.hashCode) +
        (countdown == null ? 0 : countdown.hashCode);

  factory SelfDestruct.fromJson(Map<String, dynamic> json) => _$SelfDestructFromJson(json);

  Map<String, dynamic> toJson() => _$SelfDestructToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

