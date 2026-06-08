//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_port_compatible_types_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePortCompatibleTypesInner {
  /// Returns a new [GameVehiclePortCompatibleTypesInner] instance.
  GameVehiclePortCompatibleTypesInner({

     this.type,

     this.subTypes,
  });

      /// Compatible item type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// List of compatible sub-types for this port type.
  @JsonKey(
    
    name: r'sub_types',
    required: false,
    includeIfNull: false,
  )


  final List<String>? subTypes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePortCompatibleTypesInner &&
      other.type == type &&
      other.subTypes == subTypes;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (subTypes == null ? 0 : subTypes.hashCode);

  factory GameVehiclePortCompatibleTypesInner.fromJson(Map<String, dynamic> json) => _$GameVehiclePortCompatibleTypesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePortCompatibleTypesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

