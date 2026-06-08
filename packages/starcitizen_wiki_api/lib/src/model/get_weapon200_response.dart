//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_weapon200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetWeapon200Response {
  /// Returns a new [GetWeapon200Response] instance.
  GetWeapon200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final GameItem? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetWeapon200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetWeapon200Response.fromJson(Map<String, dynamic> json) => _$GetWeapon200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetWeapon200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

