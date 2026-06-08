//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_aspect_input.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintAspectInput {
  /// Returns a new [BlueprintAspectInput] instance.
  BlueprintAspectInput({

     this.kind,

     this.uuid,

     this.name,

     this.quantity,

     this.quantityScu,

     this.minQuality,

     this.webUrl,
  });

      /// Input kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final String? kind;



      /// UUID of the input resource or item
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the input
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Discrete count (for items)
  @JsonKey(
    
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )


  final double? quantity;



      /// Quantity in Standard Cargo Units (for resources)
  @JsonKey(
    
    name: r'quantity_scu',
    required: false,
    includeIfNull: false,
  )


  final double? quantityScu;



      /// Minimum quality tier
  @JsonKey(
    
    name: r'min_quality',
    required: false,
    includeIfNull: false,
  )


  final int? minQuality;



      /// Web URL for the input detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintAspectInput &&
      other.kind == kind &&
      other.uuid == uuid &&
      other.name == name &&
      other.quantity == quantity &&
      other.quantityScu == quantityScu &&
      other.minQuality == minQuality &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        kind.hashCode +
        (uuid == null ? 0 : uuid.hashCode) +
        name.hashCode +
        (quantity == null ? 0 : quantity.hashCode) +
        (quantityScu == null ? 0 : quantityScu.hashCode) +
        minQuality.hashCode +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory BlueprintAspectInput.fromJson(Map<String, dynamic> json) => _$BlueprintAspectInputFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintAspectInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

