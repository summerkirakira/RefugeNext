//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/clustering_param.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clustering.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Clustering {
  /// Returns a new [Clustering] instance.
  Clustering({

     this.key,

     this.minSize,

     this.maxSize,

     this.minProximity,

     this.maxProximity,

     this.probability,

     this.probabilityPercent,

     this.params,
  });

      /// Internal clustering configuration key.
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Minimum number of deposits in a cluster.
  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final num? minSize;



      /// Maximum number of deposits in a cluster.
  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final num? maxSize;



      /// Minimum distance between clustered deposits.
  @JsonKey(
    
    name: r'min_proximity',
    required: false,
    includeIfNull: false,
  )


  final num? minProximity;



      /// Maximum distance between clustered deposits.
  @JsonKey(
    
    name: r'max_proximity',
    required: false,
    includeIfNull: false,
  )


  final num? maxProximity;



      /// Raw probability of clustering occurring (0-1).
  @JsonKey(
    
    name: r'probability',
    required: false,
    includeIfNull: false,
  )


  final num? probability;



      /// Clustering probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? probabilityPercent;



      /// List of clustering variations with individual probability weights.
  @JsonKey(
    
    name: r'params',
    required: false,
    includeIfNull: false,
  )


  final List<ClusteringParam>? params;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Clustering &&
      other.key == key &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.minProximity == minProximity &&
      other.maxProximity == maxProximity &&
      other.probability == probability &&
      other.probabilityPercent == probabilityPercent &&
      other.params == params;

    @override
    int get hashCode =>
        (key == null ? 0 : key.hashCode) +
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        (minProximity == null ? 0 : minProximity.hashCode) +
        (maxProximity == null ? 0 : maxProximity.hashCode) +
        (probability == null ? 0 : probability.hashCode) +
        (probabilityPercent == null ? 0 : probabilityPercent.hashCode) +
        params.hashCode;

  factory Clustering.fromJson(Map<String, dynamic> json) => _$ClusteringFromJson(json);

  Map<String, dynamic> toJson() => _$ClusteringToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

