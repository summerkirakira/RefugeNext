//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_container_composition_entry.dart';
import 'package:starcitizen_wiki_api/src/model/resource_container_capacity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_container.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceContainer {
  /// Returns a new [ResourceContainer] instance.
  ResourceContainer({

     this.mass,

     this.immutable,

     this.defaultFillFraction,

     this.capacity,

     this.inclusiveResources,

     this.defaultComposition,
  });

      /// Container mass in kilograms.
  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Whether the container contents cannot be changed.
  @JsonKey(
    
    name: r'immutable',
    required: false,
    includeIfNull: false,
  )


  final bool? immutable;



      /// Initial fill fraction (0-1).
  @JsonKey(
    
    name: r'default_fill_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? defaultFillFraction;



  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final ResourceContainerCapacity? capacity;



      /// UUIDs of resources allowed in this container.
  @JsonKey(
    
    name: r'inclusive_resources',
    required: false,
    includeIfNull: false,
  )


  final List<String>? inclusiveResources;



      /// Default composition entries and weights.
  @JsonKey(
    
    name: r'default_composition',
    required: false,
    includeIfNull: false,
  )


  final List<ResourceContainerCompositionEntry>? defaultComposition;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceContainer &&
      other.mass == mass &&
      other.immutable == immutable &&
      other.defaultFillFraction == defaultFillFraction &&
      other.capacity == capacity &&
      other.inclusiveResources == inclusiveResources &&
      other.defaultComposition == defaultComposition;

    @override
    int get hashCode =>
        (mass == null ? 0 : mass.hashCode) +
        (immutable == null ? 0 : immutable.hashCode) +
        (defaultFillFraction == null ? 0 : defaultFillFraction.hashCode) +
        (capacity == null ? 0 : capacity.hashCode) +
        (inclusiveResources == null ? 0 : inclusiveResources.hashCode) +
        (defaultComposition == null ? 0 : defaultComposition.hashCode);

  factory ResourceContainer.fromJson(Map<String, dynamic> json) => _$ResourceContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceContainerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

