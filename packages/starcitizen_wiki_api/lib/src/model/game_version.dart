//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_version.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVersion {
  /// Returns a new [GameVersion] instance.
  GameVersion({

     this.code,

     this.channel,

     this.releasedAt,

     this.isDefault,
  });

  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'channel',
    required: false,
    includeIfNull: false,
  )


  final String? channel;



  @JsonKey(
    
    name: r'released_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? releasedAt;



  @JsonKey(
    
    name: r'is_default',
    required: false,
    includeIfNull: false,
  )


  final bool? isDefault;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVersion &&
      other.code == code &&
      other.channel == channel &&
      other.releasedAt == releasedAt &&
      other.isDefault == isDefault;

    @override
    int get hashCode =>
        code.hashCode +
        channel.hashCode +
        releasedAt.hashCode +
        isDefault.hashCode;

  factory GameVersion.fromJson(Map<String, dynamic> json) => _$GameVersionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

