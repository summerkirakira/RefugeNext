//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_blueprint200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetBlueprint200Response {
  /// Returns a new [GetBlueprint200Response] instance.
  GetBlueprint200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Blueprint? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetBlueprint200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetBlueprint200Response.fromJson(Map<String, dynamic> json) => _$GetBlueprint200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBlueprint200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

