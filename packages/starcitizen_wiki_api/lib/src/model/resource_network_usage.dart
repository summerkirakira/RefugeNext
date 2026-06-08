//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_network_usage_coolant.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_usage_power.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_usage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkUsage {
  /// Returns a new [ResourceNetworkUsage] instance.
  ResourceNetworkUsage({

     this.power,

     this.coolant,
  });

  @JsonKey(
    
    name: r'power',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkUsagePower? power;



  @JsonKey(
    
    name: r'coolant',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkUsageCoolant? coolant;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkUsage &&
      other.power == power &&
      other.coolant == coolant;

    @override
    int get hashCode =>
        (power == null ? 0 : power.hashCode) +
        (coolant == null ? 0 : coolant.hashCode);

  factory ResourceNetworkUsage.fromJson(Map<String, dynamic> json) => _$ResourceNetworkUsageFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkUsageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

