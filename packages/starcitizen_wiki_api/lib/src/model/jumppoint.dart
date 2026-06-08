//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/jumppoint_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jumppoint.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Jumppoint {
  /// Returns a new [Jumppoint] instance.
  Jumppoint({

     this.id,

     this.size,

     this.direction,

     this.entry,

     this.exit,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final String? size;



  @JsonKey(
    
    name: r'direction',
    required: false,
    includeIfNull: false,
  )


  final String? direction;



  @JsonKey(
    
    name: r'entry',
    required: false,
    includeIfNull: false,
  )


  final JumppointEntry? entry;



  @JsonKey(
    
    name: r'exit',
    required: false,
    includeIfNull: false,
  )


  final JumppointEntry? exit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Jumppoint &&
      other.id == id &&
      other.size == size &&
      other.direction == direction &&
      other.entry == entry &&
      other.exit == exit;

    @override
    int get hashCode =>
        id.hashCode +
        size.hashCode +
        direction.hashCode +
        entry.hashCode +
        exit.hashCode;

  factory Jumppoint.fromJson(Map<String, dynamic> json) => _$JumppointFromJson(json);

  Map<String, dynamic> toJson() => _$JumppointToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

