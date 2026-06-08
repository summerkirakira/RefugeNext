//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starsystem_jumppoints_jumppoints.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_jumppoints.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemJumppoints {
  /// Returns a new [StarsystemJumppoints] instance.
  StarsystemJumppoints({

     this.jumppoints,
  });

  @JsonKey(
    
    name: r'jumppoints',
    required: false,
    includeIfNull: false,
  )


  final StarsystemJumppointsJumppoints? jumppoints;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemJumppoints &&
      other.jumppoints == jumppoints;

    @override
    int get hashCode =>
        (jumppoints == null ? 0 : jumppoints.hashCode);

  factory StarsystemJumppoints.fromJson(Map<String, dynamic> json) => _$StarsystemJumppointsFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemJumppointsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

