//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_version.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_default_game_version200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDefaultGameVersion200Response {
  /// Returns a new [GetDefaultGameVersion200Response] instance.
  GetDefaultGameVersion200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final GameVersion? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDefaultGameVersion200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetDefaultGameVersion200Response.fromJson(Map<String, dynamic> json) => _$GetDefaultGameVersion200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDefaultGameVersion200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

