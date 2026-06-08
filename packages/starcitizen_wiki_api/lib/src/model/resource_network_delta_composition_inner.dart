//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_delta_composition_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkDeltaCompositionInner {
  /// Returns a new [ResourceNetworkDeltaCompositionInner] instance.
  ResourceNetworkDeltaCompositionInner({

     this.containerResource,

     this.ratio,
  });

      /// UUID of the container resource.
  @JsonKey(
    
    name: r'container_resource',
    required: false,
    includeIfNull: false,
  )


  final String? containerResource;



      /// Ratio of this resource in the composition.
  @JsonKey(
    
    name: r'ratio',
    required: false,
    includeIfNull: false,
  )


  final double? ratio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkDeltaCompositionInner &&
      other.containerResource == containerResource &&
      other.ratio == ratio;

    @override
    int get hashCode =>
        (containerResource == null ? 0 : containerResource.hashCode) +
        (ratio == null ? 0 : ratio.hashCode);

  factory ResourceNetworkDeltaCompositionInner.fromJson(Map<String, dynamic> json) => _$ResourceNetworkDeltaCompositionInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkDeltaCompositionInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

