//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_durability_resistance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_durability.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDurability {
  /// Returns a new [ItemDurability] instance.
  ItemDurability({

     this.health,

     this.lifetime,

     this.maxLifetime,

     this.repairable,

     this.salvageable,

     this.resistance,
  });

      /// Hit points of the item from SHealthComponentParams.
  @JsonKey(
    
    name: r'health',
    required: false,
    includeIfNull: false,
  )


  final double? health;



      /// Wear lifetime in hours from SDegradationParams.MaxLifetimeHours.
  @JsonKey(
    
    name: r'lifetime',
    required: false,
    includeIfNull: false,
  )


  final double? lifetime;



      /// Deprecated: Use lifetime.
  @Deprecated('maxLifetime has been deprecated')
  @JsonKey(
    
    name: r'max_lifetime',
    required: false,
    includeIfNull: false,
  )


  final double? maxLifetime;



      /// Whether the item can be repaired.
  @JsonKey(
    
    name: r'repairable',
    required: false,
    includeIfNull: false,
  )


  final bool? repairable;



      /// Whether the item can be salvaged.
  @JsonKey(
    
    name: r'salvageable',
    required: false,
    includeIfNull: false,
  )


  final bool? salvageable;



  @JsonKey(
    
    name: r'resistance',
    required: false,
    includeIfNull: false,
  )


  final ItemDurabilityResistance? resistance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDurability &&
      other.health == health &&
      other.lifetime == lifetime &&
      other.maxLifetime == maxLifetime &&
      other.repairable == repairable &&
      other.salvageable == salvageable &&
      other.resistance == resistance;

    @override
    int get hashCode =>
        (health == null ? 0 : health.hashCode) +
        (lifetime == null ? 0 : lifetime.hashCode) +
        (maxLifetime == null ? 0 : maxLifetime.hashCode) +
        repairable.hashCode +
        salvageable.hashCode +
        (resistance == null ? 0 : resistance.hashCode);

  factory ItemDurability.fromJson(Map<String, dynamic> json) => _$ItemDurabilityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDurabilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

