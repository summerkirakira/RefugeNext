//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_description_data.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDescriptionData {
  /// Returns a new [ItemDescriptionData] instance.
  ItemDescriptionData({

     this.name,

     this.value,

     this.type,
  });

      /// The label of the description entry, e.g. \"Carrying Capacity\".
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// The value of the description entry, e.g. \"2kµSCU\".
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final String? value;



      /// Deprecated: Use \"value\" key.
  @Deprecated('type has been deprecated')
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDescriptionData &&
      other.name == name &&
      other.value == value &&
      other.type == type;

    @override
    int get hashCode =>
        name.hashCode +
        value.hashCode +
        type.hashCode;

  factory ItemDescriptionData.fromJson(Map<String, dynamic> json) => _$ItemDescriptionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDescriptionDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

