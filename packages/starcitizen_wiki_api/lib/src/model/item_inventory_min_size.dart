//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_inventory_min_size.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemInventoryMinSize {
  /// Returns a new [ItemInventoryMinSize] instance.
  ItemInventoryMinSize({

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
    bool operator ==(Object other) => identical(this, other) || other is ItemInventoryMinSize &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        (x == null ? 0 : x.hashCode) +
        (y == null ? 0 : y.hashCode) +
        (z == null ? 0 : z.hashCode);

  factory ItemInventoryMinSize.fromJson(Map<String, dynamic> json) => _$ItemInventoryMinSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInventoryMinSizeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

