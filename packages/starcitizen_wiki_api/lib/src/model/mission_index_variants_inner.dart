//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_index_variants_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndexVariantsInner {
  /// Returns a new [MissionIndexVariantsInner] instance.
  MissionIndexVariantsInner({

     this.uuid,

     this.title,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndexVariantsInner &&
      other.uuid == uuid &&
      other.title == title;

    @override
    int get hashCode =>
        uuid.hashCode +
        (title == null ? 0 : title.hashCode);

  factory MissionIndexVariantsInner.fromJson(Map<String, dynamic> json) => _$MissionIndexVariantsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexVariantsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

