//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_dismantle_return_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintDismantleReturnSummary {
  /// Returns a new [BlueprintDismantleReturnSummary] instance.
  BlueprintDismantleReturnSummary({

     this.name,

     this.resourceTypeUuid,

     this.quantityScu,

     this.link,

     this.webUrl,
  });

      /// Display name of the returned resource
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the returned resource type (see GET /api/commodities)
  @JsonKey(
    
    name: r'resource_type_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? resourceTypeUuid;



      /// Quantity returned in Standard Cargo Units
  @JsonKey(
    
    name: r'quantity_scu',
    required: false,
    includeIfNull: false,
  )


  final double? quantityScu;



      /// API URL for the returned resource
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the returned resource detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintDismantleReturnSummary &&
      other.name == name &&
      other.resourceTypeUuid == resourceTypeUuid &&
      other.quantityScu == quantityScu &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (resourceTypeUuid == null ? 0 : resourceTypeUuid.hashCode) +
        (quantityScu == null ? 0 : quantityScu.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory BlueprintDismantleReturnSummary.fromJson(Map<String, dynamic> json) => _$BlueprintDismantleReturnSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintDismantleReturnSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

