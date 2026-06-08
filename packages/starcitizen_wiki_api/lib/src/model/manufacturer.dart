//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'manufacturer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Manufacturer {
  /// Returns a new [Manufacturer] instance.
  Manufacturer({

     this.name,

     this.code,

     this.uuid,

     this.link,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Manufacturer &&
      other.name == name &&
      other.code == code &&
      other.uuid == uuid &&
      other.link == link;

    @override
    int get hashCode =>
        name.hashCode +
        code.hashCode +
        uuid.hashCode +
        link.hashCode;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => _$ManufacturerFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

