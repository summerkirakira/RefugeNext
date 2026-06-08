//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'missile_rack.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissileRack {
  /// Returns a new [MissileRack] instance.
  MissileRack({

     this.missileCount,

     this.missileSize,
  });

      /// Number of missile slots on the rack, derived from port configuration.
  @JsonKey(
    
    name: r'missile_count',
    required: false,
    includeIfNull: false,
  )


  final int? missileCount;



      /// Maximum missile size supported (from the first port MaxSize).
  @JsonKey(
    
    name: r'missile_size',
    required: false,
    includeIfNull: false,
  )


  final int? missileSize;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissileRack &&
      other.missileCount == missileCount &&
      other.missileSize == missileSize;

    @override
    int get hashCode =>
        (missileCount == null ? 0 : missileCount.hashCode) +
        (missileSize == null ? 0 : missileSize.hashCode);

  factory MissileRack.fromJson(Map<String, dynamic> json) => _$MissileRackFromJson(json);

  Map<String, dynamic> toJson() => _$MissileRackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

