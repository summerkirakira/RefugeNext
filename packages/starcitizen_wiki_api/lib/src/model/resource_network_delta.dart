//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_network_delta_composition_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_delta.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkDelta {
  /// Returns a new [ResourceNetworkDelta] instance.
  ResourceNetworkDelta({

     this.type,

     this.resource,

     this.rate,

     this.minimumFraction,

     this.generatedResource,

     this.generatedRate,

     this.discharge,

     this.noOverGeneration,

     this.binaryEvaluation,

     this.composition,
  });

      /// Delta type (Consumption, Generation, Conversion, Storage, NetworkReflection).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Target resource affected (Power, Fuel, Coolant, QuantumFuel, Shield, LifeSupport).
  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final String? resource;



      /// Rate applied per tick (game native units). Typical power draw ~2-5; fuel draw often 0.01.
  @JsonKey(
    
    name: r'rate',
    required: false,
    includeIfNull: false,
  )


  final double? rate;



      /// Minimum fraction of the resource that must be available before the delta applies.
  @JsonKey(
    
    name: r'minimum_fraction',
    required: false,
    includeIfNull: false,
  )


  final double? minimumFraction;



      /// Resource produced by conversion/storage deltas.
  @JsonKey(
    
    name: r'generated_resource',
    required: false,
    includeIfNull: false,
  )


  final String? generatedResource;



      /// Rate of the generated resource.
  @JsonKey(
    
    name: r'generated_rate',
    required: false,
    includeIfNull: false,
  )


  final double? generatedRate;



      /// Whether stored resource is discharged (0/1 flag).
  @JsonKey(
    
    name: r'discharge',
    required: false,
    includeIfNull: false,
  )


  final double? discharge;



      /// Prevents generating above capacity (0/1 flag).
  @JsonKey(
    
    name: r'no_over_generation',
    required: false,
    includeIfNull: false,
  )


  final double? noOverGeneration;



      /// Binary reflection value for NetworkReflection deltas.
  @JsonKey(
    
    name: r'binary_evaluation',
    required: false,
    includeIfNull: false,
  )


  final double? binaryEvaluation;



      /// Optional composition entries describing how generated resource is assembled.
  @JsonKey(
    
    name: r'composition',
    required: false,
    includeIfNull: false,
  )


  final List<ResourceNetworkDeltaCompositionInner>? composition;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkDelta &&
      other.type == type &&
      other.resource == resource &&
      other.rate == rate &&
      other.minimumFraction == minimumFraction &&
      other.generatedResource == generatedResource &&
      other.generatedRate == generatedRate &&
      other.discharge == discharge &&
      other.noOverGeneration == noOverGeneration &&
      other.binaryEvaluation == binaryEvaluation &&
      other.composition == composition;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (resource == null ? 0 : resource.hashCode) +
        (rate == null ? 0 : rate.hashCode) +
        (minimumFraction == null ? 0 : minimumFraction.hashCode) +
        (generatedResource == null ? 0 : generatedResource.hashCode) +
        (generatedRate == null ? 0 : generatedRate.hashCode) +
        (discharge == null ? 0 : discharge.hashCode) +
        (noOverGeneration == null ? 0 : noOverGeneration.hashCode) +
        (binaryEvaluation == null ? 0 : binaryEvaluation.hashCode) +
        (composition == null ? 0 : composition.hashCode);

  factory ResourceNetworkDelta.fromJson(Map<String, dynamic> json) => _$ResourceNetworkDeltaFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkDeltaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

