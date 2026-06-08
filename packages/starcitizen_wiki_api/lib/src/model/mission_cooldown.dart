//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_cooldown.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCooldown {
  /// Returns a new [MissionCooldown] instance.
  MissionCooldown({

     this.label,

     this.personalSeconds,

     this.abandonedSeconds,

     this.personalVariationSeconds,

     this.abandonedVariationSeconds,
  });

  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



  @JsonKey(
    
    name: r'personal_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? personalSeconds;



  @JsonKey(
    
    name: r'abandoned_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? abandonedSeconds;



  @JsonKey(
    
    name: r'personal_variation_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? personalVariationSeconds;



  @JsonKey(
    
    name: r'abandoned_variation_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? abandonedVariationSeconds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCooldown &&
      other.label == label &&
      other.personalSeconds == personalSeconds &&
      other.abandonedSeconds == abandonedSeconds &&
      other.personalVariationSeconds == personalVariationSeconds &&
      other.abandonedVariationSeconds == abandonedVariationSeconds;

    @override
    int get hashCode =>
        (label == null ? 0 : label.hashCode) +
        personalSeconds.hashCode +
        abandonedSeconds.hashCode +
        personalVariationSeconds.hashCode +
        abandonedVariationSeconds.hashCode;

  factory MissionCooldown.fromJson(Map<String, dynamic> json) => _$MissionCooldownFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCooldownToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

