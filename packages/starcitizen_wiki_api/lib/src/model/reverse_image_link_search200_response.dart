//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/comm_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reverse_image_link_search200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReverseImageLinkSearch200Response {
  /// Returns a new [ReverseImageLinkSearch200Response] instance.
  ReverseImageLinkSearch200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<CommLink>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReverseImageLinkSearch200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ReverseImageLinkSearch200Response.fromJson(Map<String, dynamic> json) => _$ReverseImageLinkSearch200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReverseImageLinkSearch200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

