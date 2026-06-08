//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'clustering_param.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClusteringParam {
  /// Returns a new [ClusteringParam] instance.
  ClusteringParam({

     this.minSize,

     this.maxSize,

     this.minProximity,

     this.maxProximity,

     this.relativeProbability,
  });

      /// Minimum cluster size.
  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final num? minSize;



      /// Maximum cluster size.
  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final num? maxSize;



      /// Minimum distance between deposit instances in the cluster.
  @JsonKey(
    
    name: r'min_proximity',
    required: false,
    includeIfNull: false,
  )


  final num? minProximity;



      /// Maximum distance between deposit instances in the cluster.
  @JsonKey(
    
    name: r'max_proximity',
    required: false,
    includeIfNull: false,
  )


  final num? maxProximity;



      /// Relative probability weight for this clustering variation.
  @JsonKey(
    
    name: r'relative_probability',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbability;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClusteringParam &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.minProximity == minProximity &&
      other.maxProximity == maxProximity &&
      other.relativeProbability == relativeProbability;

    @override
    int get hashCode =>
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        (minProximity == null ? 0 : minProximity.hashCode) +
        (maxProximity == null ? 0 : maxProximity.hashCode) +
        (relativeProbability == null ? 0 : relativeProbability.hashCode);

  factory ClusteringParam.fromJson(Map<String, dynamic> json) => _$ClusteringParamFromJson(json);

  Map<String, dynamic> toJson() => _$ClusteringParamToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

