//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/resource_network_repair.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_usage.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_generation.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_network.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetwork {
  /// Returns a new [ResourceNetwork] instance.
  ResourceNetwork({

     this.isNetworked,

     this.isRelay,

     this.defaultPriority,

     this.states,

     this.repair,

     this.usage,

     this.generation,
  });

      /// Whether the item participates in the ship/station resource network.
  @JsonKey(
    
    name: r'is_networked',
    required: false,
    includeIfNull: false,
  )


  final bool? isNetworked;



      /// True when the item acts as a relay node.
  @JsonKey(
    
    name: r'is_relay',
    required: false,
    includeIfNull: false,
  )


  final bool? isRelay;



      /// Processing priority within the network (higher runs earlier). Commonly 50; fuel tanks use 100.
  @JsonKey(
    
    name: r'default_priority',
    required: false,
    includeIfNull: false,
  )


  final int? defaultPriority;



      /// List of available network states and their resource deltas.
  @JsonKey(
    
    name: r'states',
    required: false,
    includeIfNull: false,
  )


  final List<ResourceNetworkState>? states;



  @JsonKey(
    
    name: r'repair',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkRepair? repair;



  @JsonKey(
    
    name: r'usage',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkUsage? usage;



  @JsonKey(
    
    name: r'generation',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetworkGeneration? generation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetwork &&
      other.isNetworked == isNetworked &&
      other.isRelay == isRelay &&
      other.defaultPriority == defaultPriority &&
      other.states == states &&
      other.repair == repair &&
      other.usage == usage &&
      other.generation == generation;

    @override
    int get hashCode =>
        (isNetworked == null ? 0 : isNetworked.hashCode) +
        (isRelay == null ? 0 : isRelay.hashCode) +
        (defaultPriority == null ? 0 : defaultPriority.hashCode) +
        (states == null ? 0 : states.hashCode) +
        (repair == null ? 0 : repair.hashCode) +
        (usage == null ? 0 : usage.hashCode) +
        (generation == null ? 0 : generation.hashCode);

  factory ResourceNetwork.fromJson(Map<String, dynamic> json) => _$ResourceNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

