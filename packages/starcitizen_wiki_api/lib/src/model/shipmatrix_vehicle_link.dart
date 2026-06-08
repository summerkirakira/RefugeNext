//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/canonical_resource_meta.dart';
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:starcitizen_wiki_api/src/model/shipmatrix_manufacturer_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipmatrix_vehicle_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipmatrixVehicleLink {
  /// Returns a new [ShipmatrixVehicleLink] instance.
  ShipmatrixVehicleLink({

     this.updatedAt,

     this.version,

     this.deprecatedFields,

     this.resource,

     this.id,

     this.name,

     this.slug,

     this.size,

     this.type,

     this.manufacturer,

     this.productionStatus,

     this.link,
  });

  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final String? updatedAt;



      /// The Game Version this item exists in.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Deprecated fields that will be removed in future versions.
  @JsonKey(
    
    name: r'deprecated_fields',
    required: false,
    includeIfNull: false,
  )


  final String? deprecatedFields;



  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final CanonicalResourceMeta? resource;



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
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final Translation? size;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final Translation? type;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ShipmatrixManufacturerLink? manufacturer;



  @JsonKey(
    
    name: r'production_status',
    required: false,
    includeIfNull: false,
  )


  final Translation? productionStatus;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipmatrixVehicleLink &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.deprecatedFields == deprecatedFields &&
      other.resource == resource &&
      other.id == id &&
      other.name == name &&
      other.slug == slug &&
      other.size == size &&
      other.type == type &&
      other.manufacturer == manufacturer &&
      other.productionStatus == productionStatus &&
      other.link == link;

    @override
    int get hashCode =>
        updatedAt.hashCode +
        version.hashCode +
        deprecatedFields.hashCode +
        resource.hashCode +
        id.hashCode +
        name.hashCode +
        slug.hashCode +
        size.hashCode +
        type.hashCode +
        manufacturer.hashCode +
        productionStatus.hashCode +
        link.hashCode;

  factory ShipmatrixVehicleLink.fromJson(Map<String, dynamic> json) => _$ShipmatrixVehicleLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmatrixVehicleLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

