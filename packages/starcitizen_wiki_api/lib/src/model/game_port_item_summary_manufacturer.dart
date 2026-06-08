//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_port_item_summary_manufacturer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GamePortItemSummaryManufacturer {
  /// Returns a new [GamePortItemSummaryManufacturer] instance.
  GamePortItemSummaryManufacturer({

     this.name,
  });

      /// Manufacturer display name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GamePortItemSummaryManufacturer &&
      other.name == name;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode);

  factory GamePortItemSummaryManufacturer.fromJson(Map<String, dynamic> json) => _$GamePortItemSummaryManufacturerFromJson(json);

  Map<String, dynamic> toJson() => _$GamePortItemSummaryManufacturerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

