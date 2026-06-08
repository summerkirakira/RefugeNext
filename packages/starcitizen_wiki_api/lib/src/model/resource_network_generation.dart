//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_generation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkGeneration {
  /// Returns a new [ResourceNetworkGeneration] instance.
  ResourceNetworkGeneration({

     this.coolant,

     this.power,
  });

      /// Coolant generation rate.
  @JsonKey(
    
    name: r'coolant',
    required: false,
    includeIfNull: false,
  )


  final double? coolant;



      /// Power generation rate.
  @JsonKey(
    
    name: r'power',
    required: false,
    includeIfNull: false,
  )


  final double? power;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkGeneration &&
      other.coolant == coolant &&
      other.power == power;

    @override
    int get hashCode =>
        (coolant == null ? 0 : coolant.hashCode) +
        (power == null ? 0 : power.hashCode);

  factory ResourceNetworkGeneration.fromJson(Map<String, dynamic> json) => _$ResourceNetworkGenerationFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkGenerationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

