//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_port_item_summary_manufacturer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_port_item_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GamePortItemSummary {
  /// Returns a new [GamePortItemSummary] instance.
  GamePortItemSummary({

     this.uuid,

     this.name,

     this.className,

     this.type,

     this.subType,

     this.size,

     this.grade,

     this.manufacturer,

     this.link,

     this.webUrl,
  });

      /// Unique identifier of the equipped item.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Item name from loadout data.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// SC class name of the item.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Item type (NOITEM_ prefix removed, before dot).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Item sub-type (after dot).
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Maximum port size as proxy for item size.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Grade from loadout data.
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final int? grade;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final GamePortItemSummaryManufacturer? manufacturer;



      /// API URL for item detail endpoint.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for item detail page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GamePortItemSummary &&
      other.uuid == uuid &&
      other.name == name &&
      other.className == className &&
      other.type == type &&
      other.subType == subType &&
      other.size == size &&
      other.grade == grade &&
      other.manufacturer == manufacturer &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (manufacturer == null ? 0 : manufacturer.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory GamePortItemSummary.fromJson(Map<String, dynamic> json) => _$GamePortItemSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$GamePortItemSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

