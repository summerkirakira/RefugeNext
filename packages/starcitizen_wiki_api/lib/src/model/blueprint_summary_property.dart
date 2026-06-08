//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_summary_property.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintSummaryProperty {
  /// Returns a new [BlueprintSummaryProperty] instance.
  BlueprintSummaryProperty({

     this.propertyKey,

     this.propertyUuid,

     this.label,

     this.betterWhen,
  });

      /// Internal key identifying the property
  @JsonKey(
    
    name: r'property_key',
    required: false,
    includeIfNull: false,
  )


  final String? propertyKey;



      /// UUID of the property definition, if available
  @JsonKey(
    
    name: r'property_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? propertyUuid;



      /// Human-readable label for the property
  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Indicates whether a higher or lower value is desirable
  @JsonKey(
    
    name: r'better_when',
    required: false,
    includeIfNull: false,
  )


  final BlueprintSummaryPropertyBetterWhenEnum? betterWhen;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintSummaryProperty &&
      other.propertyKey == propertyKey &&
      other.propertyUuid == propertyUuid &&
      other.label == label &&
      other.betterWhen == betterWhen;

    @override
    int get hashCode =>
        propertyKey.hashCode +
        (propertyUuid == null ? 0 : propertyUuid.hashCode) +
        label.hashCode +
        (betterWhen == null ? 0 : betterWhen.hashCode);

  factory BlueprintSummaryProperty.fromJson(Map<String, dynamic> json) => _$BlueprintSummaryPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintSummaryPropertyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Indicates whether a higher or lower value is desirable
enum BlueprintSummaryPropertyBetterWhenEnum {
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'higher')
higher(r'higher'),
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'lower')
lower(r'lower'),
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'neutral')
neutral(r'neutral');

const BlueprintSummaryPropertyBetterWhenEnum(this.value);

final String value;

@override
String toString() => value;
}


