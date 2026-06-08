//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starsystem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_starsystem200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetStarsystem200Response {
  /// Returns a new [GetStarsystem200Response] instance.
  GetStarsystem200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Starsystem? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetStarsystem200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetStarsystem200Response.fromJson(Map<String, dynamic> json) => _$GetStarsystem200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetStarsystem200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

