//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'radiation_resistance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RadiationResistance {
  /// Returns a new [RadiationResistance] instance.
  RadiationResistance({

     this.maximumRadiationCapacity,

     this.radiationDissipationRate,
  });

      /// Maximum radiation capacity.
  @JsonKey(
    
    name: r'maximum_radiation_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? maximumRadiationCapacity;



      /// Radiation dissipation rate.
  @JsonKey(
    
    name: r'radiation_dissipation_rate',
    required: false,
    includeIfNull: false,
  )


  final double? radiationDissipationRate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RadiationResistance &&
      other.maximumRadiationCapacity == maximumRadiationCapacity &&
      other.radiationDissipationRate == radiationDissipationRate;

    @override
    int get hashCode =>
        (maximumRadiationCapacity == null ? 0 : maximumRadiationCapacity.hashCode) +
        (radiationDissipationRate == null ? 0 : radiationDissipationRate.hashCode);

  factory RadiationResistance.fromJson(Map<String, dynamic> json) => _$RadiationResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$RadiationResistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

