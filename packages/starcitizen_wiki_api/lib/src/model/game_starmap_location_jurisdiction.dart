//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_jurisdiction.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationJurisdiction {
  /// Returns a new [GameStarmapLocationJurisdiction] instance.
  GameStarmapLocationJurisdiction({

     this.uuid,

     this.name,

     this.baseFine,

     this.maxStolenGoodsPossessionScu,

     this.isPrison,
  });

      /// UUID of the jurisdiction.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Name of the governing jurisdiction (e.g. UEE).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Base fine amount for crimes committed in this jurisdiction.
  @JsonKey(
    
    name: r'base_fine',
    required: false,
    includeIfNull: false,
  )


  final int? baseFine;



      /// Maximum stolen goods possession allowed in SCU before penalties apply.
  @JsonKey(
    
    name: r'max_stolen_goods_possession_scu',
    required: false,
    includeIfNull: false,
  )


  final int? maxStolenGoodsPossessionScu;



      /// Whether this location is a prison facility.
  @JsonKey(
    
    name: r'is_prison',
    required: false,
    includeIfNull: false,
  )


  final bool? isPrison;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationJurisdiction &&
      other.uuid == uuid &&
      other.name == name &&
      other.baseFine == baseFine &&
      other.maxStolenGoodsPossessionScu == maxStolenGoodsPossessionScu &&
      other.isPrison == isPrison;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (baseFine == null ? 0 : baseFine.hashCode) +
        (maxStolenGoodsPossessionScu == null ? 0 : maxStolenGoodsPossessionScu.hashCode) +
        (isPrison == null ? 0 : isPrison.hashCode);

  factory GameStarmapLocationJurisdiction.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationJurisdictionFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationJurisdictionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

