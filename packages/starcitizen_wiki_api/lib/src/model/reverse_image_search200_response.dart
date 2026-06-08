//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/comm_link_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reverse_image_search200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReverseImageSearch200Response {
  /// Returns a new [ReverseImageSearch200Response] instance.
  ReverseImageSearch200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImage>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReverseImageSearch200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ReverseImageSearch200Response.fromJson(Map<String, dynamic> json) => _$ReverseImageSearch200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReverseImageSearch200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

