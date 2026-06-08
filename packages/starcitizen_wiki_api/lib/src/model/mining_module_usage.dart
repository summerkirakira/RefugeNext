//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_module_usage.g.dart';


@Deprecated('MiningModuleUsage has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModuleUsage {
  /// Returns a new [MiningModuleUsage] instance.
  MiningModuleUsage({

     this.charges,

     this.lifetimeSeconds,

     this.uses,

     this.durationSeconds,
  });

      /// Total activations provided by the module.
  @Deprecated('charges has been deprecated')
  @JsonKey(
    
    name: r'charges',
    required: false,
    includeIfNull: false,
  )


  final int? charges;



      /// Lifetime in seconds a module remains effective once installed.
  @Deprecated('lifetimeSeconds has been deprecated')
  @JsonKey(
    
    name: r'lifetime_seconds',
    required: false,
    includeIfNull: false,
  )


  final double? lifetimeSeconds;



      /// Number of activations before a consumable expires. Observed range: 3-10.
  @Deprecated('uses has been deprecated')
  @JsonKey(
    
    name: r'uses',
    required: false,
    includeIfNull: false,
  )


  final int? uses;



      /// Active duration per use in seconds. Observed range: 15-60.
  @Deprecated('durationSeconds has been deprecated')
  @JsonKey(
    
    name: r'duration_seconds',
    required: false,
    includeIfNull: false,
  )


  final double? durationSeconds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModuleUsage &&
      other.charges == charges &&
      other.lifetimeSeconds == lifetimeSeconds &&
      other.uses == uses &&
      other.durationSeconds == durationSeconds;

    @override
    int get hashCode =>
        (charges == null ? 0 : charges.hashCode) +
        (lifetimeSeconds == null ? 0 : lifetimeSeconds.hashCode) +
        (uses == null ? 0 : uses.hashCode) +
        (durationSeconds == null ? 0 : durationSeconds.hashCode);

  factory MiningModuleUsage.fromJson(Map<String, dynamic> json) => _$MiningModuleUsageFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModuleUsageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

