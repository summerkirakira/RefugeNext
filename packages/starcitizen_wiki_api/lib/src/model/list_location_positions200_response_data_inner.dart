//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'list_location_positions200_response_data_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocationPositions200ResponseDataInner {
  /// Returns a new [ListLocationPositions200ResponseDataInner] instance.
  ListLocationPositions200ResponseDataInner({

     this.uuid,

     this.name,

     this.type,

     this.system,

     this.parentUuid,

     this.x,

     this.y,

     this.z,
  });

  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final String? system;



  @JsonKey(
    
    name: r'parent_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? parentUuid;



  @JsonKey(
    
    name: r'x',
    required: false,
    includeIfNull: false,
  )


  final double? x;



  @JsonKey(
    
    name: r'y',
    required: false,
    includeIfNull: false,
  )


  final double? y;



  @JsonKey(
    
    name: r'z',
    required: false,
    includeIfNull: false,
  )


  final double? z;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListLocationPositions200ResponseDataInner &&
      other.uuid == uuid &&
      other.name == name &&
      other.type == type &&
      other.system == system &&
      other.parentUuid == parentUuid &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        type.hashCode +
        system.hashCode +
        (parentUuid == null ? 0 : parentUuid.hashCode) +
        x.hashCode +
        y.hashCode +
        z.hashCode;

  factory ListLocationPositions200ResponseDataInner.fromJson(Map<String, dynamic> json) => _$ListLocationPositions200ResponseDataInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocationPositions200ResponseDataInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

