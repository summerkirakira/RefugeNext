//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_index_faction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionSummary {
  /// Returns a new [MissionSummary] instance.
  MissionSummary({

     this.uuid,

     this.title,

     this.missionType,

     this.illegal,

     this.hasCombat,

     this.faction,

     this.link,

     this.webUrl,
  });

  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'mission_type',
    required: false,
    includeIfNull: false,
  )


  final String? missionType;



  @JsonKey(
    
    name: r'illegal',
    required: false,
    includeIfNull: false,
  )


  final bool? illegal;



  @JsonKey(
    
    name: r'has_combat',
    required: false,
    includeIfNull: false,
  )


  final bool? hasCombat;



  @JsonKey(
    
    name: r'faction',
    required: false,
    includeIfNull: false,
  )


  final MissionIndexFaction? faction;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionSummary &&
      other.uuid == uuid &&
      other.title == title &&
      other.missionType == missionType &&
      other.illegal == illegal &&
      other.hasCombat == hasCombat &&
      other.faction == faction &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        uuid.hashCode +
        (title == null ? 0 : title.hashCode) +
        (missionType == null ? 0 : missionType.hashCode) +
        illegal.hashCode +
        (hasCombat == null ? 0 : hasCombat.hashCode) +
        (faction == null ? 0 : faction.hashCode) +
        link.hashCode +
        webUrl.hashCode;

  factory MissionSummary.fromJson(Map<String, dynamic> json) => _$MissionSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$MissionSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

