//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/faction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_faction200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetFaction200Response {
  /// Returns a new [GetFaction200Response] instance.
  GetFaction200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Faction? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetFaction200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetFaction200Response.fromJson(Map<String, dynamic> json) => _$GetFaction200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFaction200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

