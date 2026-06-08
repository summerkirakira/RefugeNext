//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_port_attached_vehicle.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePortAttachedVehicle {
  /// Returns a new [GameVehiclePortAttachedVehicle] instance.
  GameVehiclePortAttachedVehicle({

     this.uuid,

     this.name,

     this.className,

     this.sizeClass,

     this.isSpaceship,

     this.isVehicle,

     this.isGravlev,

     this.link,

     this.webUrl,
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
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



  @JsonKey(
    
    name: r'size_class',
    required: false,
    includeIfNull: false,
  )


  final int? sizeClass;



  @JsonKey(
    
    name: r'is_spaceship',
    required: false,
    includeIfNull: false,
  )


  final bool? isSpaceship;



  @JsonKey(
    
    name: r'is_vehicle',
    required: false,
    includeIfNull: false,
  )


  final bool? isVehicle;



  @JsonKey(
    
    name: r'is_gravlev',
    required: false,
    includeIfNull: false,
  )


  final bool? isGravlev;



      /// API URL for the vehicle.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the vehicle page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePortAttachedVehicle &&
      other.uuid == uuid &&
      other.name == name &&
      other.className == className &&
      other.sizeClass == sizeClass &&
      other.isSpaceship == isSpaceship &&
      other.isVehicle == isVehicle &&
      other.isGravlev == isGravlev &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        className.hashCode +
        (sizeClass == null ? 0 : sizeClass.hashCode) +
        (isSpaceship == null ? 0 : isSpaceship.hashCode) +
        (isVehicle == null ? 0 : isVehicle.hashCode) +
        (isGravlev == null ? 0 : isGravlev.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory GameVehiclePortAttachedVehicle.fromJson(Map<String, dynamic> json) => _$GameVehiclePortAttachedVehicleFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePortAttachedVehicleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

