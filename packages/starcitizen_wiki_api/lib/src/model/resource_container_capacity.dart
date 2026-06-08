//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_container_capacity.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceContainerCapacity {
  /// Returns a new [ResourceContainerCapacity] instance.
  ResourceContainerCapacity({

     this.value,

     this.unit,

     this.unitName,

     this.scu,
  });

      /// Raw capacity value.
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final double? value;



      /// Unit abbreviation (e.g. \"SCU\").
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;



      /// Full unit name (e.g. \"Standard Cargo Units\").
  @JsonKey(
    
    name: r'unit_name',
    required: false,
    includeIfNull: false,
  )


  final String? unitName;



      /// Capacity converted to SCU.
  @JsonKey(
    
    name: r'scu',
    required: false,
    includeIfNull: false,
  )


  final double? scu;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceContainerCapacity &&
      other.value == value &&
      other.unit == unit &&
      other.unitName == unitName &&
      other.scu == scu;

    @override
    int get hashCode =>
        (value == null ? 0 : value.hashCode) +
        (unit == null ? 0 : unit.hashCode) +
        (unitName == null ? 0 : unitName.hashCode) +
        (scu == null ? 0 : scu.hashCode);

  factory ResourceContainerCapacity.fromJson(Map<String, dynamic> json) => _$ResourceContainerCapacityFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceContainerCapacityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

