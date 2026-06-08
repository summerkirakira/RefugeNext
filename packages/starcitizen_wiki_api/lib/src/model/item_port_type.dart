//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_port_type.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemPortType {
  /// Returns a new [ItemPortType] instance.
  ItemPortType({

     this.type,

     this.subTypes,
  });

      /// Major item type this port accepts (e.g. WeaponGun, Paints, Seat).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Sub-types within the major type that this port accepts (e.g. Small, Medium).
  @JsonKey(
    
    name: r'sub_types',
    required: false,
    includeIfNull: false,
  )


  final List<String>? subTypes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemPortType &&
      other.type == type &&
      other.subTypes == subTypes;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (subTypes == null ? 0 : subTypes.hashCode);

  factory ItemPortType.fromJson(Map<String, dynamic> json) => _$ItemPortTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPortTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

