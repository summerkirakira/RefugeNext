//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'version_changelog_summary_value.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionChangelogSummaryValue {
  /// Returns a new [VersionChangelogSummaryValue] instance.
  VersionChangelogSummaryValue({

     this.added,

     this.removed,

     this.modified,
  });

  @JsonKey(
    
    name: r'added',
    required: false,
    includeIfNull: false,
  )


  final int? added;



  @JsonKey(
    
    name: r'removed',
    required: false,
    includeIfNull: false,
  )


  final int? removed;



  @JsonKey(
    
    name: r'modified',
    required: false,
    includeIfNull: false,
  )


  final int? modified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionChangelogSummaryValue &&
      other.added == added &&
      other.removed == removed &&
      other.modified == modified;

    @override
    int get hashCode =>
        added.hashCode +
        removed.hashCode +
        modified.hashCode;

  factory VersionChangelogSummaryValue.fromJson(Map<String, dynamic> json) => _$VersionChangelogSummaryValueFromJson(json);

  Map<String, dynamic> toJson() => _$VersionChangelogSummaryValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

