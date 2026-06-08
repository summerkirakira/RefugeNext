//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/commodity_show.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_commodity200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetCommodity200Response {
  /// Returns a new [GetCommodity200Response] instance.
  GetCommodity200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final CommodityShow? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetCommodity200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetCommodity200Response.fromJson(Map<String, dynamic> json) => _$GetCommodity200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommodity200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

