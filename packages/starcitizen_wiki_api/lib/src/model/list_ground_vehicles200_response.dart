//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_ground_vehicles200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListGroundVehicles200Response {
  /// Returns a new [ListGroundVehicles200Response] instance.
  ListGroundVehicles200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicle>? data;



  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final PaginationLinks? links;



  @JsonKey(
    
    name: r'meta',
    required: false,
    includeIfNull: false,
  )


  final PaginationMeta? meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListGroundVehicles200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListGroundVehicles200Response.fromJson(Map<String, dynamic> json) => _$ListGroundVehicles200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListGroundVehicles200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

