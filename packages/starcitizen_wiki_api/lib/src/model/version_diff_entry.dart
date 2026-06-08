//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'version_diff_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionDiffEntry {
  /// Returns a new [VersionDiffEntry] instance.
  VersionDiffEntry({

     this.entityType,

     this.entityId,

     this.changeType,

     this.columnChanges,

     this.dataChanges,
  });

  @JsonKey(
    
    name: r'entity_type',
    required: false,
    includeIfNull: false,
  )


  final String? entityType;



  @JsonKey(
    
    name: r'entity_id',
    required: false,
    includeIfNull: false,
  )


  final int? entityId;



  @JsonKey(
    
    name: r'change_type',
    required: false,
    includeIfNull: false,
  )


  final String? changeType;



  @JsonKey(
    
    name: r'column_changes',
    required: false,
    includeIfNull: false,
  )


  final Object? columnChanges;



  @JsonKey(
    
    name: r'data_changes',
    required: false,
    includeIfNull: false,
  )


  final Object? dataChanges;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionDiffEntry &&
      other.entityType == entityType &&
      other.entityId == entityId &&
      other.changeType == changeType &&
      other.columnChanges == columnChanges &&
      other.dataChanges == dataChanges;

    @override
    int get hashCode =>
        entityType.hashCode +
        entityId.hashCode +
        changeType.hashCode +
        columnChanges.hashCode +
        dataChanges.hashCode;

  factory VersionDiffEntry.fromJson(Map<String, dynamic> json) => _$VersionDiffEntryFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDiffEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

