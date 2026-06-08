//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_emission.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemEmission {
  /// Returns a new [ItemEmission] instance.
  ItemEmission({

     this.ir,

     this.emMin,

     this.emMax,

     this.emDecay,

     this.emPerSegment,
  });

      /// Infrared (thermal) emission signature. Higher values make the item easier to detect.
  @JsonKey(
    
    name: r'ir',
    required: false,
    includeIfNull: false,
  )


  final double? ir;



      /// Electromagnetic emission at idle/low power (Maximum * minConsumptionFraction * lowPowerRangeModifier).
  @JsonKey(
    
    name: r'em_min',
    required: false,
    includeIfNull: false,
  )


  final double? emMin;



      /// Electromagnetic emission at full power from EMSignature.nominalSignature.
  @JsonKey(
    
    name: r'em_max',
    required: false,
    includeIfNull: false,
  )


  final double? emMax;



      /// Rate at which EM drops when the item powers down (typically 0.15).
  @JsonKey(
    
    name: r'em_decay',
    required: false,
    includeIfNull: false,
  )


  final double? emDecay;



      /// EM per power segment unit (PowerPlant only: Maximum / Generation.Power).
  @JsonKey(
    
    name: r'em_per_segment',
    required: false,
    includeIfNull: false,
  )


  final double? emPerSegment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemEmission &&
      other.ir == ir &&
      other.emMin == emMin &&
      other.emMax == emMax &&
      other.emDecay == emDecay &&
      other.emPerSegment == emPerSegment;

    @override
    int get hashCode =>
        (ir == null ? 0 : ir.hashCode) +
        (emMin == null ? 0 : emMin.hashCode) +
        (emMax == null ? 0 : emMax.hashCode) +
        (emDecay == null ? 0 : emDecay.hashCode) +
        (emPerSegment == null ? 0 : emPerSegment.hashCode);

  factory ItemEmission.fromJson(Map<String, dynamic> json) => _$ItemEmissionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemEmissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

