//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_position.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemPosition {
  /// Returns a new [StarsystemPosition] instance.
  StarsystemPosition({

     this.x,

     this.y,

     this.z,
  });

  @JsonKey(
    
    name: r'x',
    required: false,
    includeIfNull: false,
  )


  final double? x;



  @JsonKey(
    
    name: r'y',
    required: false,
    includeIfNull: false,
  )


  final double? y;



  @JsonKey(
    
    name: r'z',
    required: false,
    includeIfNull: false,
  )


  final double? z;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemPosition &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        x.hashCode +
        y.hashCode +
        z.hashCode;

  factory StarsystemPosition.fromJson(Map<String, dynamic> json) => _$StarsystemPositionFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemPositionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

