//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'list_location_positions200_response_connections_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocationPositions200ResponseConnectionsInner {
  /// Returns a new [ListLocationPositions200ResponseConnectionsInner] instance.
  ListLocationPositions200ResponseConnectionsInner({

     this.entryUuid,

     this.exitUuid,

     this.entrySystem,

     this.exitSystem,

     this.fuelCost,

     this.sizeClass,
  });

  @JsonKey(
    
    name: r'entry_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? entryUuid;



  @JsonKey(
    
    name: r'exit_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? exitUuid;



  @JsonKey(
    
    name: r'entry_system',
    required: false,
    includeIfNull: false,
  )


  final String? entrySystem;



  @JsonKey(
    
    name: r'exit_system',
    required: false,
    includeIfNull: false,
  )


  final String? exitSystem;



      /// Fuel cost in SCU
  @JsonKey(
    
    name: r'fuel_cost',
    required: false,
    includeIfNull: false,
  )


  final num? fuelCost;



  @JsonKey(
    
    name: r'size_class',
    required: false,
    includeIfNull: false,
  )


  final ListLocationPositions200ResponseConnectionsInnerSizeClassEnum? sizeClass;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListLocationPositions200ResponseConnectionsInner &&
      other.entryUuid == entryUuid &&
      other.exitUuid == exitUuid &&
      other.entrySystem == entrySystem &&
      other.exitSystem == exitSystem &&
      other.fuelCost == fuelCost &&
      other.sizeClass == sizeClass;

    @override
    int get hashCode =>
        entryUuid.hashCode +
        exitUuid.hashCode +
        entrySystem.hashCode +
        exitSystem.hashCode +
        fuelCost.hashCode +
        sizeClass.hashCode;

  factory ListLocationPositions200ResponseConnectionsInner.fromJson(Map<String, dynamic> json) => _$ListLocationPositions200ResponseConnectionsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocationPositions200ResponseConnectionsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum ListLocationPositions200ResponseConnectionsInnerSizeClassEnum {
@JsonValue(r'small')
small(r'small'),
@JsonValue(r'large')
large(r'large'),
@JsonValue(r'unknown')
unknown(r'unknown');

const ListLocationPositions200ResponseConnectionsInnerSizeClassEnum(this.value);

final String value;

@override
String toString() => value;
}


