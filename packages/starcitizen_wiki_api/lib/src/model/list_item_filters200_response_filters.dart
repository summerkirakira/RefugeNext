//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_item_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListItemFilters200ResponseFilters {
  /// Returns a new [ListItemFilters200ResponseFilters] instance.
  ListItemFilters200ResponseFilters({

     this.type,

     this.subType,

     this.classification,

     this.size,

     this.grade,

     this.class_,

     this.manufacturer,

     this.rarity,

     this.eventSource,
  });

      /// Item types (e.g. WeaponPersonal, Cooler, Shield)
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? type;



      /// Item sub-types (e.g. Barrel, Default, Optic)
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? subType;



      /// Item classifications (e.g. FPS.Armor.Torso, Ship.Cooler)
  @JsonKey(
    
    name: r'classification',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? classification;



      /// Item sizes (0-12)
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? size;



      /// Item grades (1-7, mapped A-G)
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? grade;



      /// Item classes (Civilian, Competition, Industrial, Military, Stealth)
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? class_;



      /// Manufacturer names
  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? manufacturer;



      /// Item rarity levels (Common, Uncommon, Rare, Epic, Legendary)
  @JsonKey(
    
    name: r'rarity',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? rarity;



      /// Event or reward source labels (count-less values)
  @JsonKey(
    
    name: r'event_source',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? eventSource;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListItemFilters200ResponseFilters &&
      other.type == type &&
      other.subType == subType &&
      other.classification == classification &&
      other.size == size &&
      other.grade == grade &&
      other.class_ == class_ &&
      other.manufacturer == manufacturer &&
      other.rarity == rarity &&
      other.eventSource == eventSource;

    @override
    int get hashCode =>
        type.hashCode +
        subType.hashCode +
        classification.hashCode +
        size.hashCode +
        grade.hashCode +
        class_.hashCode +
        manufacturer.hashCode +
        rarity.hashCode +
        eventSource.hashCode;

  factory ListItemFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListItemFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

