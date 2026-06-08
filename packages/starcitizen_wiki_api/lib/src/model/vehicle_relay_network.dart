//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_network_links_inner.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_relay_network.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRelayNetwork {
  /// Returns a new [VehicleRelayNetwork] instance.
  VehicleRelayNetwork({

     this.totalFuses,

     this.relays,

     this.links,
  });

      /// Total fuse slots across all relays.
  @JsonKey(
    
    name: r'total_fuses',
    required: false,
    includeIfNull: false,
  )


  final int? totalFuses;



      /// Relay junction entries with their connected hardpoints.
  @JsonKey(
    
    name: r'relays',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleRelayEntry>? relays;



      /// Raw relay-to-hardpoint link edges.
  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleRelayNetworkLinksInner>? links;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleRelayNetwork &&
      other.totalFuses == totalFuses &&
      other.relays == relays &&
      other.links == links;

    @override
    int get hashCode =>
        (totalFuses == null ? 0 : totalFuses.hashCode) +
        (relays == null ? 0 : relays.hashCode) +
        (links == null ? 0 : links.hashCode);

  factory VehicleRelayNetwork.fromJson(Map<String, dynamic> json) => _$VehicleRelayNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRelayNetworkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

