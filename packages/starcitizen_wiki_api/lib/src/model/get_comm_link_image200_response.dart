//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/comm_link_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_comm_link_image200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetCommLinkImage200Response {
  /// Returns a new [GetCommLinkImage200Response] instance.
  GetCommLinkImage200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final CommLinkImage? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetCommLinkImage200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetCommLinkImage200Response.fromJson(Map<String, dynamic> json) => _$GetCommLinkImage200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommLinkImage200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

