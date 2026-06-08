//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_inventory_max_size.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemInventoryMaxSize {
  /// Returns a new [ItemInventoryMaxSize] instance.
  ItemInventoryMaxSize({

     this.x,

     this.y,

     this.z,
  });

      /// Width in meters.
  @JsonKey(
    
    name: r'x',
    required: false,
    includeIfNull: false,
  )


  final num? x;



      /// Depth in meters.
  @JsonKey(
    
    name: r'y',
    required: false,
    includeIfNull: false,
  )


  final num? y;



      /// Height in meters.
  @JsonKey(
    
    name: r'z',
    required: false,
    includeIfNull: false,
  )


  final num? z;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemInventoryMaxSize &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        (x == null ? 0 : x.hashCode) +
        (y == null ? 0 : y.hashCode) +
        (z == null ? 0 : z.hashCode);

  factory ItemInventoryMaxSize.fromJson(Map<String, dynamic> json) => _$ItemInventoryMaxSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInventoryMaxSizeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

