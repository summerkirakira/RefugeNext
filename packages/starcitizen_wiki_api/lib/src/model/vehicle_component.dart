//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_component.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleComponent {
  /// Returns a new [VehicleComponent] instance.
  VehicleComponent({

     this.type,

     this.name,

     this.mounts,

     this.componentSize,

     this.category,

     this.size,

     this.details,

     this.quantity,

     this.manufacturer,

     this.componentClass,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'mounts',
    required: false,
    includeIfNull: false,
  )


  final int? mounts;



  @JsonKey(
    
    name: r'component_size',
    required: false,
    includeIfNull: false,
  )


  final String? componentSize;



  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final String? size;



  @JsonKey(
    
    name: r'details',
    required: false,
    includeIfNull: false,
  )


  final String? details;



  @JsonKey(
    
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )


  final int? quantity;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final String? manufacturer;



  @JsonKey(
    
    name: r'component_class',
    required: false,
    includeIfNull: false,
  )


  final String? componentClass;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleComponent &&
      other.type == type &&
      other.name == name &&
      other.mounts == mounts &&
      other.componentSize == componentSize &&
      other.category == category &&
      other.size == size &&
      other.details == details &&
      other.quantity == quantity &&
      other.manufacturer == manufacturer &&
      other.componentClass == componentClass;

    @override
    int get hashCode =>
        type.hashCode +
        name.hashCode +
        mounts.hashCode +
        componentSize.hashCode +
        category.hashCode +
        size.hashCode +
        details.hashCode +
        quantity.hashCode +
        manufacturer.hashCode +
        componentClass.hashCode;

  factory VehicleComponent.fromJson(Map<String, dynamic> json) => _$VehicleComponentFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleComponentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

