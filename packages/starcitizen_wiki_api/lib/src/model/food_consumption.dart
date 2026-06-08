//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'food_consumption.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FoodConsumption {
  /// Returns a new [FoodConsumption] instance.
  FoodConsumption({

     this.volume,

     this.oneShotConsume,
  });

      /// Consumption volume in microSCU.
  @JsonKey(
    
    name: r'volume',
    required: false,
    includeIfNull: false,
  )


  final double? volume;



      /// Whether the item is consumed in one action.
  @JsonKey(
    
    name: r'one_shot_consume',
    required: false,
    includeIfNull: false,
  )


  final bool? oneShotConsume;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FoodConsumption &&
      other.volume == volume &&
      other.oneShotConsume == oneShotConsume;

    @override
    int get hashCode =>
        (volume == null ? 0 : volume.hashCode) +
        (oneShotConsume == null ? 0 : oneShotConsume.hashCode);

  factory FoodConsumption.fromJson(Map<String, dynamic> json) => _$FoodConsumptionFromJson(json);

  Map<String, dynamic> toJson() => _$FoodConsumptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

