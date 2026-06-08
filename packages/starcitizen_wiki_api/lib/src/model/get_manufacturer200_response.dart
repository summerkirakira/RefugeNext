//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/manufacturer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_manufacturer200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetManufacturer200Response {
  /// Returns a new [GetManufacturer200Response] instance.
  GetManufacturer200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Manufacturer? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetManufacturer200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetManufacturer200Response.fromJson(Map<String, dynamic> json) => _$GetManufacturer200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetManufacturer200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

