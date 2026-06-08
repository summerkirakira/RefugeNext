//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_asteroid_ring.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationAsteroidRing {
  /// Returns a new [GameStarmapLocationAsteroidRing] instance.
  GameStarmapLocationAsteroidRing({

     this.densityScale,

     this.sizeScale,

     this.innerRadius,

     this.outerRadius,

     this.depth,
  });

      /// Scale factor controlling asteroid density within the ring.
  @JsonKey(
    
    name: r'density_scale',
    required: false,
    includeIfNull: false,
  )


  final num? densityScale;



      /// Scale factor controlling individual asteroid size.
  @JsonKey(
    
    name: r'size_scale',
    required: false,
    includeIfNull: false,
  )


  final num? sizeScale;



      /// Inner boundary radius of the asteroid ring.
  @JsonKey(
    
    name: r'inner_radius',
    required: false,
    includeIfNull: false,
  )


  final num? innerRadius;



      /// Outer boundary radius of the asteroid ring.
  @JsonKey(
    
    name: r'outer_radius',
    required: false,
    includeIfNull: false,
  )


  final num? outerRadius;



      /// Vertical depth or thickness of the asteroid ring.
  @JsonKey(
    
    name: r'depth',
    required: false,
    includeIfNull: false,
  )


  final num? depth;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationAsteroidRing &&
      other.densityScale == densityScale &&
      other.sizeScale == sizeScale &&
      other.innerRadius == innerRadius &&
      other.outerRadius == outerRadius &&
      other.depth == depth;

    @override
    int get hashCode =>
        densityScale.hashCode +
        sizeScale.hashCode +
        innerRadius.hashCode +
        outerRadius.hashCode +
        depth.hashCode;

  factory GameStarmapLocationAsteroidRing.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationAsteroidRingFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationAsteroidRingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

