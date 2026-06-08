//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response_data_inner.dart';
import 'package:starcitizen_wiki_api/src/model/list_location_positions200_response_connections_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_location_positions200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocationPositions200Response {
  /// Returns a new [ListLocationPositions200Response] instance.
  ListLocationPositions200Response({

     this.data,

     this.connections,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<ListLocationPositions200ResponseDataInner>? data;



  @JsonKey(
    
    name: r'connections',
    required: false,
    includeIfNull: false,
  )


  final List<ListLocationPositions200ResponseConnectionsInner>? connections;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListLocationPositions200Response &&
      other.data == data &&
      other.connections == connections;

    @override
    int get hashCode =>
        data.hashCode +
        connections.hashCode;

  factory ListLocationPositions200Response.fromJson(Map<String, dynamic> json) => _$ListLocationPositions200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocationPositions200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

