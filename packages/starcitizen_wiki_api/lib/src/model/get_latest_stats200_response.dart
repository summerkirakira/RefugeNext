//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_latest_stats200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetLatestStats200Response {
  /// Returns a new [GetLatestStats200Response] instance.
  GetLatestStats200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Stat? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetLatestStats200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetLatestStats200Response.fromJson(Map<String, dynamic> json) => _$GetLatestStats200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLatestStats200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

