//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_container_commodity_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_container_composition_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceContainerCompositionEntry {
  /// Returns a new [ResourceContainerCompositionEntry] instance.
  ResourceContainerCompositionEntry({

     this.entry,

     this.weight,

     this.commodity,
  });

      /// UUID of the resource/commodity in this composition entry.
  @JsonKey(
    
    name: r'entry',
    required: false,
    includeIfNull: false,
  )


  final String? entry;



      /// Weight or proportion of this entry in the composition.
  @JsonKey(
    
    name: r'weight',
    required: false,
    includeIfNull: false,
  )


  final double? weight;



  @JsonKey(
    
    name: r'commodity',
    required: false,
    includeIfNull: false,
  )


  final ResourceContainerCommodityLink? commodity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceContainerCompositionEntry &&
      other.entry == entry &&
      other.weight == weight &&
      other.commodity == commodity;

    @override
    int get hashCode =>
        (entry == null ? 0 : entry.hashCode) +
        (weight == null ? 0 : weight.hashCode) +
        (commodity == null ? 0 : commodity.hashCode);

  factory ResourceContainerCompositionEntry.fromJson(Map<String, dynamic> json) => _$ResourceContainerCompositionEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceContainerCompositionEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

