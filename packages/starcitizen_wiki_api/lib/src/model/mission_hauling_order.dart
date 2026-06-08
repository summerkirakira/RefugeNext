//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_hauling_order.dart';
import 'package:starcitizen_wiki_api/src/model/mission_hauling_order_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_hauling_order.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionHaulingOrder {
  /// Returns a new [MissionHaulingOrder] instance.
  MissionHaulingOrder({

     this.kind,

     this.name,

     this.uuid,

     this.items,

     this.maxScu,

     this.minScu,

     this.maxAmount,

     this.minAmount,

     this.maxContainerSize,

     this.link,

     this.webUrl,

     this.orOptions,
  });

  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final String? kind;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'items',
    required: false,
    includeIfNull: false,
  )


  final List<MissionHaulingOrderItem>? items;



  @JsonKey(
    
    name: r'max_scu',
    required: false,
    includeIfNull: false,
  )


  final int? maxScu;



  @JsonKey(
    
    name: r'min_scu',
    required: false,
    includeIfNull: false,
  )


  final int? minScu;



  @JsonKey(
    
    name: r'max_amount',
    required: false,
    includeIfNull: false,
  )


  final int? maxAmount;



  @JsonKey(
    
    name: r'min_amount',
    required: false,
    includeIfNull: false,
  )


  final int? minAmount;



  @JsonKey(
    
    name: r'max_container_size',
    required: false,
    includeIfNull: false,
  )


  final int? maxContainerSize;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



  @JsonKey(
    
    name: r'or_options',
    required: false,
    includeIfNull: false,
  )


  final List<List<MissionHaulingOrder>>? orOptions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionHaulingOrder &&
      other.kind == kind &&
      other.name == name &&
      other.uuid == uuid &&
      other.items == items &&
      other.maxScu == maxScu &&
      other.minScu == minScu &&
      other.maxAmount == maxAmount &&
      other.minAmount == minAmount &&
      other.maxContainerSize == maxContainerSize &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.orOptions == orOptions;

    @override
    int get hashCode =>
        (kind == null ? 0 : kind.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        items.hashCode +
        (maxScu == null ? 0 : maxScu.hashCode) +
        (minScu == null ? 0 : minScu.hashCode) +
        (maxAmount == null ? 0 : maxAmount.hashCode) +
        (minAmount == null ? 0 : minAmount.hashCode) +
        (maxContainerSize == null ? 0 : maxContainerSize.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode) +
        (orOptions == null ? 0 : orOptions.hashCode);

  factory MissionHaulingOrder.fromJson(Map<String, dynamic> json) => _$MissionHaulingOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MissionHaulingOrderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

