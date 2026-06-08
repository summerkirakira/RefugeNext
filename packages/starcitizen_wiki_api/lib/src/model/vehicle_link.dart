//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/canonical_resource_meta.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleLink {
  /// Returns a new [VehicleLink] instance.
  VehicleLink({

     this.updatedAt,

     this.version,

     this.deprecatedFields,

     this.resource,

     this.uuid,

     this.name,

     this.className,

     this.career,

     this.role,

     this.sizeClass,

     this.size,

     this.isVehicle,

     this.isGravlev,

     this.isSpaceship,

     this.manufacturer,

     this.link,

     this.webUrl,
  });

      /// Timestamp of the last vehicle data update.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// Game version code this vehicle belongs to.
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



      /// Unique vehicle identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Vehicle display name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// SC class name of the vehicle.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Vehicle career (e.g. Combat, Exploration, Transport).
  @JsonKey(
    
    name: r'career',
    required: false,
    includeIfNull: false,
  )


  final String? career;



      /// Vehicle role (e.g. Stealth Fighter, Heavy Freight).
  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final String? role;



      /// Vehicle size class (1-6).
  @JsonKey(
    
    name: r'size_class',
    required: false,
    includeIfNull: false,
  )


  final int? sizeClass;



      /// Deprecated: Use size_class.
  @Deprecated('size has been deprecated')
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Whether this is a ground vehicle.
  @JsonKey(
    
    name: r'is_vehicle',
    required: false,
    includeIfNull: false,
  )


  final bool? isVehicle;



      /// Whether this is a gravlev vehicle.
  @JsonKey(
    
    name: r'is_gravlev',
    required: false,
    includeIfNull: false,
  )


  final bool? isGravlev;



      /// Whether this is a spaceship.
  @JsonKey(
    
    name: r'is_spaceship',
    required: false,
    includeIfNull: false,
  )


  final bool? isSpaceship;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ManufacturerLink? manufacturer;



      /// API URL for the full vehicle detail.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the vehicle detail page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleLink &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.deprecatedFields == deprecatedFields &&
      other.resource == resource &&
      other.uuid == uuid &&
      other.name == name &&
      other.className == className &&
      other.career == career &&
      other.role == role &&
      other.sizeClass == sizeClass &&
      other.size == size &&
      other.isVehicle == isVehicle &&
      other.isGravlev == isGravlev &&
      other.isSpaceship == isSpaceship &&
      other.manufacturer == manufacturer &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        updatedAt.hashCode +
        version.hashCode +
        deprecatedFields.hashCode +
        resource.hashCode +
        uuid.hashCode +
        name.hashCode +
        className.hashCode +
        career.hashCode +
        role.hashCode +
        sizeClass.hashCode +
        size.hashCode +
        isVehicle.hashCode +
        isGravlev.hashCode +
        isSpaceship.hashCode +
        manufacturer.hashCode +
        link.hashCode +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory VehicleLink.fromJson(Map<String, dynamic> json) => _$VehicleLinkFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

