//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'jumppoint_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JumppointEntry {
  /// Returns a new [JumppointEntry] instance.
  JumppointEntry({

     this.id,

     this.systemId,

     this.systemApiUrl,

     this.celestialObjectApiUrl,

     this.status,

     this.code,

     this.designation,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'system_id',
    required: false,
    includeIfNull: false,
  )


  final String? systemId;



  @JsonKey(
    
    name: r'system_api_url',
    required: false,
    includeIfNull: false,
  )


  final String? systemApiUrl;



  @JsonKey(
    
    name: r'celestial_object_api_url',
    required: false,
    includeIfNull: false,
  )


  final String? celestialObjectApiUrl;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final String? status;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'designation',
    required: false,
    includeIfNull: false,
  )


  final String? designation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JumppointEntry &&
      other.id == id &&
      other.systemId == systemId &&
      other.systemApiUrl == systemApiUrl &&
      other.celestialObjectApiUrl == celestialObjectApiUrl &&
      other.status == status &&
      other.code == code &&
      other.designation == designation;

    @override
    int get hashCode =>
        id.hashCode +
        systemId.hashCode +
        systemApiUrl.hashCode +
        celestialObjectApiUrl.hashCode +
        status.hashCode +
        code.hashCode +
        designation.hashCode;

  factory JumppointEntry.fromJson(Map<String, dynamic> json) => _$JumppointEntryFromJson(json);

  Map<String, dynamic> toJson() => _$JumppointEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

