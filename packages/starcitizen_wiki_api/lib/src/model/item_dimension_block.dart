//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_dimension_block.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDimensionBlock {
  /// Returns a new [ItemDimensionBlock] instance.
  ItemDimensionBlock({

     this.width,

     this.height,

     this.length,
  });

      /// Width in meters.
  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final double? width;



      /// Height in meters.
  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;



      /// Length in meters.
  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDimensionBlock &&
      other.width == width &&
      other.height == height &&
      other.length == length;

    @override
    int get hashCode =>
        width.hashCode +
        height.hashCode +
        length.hashCode;

  factory ItemDimensionBlock.fromJson(Map<String, dynamic> json) => _$ItemDimensionBlockFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDimensionBlockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

