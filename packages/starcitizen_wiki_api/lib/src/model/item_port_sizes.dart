//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_port_sizes.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemPortSizes {
  /// Returns a new [ItemPortSizes] instance.
  ItemPortSizes({

     this.min,

     this.max,
  });

      /// Minimum item size.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final int? min;



      /// Maximum item size.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final int? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemPortSizes &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory ItemPortSizes.fromJson(Map<String, dynamic> json) => _$ItemPortSizesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPortSizesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

