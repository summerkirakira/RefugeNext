//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_aggregated.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemAggregated {
  /// Returns a new [StarsystemAggregated] instance.
  StarsystemAggregated({

     this.size,

     this.population,

     this.economy,

     this.danger,

     this.stars,

     this.planets,

     this.moons,

     this.stations,
  });

  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final double? size;



  @JsonKey(
    
    name: r'population',
    required: false,
    includeIfNull: false,
  )


  final double? population;



  @JsonKey(
    
    name: r'economy',
    required: false,
    includeIfNull: false,
  )


  final double? economy;



  @JsonKey(
    
    name: r'danger',
    required: false,
    includeIfNull: false,
  )


  final double? danger;



  @JsonKey(
    
    name: r'stars',
    required: false,
    includeIfNull: false,
  )


  final int? stars;



  @JsonKey(
    
    name: r'planets',
    required: false,
    includeIfNull: false,
  )


  final int? planets;



  @JsonKey(
    
    name: r'moons',
    required: false,
    includeIfNull: false,
  )


  final int? moons;



  @JsonKey(
    
    name: r'stations',
    required: false,
    includeIfNull: false,
  )


  final int? stations;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemAggregated &&
      other.size == size &&
      other.population == population &&
      other.economy == economy &&
      other.danger == danger &&
      other.stars == stars &&
      other.planets == planets &&
      other.moons == moons &&
      other.stations == stations;

    @override
    int get hashCode =>
        size.hashCode +
        population.hashCode +
        economy.hashCode +
        danger.hashCode +
        stars.hashCode +
        planets.hashCode +
        moons.hashCode +
        stations.hashCode;

  factory StarsystemAggregated.fromJson(Map<String, dynamic> json) => _$StarsystemAggregatedFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemAggregatedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

