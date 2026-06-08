//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_power_pools_value.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePowerPoolsValue {
  /// Returns a new [GameVehiclePowerPoolsValue] instance.
  GameVehiclePowerPoolsValue({

     this.type,

     this.itemType,

     this.size,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'item_type',
    required: false,
    includeIfNull: false,
  )


  final String? itemType;



      /// Power pool size. -1 indicates unlimited.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePowerPoolsValue &&
      other.type == type &&
      other.itemType == itemType &&
      other.size == size;

    @override
    int get hashCode =>
        type.hashCode +
        itemType.hashCode +
        size.hashCode;

  factory GameVehiclePowerPoolsValue.fromJson(Map<String, dynamic> json) => _$GameVehiclePowerPoolsValueFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePowerPoolsValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

