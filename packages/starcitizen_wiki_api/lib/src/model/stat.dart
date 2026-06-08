//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Stat {
  /// Returns a new [Stat] instance.
  Stat({

     this.funds,

     this.fans,

     this.fleet,

     this.timestamp,
  });

      /// Crowdfunding funds raised in USD
  @JsonKey(
    
    name: r'funds',
    required: false,
    includeIfNull: false,
  )


  final double? funds;



      /// Number of registered fans
  @JsonKey(
    
    name: r'fans',
    required: false,
    includeIfNull: false,
  )


  final int? fans;



      /// Total Star Citizen fleet size
  @JsonKey(
    
    name: r'fleet',
    required: false,
    includeIfNull: false,
  )


  final int? fleet;



      /// When the snapshot was taken
  @JsonKey(
    
    name: r'timestamp',
    required: false,
    includeIfNull: false,
  )


  final DateTime? timestamp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Stat &&
      other.funds == funds &&
      other.fans == fans &&
      other.fleet == fleet &&
      other.timestamp == timestamp;

    @override
    int get hashCode =>
        funds.hashCode +
        fans.hashCode +
        fleet.hashCode +
        (timestamp == null ? 0 : timestamp.hashCode);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

