//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_ingredient.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintIngredient {
  /// Returns a new [BlueprintIngredient] instance.
  BlueprintIngredient({

     this.name,

     this.kind,

     this.resourceTypeUuid,

     this.itemUuid,

     this.quantityScu,

     this.quantity,

     this.link,

     this.webUrl,
  });

      /// Display name of the ingredient
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Ingredient kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final BlueprintIngredientKindEnum? kind;



      /// UUID of the ingredient resource type (see GET /api/commodities)
  @JsonKey(
    
    name: r'resource_type_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? resourceTypeUuid;



      /// UUID of the ingredient item (see GET /api/items)
  @JsonKey(
    
    name: r'item_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? itemUuid;



      /// Quantity in Standard Cargo Units (for resources)
  @JsonKey(
    
    name: r'quantity_scu',
    required: false,
    includeIfNull: false,
  )


  final double? quantityScu;



      /// Discrete count (for items)
  @JsonKey(
    
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )


  final double? quantity;



      /// API URL for the ingredient
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the ingredient detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintIngredient &&
      other.name == name &&
      other.kind == kind &&
      other.resourceTypeUuid == resourceTypeUuid &&
      other.itemUuid == itemUuid &&
      other.quantityScu == quantityScu &&
      other.quantity == quantity &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (kind == null ? 0 : kind.hashCode) +
        (resourceTypeUuid == null ? 0 : resourceTypeUuid.hashCode) +
        (itemUuid == null ? 0 : itemUuid.hashCode) +
        (quantityScu == null ? 0 : quantityScu.hashCode) +
        (quantity == null ? 0 : quantity.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory BlueprintIngredient.fromJson(Map<String, dynamic> json) => _$BlueprintIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintIngredientToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Ingredient kind
enum BlueprintIngredientKindEnum {
    /// Ingredient kind
@JsonValue(r'resource')
resource(r'resource'),
    /// Ingredient kind
@JsonValue(r'item')
item(r'item');

const BlueprintIngredientKindEnum(this.value);

final String value;

@override
String toString() => value;
}


