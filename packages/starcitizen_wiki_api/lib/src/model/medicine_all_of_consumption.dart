//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'medicine_all_of_consumption.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MedicineAllOfConsumption {
  /// Returns a new [MedicineAllOfConsumption] instance.
  MedicineAllOfConsumption({

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
    bool operator ==(Object other) => identical(this, other) || other is MedicineAllOfConsumption &&
      other.volume == volume &&
      other.oneShotConsume == oneShotConsume;

    @override
    int get hashCode =>
        (volume == null ? 0 : volume.hashCode) +
        (oneShotConsume == null ? 0 : oneShotConsume.hashCode);

  factory MedicineAllOfConsumption.fromJson(Map<String, dynamic> json) => _$MedicineAllOfConsumptionFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineAllOfConsumptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

