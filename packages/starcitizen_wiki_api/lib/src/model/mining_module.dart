//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mining_module_usage.dart';
import 'package:starcitizen_wiki_api/src/model/mining_module_modifiers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mining_module.g.dart';


@Deprecated('MiningModule has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModule {
  /// Returns a new [MiningModule] instance.
  MiningModule({

     this.type,

     this.moduleType,

     this.usage,

     this.charges,

     this.lifetimeSeconds,

     this.uses,

     this.durationSeconds,

     this.modifiers,
  });

  @Deprecated('type has been deprecated')
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @Deprecated('moduleType has been deprecated')
  @JsonKey(
    
    name: r'module_type',
    required: false,
    includeIfNull: false,
  )


  final String? moduleType;



  @Deprecated('usage has been deprecated')
  @JsonKey(
    
    name: r'usage',
    required: false,
    includeIfNull: false,
  )


  final MiningModuleUsage? usage;



      /// Deprecated: use usage.charges.
  @Deprecated('charges has been deprecated')
  @JsonKey(
    
    name: r'charges',
    required: false,
    includeIfNull: false,
  )


  final int? charges;



      /// Deprecated: use usage.lifetime_seconds.
  @Deprecated('lifetimeSeconds has been deprecated')
  @JsonKey(
    
    name: r'lifetime_seconds',
    required: false,
    includeIfNull: false,
  )


  final double? lifetimeSeconds;



      /// Deprecated: use usage.uses.
  @Deprecated('uses has been deprecated')
  @JsonKey(
    
    name: r'uses',
    required: false,
    includeIfNull: false,
  )


  final int? uses;



      /// Deprecated: use usage.duration_seconds.
  @Deprecated('durationSeconds has been deprecated')
  @JsonKey(
    
    name: r'duration_seconds',
    required: false,
    includeIfNull: false,
  )


  final double? durationSeconds;



  @Deprecated('modifiers has been deprecated')
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final MiningModuleModifiers? modifiers;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModule &&
      other.type == type &&
      other.moduleType == moduleType &&
      other.usage == usage &&
      other.charges == charges &&
      other.lifetimeSeconds == lifetimeSeconds &&
      other.uses == uses &&
      other.durationSeconds == durationSeconds &&
      other.modifiers == modifiers;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (moduleType == null ? 0 : moduleType.hashCode) +
        (usage == null ? 0 : usage.hashCode) +
        (charges == null ? 0 : charges.hashCode) +
        (lifetimeSeconds == null ? 0 : lifetimeSeconds.hashCode) +
        (uses == null ? 0 : uses.hashCode) +
        (durationSeconds == null ? 0 : durationSeconds.hashCode) +
        (modifiers == null ? 0 : modifiers.hashCode);

  factory MiningModule.fromJson(Map<String, dynamic> json) => _$MiningModuleFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModuleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

