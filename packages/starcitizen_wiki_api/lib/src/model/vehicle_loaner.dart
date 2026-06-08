//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_loaner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleLoaner {
  /// Returns a new [VehicleLoaner] instance.
  VehicleLoaner({

     this.uuid,

     this.name,

     this.slug,

     this.link,

     this.version,
  });

      /// Unique vehicle identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// URL-friendly vehicle identifier.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleLoaner &&
      other.uuid == uuid &&
      other.name == name &&
      other.slug == slug &&
      other.link == link &&
      other.version == version;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        name.hashCode +
        (slug == null ? 0 : slug.hashCode) +
        link.hashCode +
        version.hashCode;

  factory VehicleLoaner.fromJson(Map<String, dynamic> json) => _$VehicleLoanerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleLoanerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

