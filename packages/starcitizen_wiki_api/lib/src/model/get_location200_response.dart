//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_starmap_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_location200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetLocation200Response {
  /// Returns a new [GetLocation200Response] instance.
  GetLocation200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocation? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetLocation200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetLocation200Response.fromJson(Map<String, dynamic> json) => _$GetLocation200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLocation200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

