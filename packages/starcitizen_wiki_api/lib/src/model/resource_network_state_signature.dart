//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'resource_network_state_signature.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResourceNetworkStateSignature {
  /// Returns a new [ResourceNetworkStateSignature] instance.
  ResourceNetworkStateSignature({

     this.em,

     this.ir,
  });

      /// Electromagnetic signature value in this state.
  @JsonKey(
    
    name: r'em',
    required: false,
    includeIfNull: false,
  )


  final double? em;



      /// Infrared signature value in this state.
  @JsonKey(
    
    name: r'ir',
    required: false,
    includeIfNull: false,
  )


  final double? ir;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResourceNetworkStateSignature &&
      other.em == em &&
      other.ir == ir;

    @override
    int get hashCode =>
        (em == null ? 0 : em.hashCode) +
        (ir == null ? 0 : ir.hashCode);

  factory ResourceNetworkStateSignature.fromJson(Map<String, dynamic> json) => _$ResourceNetworkStateSignatureFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceNetworkStateSignatureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

