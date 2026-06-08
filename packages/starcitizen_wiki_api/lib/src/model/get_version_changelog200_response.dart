//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/version_changelog.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_version_changelog200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetVersionChangelog200Response {
  /// Returns a new [GetVersionChangelog200Response] instance.
  GetVersionChangelog200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final VersionChangelog? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetVersionChangelog200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetVersionChangelog200Response.fromJson(Map<String, dynamic> json) => _$GetVersionChangelog200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVersionChangelog200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

