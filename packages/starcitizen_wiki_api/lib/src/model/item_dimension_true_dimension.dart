//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_dimension_true_dimension.g.dart';


@Deprecated('ItemDimensionTrueDimension has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDimensionTrueDimension {
  /// Returns a new [ItemDimensionTrueDimension] instance.
  ItemDimensionTrueDimension({

     this.width,

     this.height,

     this.length,
  });

  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final double? width;



  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;



  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDimensionTrueDimension &&
      other.width == width &&
      other.height == height &&
      other.length == length;

    @override
    int get hashCode =>
        (width == null ? 0 : width.hashCode) +
        (height == null ? 0 : height.hashCode) +
        (length == null ? 0 : length.hashCode);

  factory ItemDimensionTrueDimension.fromJson(Map<String, dynamic> json) => _$ItemDimensionTrueDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDimensionTrueDimensionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

