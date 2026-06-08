//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/counter_measure_signature.dart';
import 'package:json_annotation/json_annotation.dart';

part 'counter_measure.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CounterMeasure {
  /// Returns a new [CounterMeasure] instance.
  CounterMeasure({

     this.type,

     this.signature,
  });

      /// Counter measure type from WeaponDefensive.Type (e.g., Flare, Chaff, Noise).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final CounterMeasureSignature? signature;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CounterMeasure &&
      other.type == type &&
      other.signature == signature;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (signature == null ? 0 : signature.hashCode);

  factory CounterMeasure.fromJson(Map<String, dynamic> json) => _$CounterMeasureFromJson(json);

  Map<String, dynamic> toJson() => _$CounterMeasureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

