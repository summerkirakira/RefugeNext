//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'counter_measure_signature.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CounterMeasureSignature {
  /// Returns a new [CounterMeasureSignature] instance.
  CounterMeasureSignature({

     this.infrared,

     this.crossSection,

     this.electromagnetic,

     this.decibel,
  });

      /// Infrared signature end value emitted by the counter measure.
  @JsonKey(
    
    name: r'infrared',
    required: false,
    includeIfNull: false,
  )


  final double? infrared;



      /// Radar cross-section signature end value emitted by the counter measure.
  @JsonKey(
    
    name: r'cross_section',
    required: false,
    includeIfNull: false,
  )


  final double? crossSection;



      /// Electromagnetic signature end value emitted by the counter measure.
  @JsonKey(
    
    name: r'electromagnetic',
    required: false,
    includeIfNull: false,
  )


  final double? electromagnetic;



      /// Audio signature (decibel) end value emitted by the counter measure.
  @JsonKey(
    
    name: r'decibel',
    required: false,
    includeIfNull: false,
  )


  final double? decibel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CounterMeasureSignature &&
      other.infrared == infrared &&
      other.crossSection == crossSection &&
      other.electromagnetic == electromagnetic &&
      other.decibel == decibel;

    @override
    int get hashCode =>
        (infrared == null ? 0 : infrared.hashCode) +
        (crossSection == null ? 0 : crossSection.hashCode) +
        (electromagnetic == null ? 0 : electromagnetic.hashCode) +
        (decibel == null ? 0 : decibel.hashCode);

  factory CounterMeasureSignature.fromJson(Map<String, dynamic> json) => _$CounterMeasureSignatureFromJson(json);

  Map<String, dynamic> toJson() => _$CounterMeasureSignatureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

