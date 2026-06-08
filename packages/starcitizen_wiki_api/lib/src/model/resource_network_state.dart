//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_network_state_power_ranges_inner.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_state_signature.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_delta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_state.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkState {
  /// Returns a new [ResourceNetworkState] instance.
  ResourceNetworkState({

     this.name,

     this.signature,

     this.deltas,

     this.powerRanges,
  });

      /// State name (e.g. Online). Can be empty on some items.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkStateSignature? signature;



  @JsonKey(
    
    name: r'deltas',
    required: false,
    includeIfNull: false,
  )


  final List<ResourceNetworkDelta>? deltas;



      /// Power range modifiers applied when this state is active.
  @JsonKey(
    
    name: r'power_ranges',
    required: false,
    includeIfNull: false,
  )


  final List<ResourceNetworkStatePowerRangesInner>? powerRanges;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkState &&
      other.name == name &&
      other.signature == signature &&
      other.deltas == deltas &&
      other.powerRanges == powerRanges;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (signature == null ? 0 : signature.hashCode) +
        (deltas == null ? 0 : deltas.hashCode) +
        (powerRanges == null ? 0 : powerRanges.hashCode);

  factory ResourceNetworkState.fromJson(Map<String, dynamic> json) => _$ResourceNetworkStateFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

