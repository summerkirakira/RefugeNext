//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_laser_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningLaserModifier {
  /// Returns a new [MiningLaserModifier] instance.
  MiningLaserModifier({

     this.name,

     this.displayName,

     this.value,
  });

      /// Internal modifier key.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Human-readable name derived from the key.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Numeric modifier value (percentage points where applicable).
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final double? value;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningLaserModifier &&
      other.name == name &&
      other.displayName == displayName &&
      other.value == value;

    @override
    int get hashCode =>
        name.hashCode +
        displayName.hashCode +
        value.hashCode;

  factory MiningLaserModifier.fromJson(Map<String, dynamic> json) => _$MiningLaserModifierFromJson(json);

  Map<String, dynamic> toJson() => _$MiningLaserModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

