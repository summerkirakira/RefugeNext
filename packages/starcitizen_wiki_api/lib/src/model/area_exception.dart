//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'area_exception.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AreaException {
  /// Returns a new [AreaException] instance.
  AreaException({

     this.name,

     this.modifier,
  });

      /// Name of the area where the exception applies.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Probability multiplier applied within this area (e.g. 2.0 = double chance).
  @JsonKey(
    
    name: r'modifier',
    required: false,
    includeIfNull: false,
  )


  final num? modifier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AreaException &&
      other.name == name &&
      other.modifier == modifier;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        modifier.hashCode;

  factory AreaException.fromJson(Map<String, dynamic> json) => _$AreaExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$AreaExceptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

