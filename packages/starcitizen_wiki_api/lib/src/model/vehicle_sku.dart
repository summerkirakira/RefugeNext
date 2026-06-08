//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_sku.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleSku {
  /// Returns a new [VehicleSku] instance.
  VehicleSku({

     this.title,

     this.price,

     this.available,

     this.importedAt,
  });

  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'price',
    required: false,
    includeIfNull: false,
  )


  final int? price;



  @JsonKey(
    
    name: r'available',
    required: false,
    includeIfNull: false,
  )


  final bool? available;



  @JsonKey(
    
    name: r'imported_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? importedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleSku &&
      other.title == title &&
      other.price == price &&
      other.available == available &&
      other.importedAt == importedAt;

    @override
    int get hashCode =>
        title.hashCode +
        price.hashCode +
        available.hashCode +
        importedAt.hashCode;

  factory VehicleSku.fromJson(Map<String, dynamic> json) => _$VehicleSkuFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleSkuToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

