//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/comm_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_comm_link200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetCommLink200Response {
  /// Returns a new [GetCommLink200Response] instance.
  GetCommLink200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final CommLink? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetCommLink200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetCommLink200Response.fromJson(Map<String, dynamic> json) => _$GetCommLink200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommLink200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

