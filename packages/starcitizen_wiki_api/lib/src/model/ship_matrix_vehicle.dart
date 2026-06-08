//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_agility.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_speed.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_dimension.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_manufacturer.dart';
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_total.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_loaner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_sku.dart';
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_component.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicle {
  /// Returns a new [ShipMatrixVehicle] instance.
  ShipMatrixVehicle({

     this.id,

     this.chassisId,

     this.name,

     this.slug,

     this.sizes,

     this.dimension,

     this.mass,

     this.cargoCapacity,

     this.crew,

     this.speed,

     this.agility,

     this.foci,

     this.productionStatus,

     this.productionNote,

     this.type,

     this.description,

     this.size,

     this.msrp,

     this.pledgeUrl,

     this.skus,

     this.manufacturer,

     this.updatedAt,

     this.components,

     this.loaner,

     this.link,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'chassis_id',
    required: false,
    includeIfNull: false,
  )


  final int? chassisId;



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



  @Deprecated('sizes has been deprecated')
  @JsonKey(
    
    name: r'sizes',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleSizes? sizes;



  @JsonKey(
    
    name: r'dimension',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleDimension? dimension;



  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Cargo Capacity in SCU
  @JsonKey(
    
    name: r'cargo_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? cargoCapacity;



  @JsonKey(
    
    name: r'crew',
    required: false,
    includeIfNull: false,
  )


  final MissionCombatSummaryTotal? crew;



  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleSpeed? speed;



  @JsonKey(
    
    name: r'agility',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleAgility? agility;



  @JsonKey(
    
    name: r'foci',
    required: false,
    includeIfNull: false,
  )


  final List<Translation>? foci;



  @JsonKey(
    
    name: r'production_status',
    required: false,
    includeIfNull: false,
  )


  final Translation? productionStatus;



  @JsonKey(
    
    name: r'production_note',
    required: false,
    includeIfNull: false,
  )


  final Translation? productionNote;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final Translation? type;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final Translation? description;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final Translation? size;



      /// MSRP imported from the Ship Upgrade tool.
  @JsonKey(
    
    name: r'msrp',
    required: false,
    includeIfNull: false,
  )


  final double? msrp;



      /// Link to RSI Pledge Store
  @JsonKey(
    
    name: r'pledge_url',
    required: false,
    includeIfNull: false,
  )


  final String? pledgeUrl;



  @JsonKey(
    
    name: r'skus',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleSku>? skus;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleManufacturer? manufacturer;



  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final String? updatedAt;



      /// Components imported from the Ship-Matrix
  @JsonKey(
    
    name: r'components',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleComponent>? components;



  @JsonKey(
    
    name: r'loaner',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleLoaner>? loaner;



      /// Link to detail endpoint
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicle &&
      other.id == id &&
      other.chassisId == chassisId &&
      other.name == name &&
      other.slug == slug &&
      other.sizes == sizes &&
      other.dimension == dimension &&
      other.mass == mass &&
      other.cargoCapacity == cargoCapacity &&
      other.crew == crew &&
      other.speed == speed &&
      other.agility == agility &&
      other.foci == foci &&
      other.productionStatus == productionStatus &&
      other.productionNote == productionNote &&
      other.type == type &&
      other.description == description &&
      other.size == size &&
      other.msrp == msrp &&
      other.pledgeUrl == pledgeUrl &&
      other.skus == skus &&
      other.manufacturer == manufacturer &&
      other.updatedAt == updatedAt &&
      other.components == components &&
      other.loaner == loaner &&
      other.link == link;

    @override
    int get hashCode =>
        id.hashCode +
        chassisId.hashCode +
        name.hashCode +
        slug.hashCode +
        sizes.hashCode +
        dimension.hashCode +
        mass.hashCode +
        (cargoCapacity == null ? 0 : cargoCapacity.hashCode) +
        crew.hashCode +
        speed.hashCode +
        agility.hashCode +
        foci.hashCode +
        productionStatus.hashCode +
        productionNote.hashCode +
        type.hashCode +
        description.hashCode +
        size.hashCode +
        (msrp == null ? 0 : msrp.hashCode) +
        (pledgeUrl == null ? 0 : pledgeUrl.hashCode) +
        skus.hashCode +
        manufacturer.hashCode +
        updatedAt.hashCode +
        components.hashCode +
        loaner.hashCode +
        link.hashCode;

  factory ShipMatrixVehicle.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

