//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/jumppoint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_jumppoints_jumppoints.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemJumppointsJumppoints {
  /// Returns a new [StarsystemJumppointsJumppoints] instance.
  StarsystemJumppointsJumppoints({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Jumppoint? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemJumppointsJumppoints &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory StarsystemJumppointsJumppoints.fromJson(Map<String, dynamic> json) => _$StarsystemJumppointsJumppointsFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemJumppointsJumppointsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

