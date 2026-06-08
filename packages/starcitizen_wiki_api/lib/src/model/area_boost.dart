//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'area_boost.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AreaBoost {
  /// Returns a new [AreaBoost] instance.
  AreaBoost({

     this.name,

     this.globalModifier,
  });

      /// Name of the boosted area.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Global probability multiplier for this area (values above 1 indicate a boost).
  @JsonKey(
    
    name: r'global_modifier',
    required: false,
    includeIfNull: false,
  )


  final num? globalModifier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AreaBoost &&
      other.name == name &&
      other.globalModifier == globalModifier;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (globalModifier == null ? 0 : globalModifier.hashCode);

  factory AreaBoost.fromJson(Map<String, dynamic> json) => _$AreaBoostFromJson(json);

  Map<String, dynamic> toJson() => _$AreaBoostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

