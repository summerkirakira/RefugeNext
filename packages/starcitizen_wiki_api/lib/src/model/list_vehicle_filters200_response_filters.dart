//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_vehicle_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListVehicleFilters200ResponseFilters {
  /// Returns a new [ListVehicleFilters200ResponseFilters] instance.
  ListVehicleFilters200ResponseFilters({

     this.manufacturer,

     this.isVehicle,

     this.isGravlev,

     this.isSpaceship,

     this.size,

     this.role,

     this.career,

     this.shieldPeriodFaceType,
  });

  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? manufacturer;



  @JsonKey(
    
    name: r'is_vehicle',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? isVehicle;



  @JsonKey(
    
    name: r'is_gravlev',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? isGravlev;



  @JsonKey(
    
    name: r'is_spaceship',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? isSpaceship;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? size;



  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? role;



  @JsonKey(
    
    name: r'career',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? career;



  @JsonKey(
    
    name: r'shield.face_type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? shieldPeriodFaceType;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListVehicleFilters200ResponseFilters &&
      other.manufacturer == manufacturer &&
      other.isVehicle == isVehicle &&
      other.isGravlev == isGravlev &&
      other.isSpaceship == isSpaceship &&
      other.size == size &&
      other.role == role &&
      other.career == career &&
      other.shieldPeriodFaceType == shieldPeriodFaceType;

    @override
    int get hashCode =>
        manufacturer.hashCode +
        isVehicle.hashCode +
        isGravlev.hashCode +
        isSpaceship.hashCode +
        size.hashCode +
        role.hashCode +
        career.hashCode +
        shieldPeriodFaceType.hashCode;

  factory ListVehicleFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListVehicleFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListVehicleFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

