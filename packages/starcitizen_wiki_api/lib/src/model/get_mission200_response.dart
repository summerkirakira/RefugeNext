//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_mission200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMission200Response {
  /// Returns a new [GetMission200Response] instance.
  GetMission200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Mission? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMission200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetMission200Response.fromJson(Map<String, dynamic> json) => _$GetMission200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMission200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

