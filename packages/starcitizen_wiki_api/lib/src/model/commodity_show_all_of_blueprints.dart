//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'commodity_show_all_of_blueprints.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityShowAllOfBlueprints {
  /// Returns a new [CommodityShowAllOfBlueprints] instance.
  CommodityShowAllOfBlueprints({

     this.key,

     this.outputName,

     this.outputItemUuid,

     this.craftTimeLabel,

     this.webUrl,

     this.link,
  });

      /// Unique blueprint key identifier.
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Name of the item produced by this blueprint.
  @JsonKey(
    
    name: r'output_name',
    required: false,
    includeIfNull: false,
  )


  final String? outputName;



      /// UUID of the output item entity.
  @JsonKey(
    
    name: r'output_item_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? outputItemUuid;



      /// Human-readable crafting duration (e.g. \"5m 30s\").
  @JsonKey(
    
    name: r'craft_time_label',
    required: false,
    includeIfNull: false,
  )


  final String? craftTimeLabel;



      /// Frontend URL for the blueprint page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// API link to the blueprint details.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityShowAllOfBlueprints &&
      other.key == key &&
      other.outputName == outputName &&
      other.outputItemUuid == outputItemUuid &&
      other.craftTimeLabel == craftTimeLabel &&
      other.webUrl == webUrl &&
      other.link == link;

    @override
    int get hashCode =>
        key.hashCode +
        outputName.hashCode +
        (outputItemUuid == null ? 0 : outputItemUuid.hashCode) +
        craftTimeLabel.hashCode +
        webUrl.hashCode +
        link.hashCode;

  factory CommodityShowAllOfBlueprints.fromJson(Map<String, dynamic> json) => _$CommodityShowAllOfBlueprintsFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityShowAllOfBlueprintsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

