//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'shipmatrix_manufacturer_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipmatrixManufacturerLink {
  /// Returns a new [ShipmatrixManufacturerLink] instance.
  ShipmatrixManufacturerLink({

     this.id,

     this.name,

     this.code,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipmatrixManufacturerLink &&
      other.id == id &&
      other.name == name &&
      other.code == code;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        code.hashCode;

  factory ShipmatrixManufacturerLink.fromJson(Map<String, dynamic> json) => _$ShipmatrixManufacturerLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmatrixManufacturerLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

