//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_dimension_block.dart';
import 'package:starcitizen_wiki_api/src/model/item_dimension_true_dimension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_dimension.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDimension {
  /// Returns a new [ItemDimension] instance.
  ItemDimension({

     this.width,

     this.height,

     this.length,

     this.volume,

     this.volumeConverted,

     this.volumeConvertedUnit,

     this.trueDimension,

     this.dimensions,

     this.cargoDimension,

     this.uiDimension,
  });

      /// Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Width in meters, either from UIDimensions or Dimensions.
  @Deprecated('width has been deprecated')
  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final double? width;



      /// Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Height in meters, either from UIDimensions or Dimensions.
  @Deprecated('height has been deprecated')
  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;



      /// Deprecated: Use dimensions, cargo_dimension, or ui_dimension instead. Length in meters, either from UIDimensions or Dimensions.
  @Deprecated('length has been deprecated')
  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;



      /// Cubic volume derived from the dimensions (SCU).
  @JsonKey(
    
    name: r'volume',
    required: false,
    includeIfNull: false,
  )


  final double? volume;



      /// Converted volume value from game data (e.g. in µSCU).
  @JsonKey(
    
    name: r'volume_converted',
    required: false,
    includeIfNull: false,
  )


  final num? volumeConverted;



      /// Unit of the converted volume (e.g. \"µSCU\", \"SCU\").
  @JsonKey(
    
    name: r'volume_converted_unit',
    required: false,
    includeIfNull: false,
  )


  final String? volumeConvertedUnit;



  @Deprecated('trueDimension has been deprecated')
  @JsonKey(
    
    name: r'true_dimension',
    required: false,
    includeIfNull: false,
  )


  final ItemDimensionTrueDimension? trueDimension;



      /// True 3D model bounding box dimensions in meters (from InventoryOccupancy.Dimensions).
  @JsonKey(
    
    name: r'dimensions',
    required: false,
    includeIfNull: false,
  )


  final ItemDimensionBlock? dimensions;



      /// Cargo grid occupancy dimensions in meters (from InventoryOccupancy.CargoGrid).
  @JsonKey(
    
    name: r'cargo_dimension',
    required: false,
    includeIfNull: false,
  )


  final ItemDimensionBlock? cargoDimension;



      /// UI display dimensions shown in the in-game inventory in meters (from InventoryOccupancy.UIDimensions).
  @JsonKey(
    
    name: r'ui_dimension',
    required: false,
    includeIfNull: false,
  )


  final ItemDimensionBlock? uiDimension;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDimension &&
      other.width == width &&
      other.height == height &&
      other.length == length &&
      other.volume == volume &&
      other.volumeConverted == volumeConverted &&
      other.volumeConvertedUnit == volumeConvertedUnit &&
      other.trueDimension == trueDimension &&
      other.dimensions == dimensions &&
      other.cargoDimension == cargoDimension &&
      other.uiDimension == uiDimension;

    @override
    int get hashCode =>
        (width == null ? 0 : width.hashCode) +
        (height == null ? 0 : height.hashCode) +
        (length == null ? 0 : length.hashCode) +
        (volume == null ? 0 : volume.hashCode) +
        (volumeConverted == null ? 0 : volumeConverted.hashCode) +
        (volumeConvertedUnit == null ? 0 : volumeConvertedUnit.hashCode) +
        (trueDimension == null ? 0 : trueDimension.hashCode) +
        (dimensions == null ? 0 : dimensions.hashCode) +
        (cargoDimension == null ? 0 : cargoDimension.hashCode) +
        (uiDimension == null ? 0 : uiDimension.hashCode);

  factory ItemDimension.fromJson(Map<String, dynamic> json) => _$ItemDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDimensionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

