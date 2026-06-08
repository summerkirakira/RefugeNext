//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_relay_network_links_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRelayNetworkLinksInner {
  /// Returns a new [VehicleRelayNetworkLinksInner] instance.
  VehicleRelayNetworkLinksInner({

     this.from,

     this.to,
  });

      /// Source hardpoint (relay).
  @JsonKey(
    
    name: r'from',
    required: false,
    includeIfNull: false,
  )


  final String? from;



      /// Target hardpoint.
  @JsonKey(
    
    name: r'to',
    required: false,
    includeIfNull: false,
  )


  final String? to;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleRelayNetworkLinksInner &&
      other.from == from &&
      other.to == to;

    @override
    int get hashCode =>
        from.hashCode +
        to.hashCode;

  factory VehicleRelayNetworkLinksInner.fromJson(Map<String, dynamic> json) => _$VehicleRelayNetworkLinksInnerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRelayNetworkLinksInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

