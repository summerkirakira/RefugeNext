//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/version_changelog_summary_value.dart';
import 'package:starcitizen_wiki_api/src/model/game_version.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_changelog.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionChangelog {
  /// Returns a new [VersionChangelog] instance.
  VersionChangelog({

     this.fromVersion,

     this.toVersion,

     this.summary,
  });

  @JsonKey(
    
    name: r'from_version',
    required: false,
    includeIfNull: false,
  )


  final GameVersion? fromVersion;



  @JsonKey(
    
    name: r'to_version',
    required: false,
    includeIfNull: false,
  )


  final GameVersion? toVersion;



      /// Change counts keyed by entity type (item, vehicle, blueprint, mission, starmap_location)
  @JsonKey(
    
    name: r'summary',
    required: false,
    includeIfNull: false,
  )


  final Map<String, VersionChangelogSummaryValue>? summary;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionChangelog &&
      other.fromVersion == fromVersion &&
      other.toVersion == toVersion &&
      other.summary == summary;

    @override
    int get hashCode =>
        fromVersion.hashCode +
        toVersion.hashCode +
        summary.hashCode;

  factory VersionChangelog.fromJson(Map<String, dynamic> json) => _$VersionChangelogFromJson(json);

  Map<String, dynamic> toJson() => _$VersionChangelogToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

