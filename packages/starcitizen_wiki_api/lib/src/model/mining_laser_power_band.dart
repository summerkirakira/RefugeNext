//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_laser_power_band.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningLaserPowerBand {
  /// Returns a new [MiningLaserPowerBand] instance.
  MiningLaserPowerBand({

     this.min,

     this.max,

     this.minimum,

     this.maximum,
  });

      /// Minimum power transfer (MinPowerTransfer).
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum power transfer (PowerTransfer).
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Deprecated: Use min.
  @Deprecated('minimum has been deprecated')
  @JsonKey(
    
    name: r'minimum',
    required: false,
    includeIfNull: false,
  )


  final double? minimum;



      /// Deprecated: Use max.
  @Deprecated('maximum has been deprecated')
  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final double? maximum;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningLaserPowerBand &&
      other.min == min &&
      other.max == max &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory MiningLaserPowerBand.fromJson(Map<String, dynamic> json) => _$MiningLaserPowerBandFromJson(json);

  Map<String, dynamic> toJson() => _$MiningLaserPowerBandToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

