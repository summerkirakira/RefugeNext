//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_port_sizes.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePortSizes {
  /// Returns a new [GameVehiclePortSizes] instance.
  GameVehiclePortSizes({

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
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePortSizes &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory GameVehiclePortSizes.fromJson(Map<String, dynamic> json) => _$GameVehiclePortSizesFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePortSizesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

