//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_aspects.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintAspects {
  /// Returns a new [BlueprintAspects] instance.
  BlueprintAspects({

     this.aspects,

     this.aspectGroups,

     this.hasInteractiveAspects,
  });

      /// Flat list of all aspects
  @JsonKey(
    
    name: r'aspects',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintAspect>? aspects;



      /// Groups of related aspects
  @JsonKey(
    
    name: r'aspect_groups',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintAspectGroup>? aspectGroups;



      /// Whether any aspect has dynamic quality modifiers
  @JsonKey(
    
    name: r'has_interactive_aspects',
    required: false,
    includeIfNull: false,
  )


  final bool? hasInteractiveAspects;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintAspects &&
      other.aspects == aspects &&
      other.aspectGroups == aspectGroups &&
      other.hasInteractiveAspects == hasInteractiveAspects;

    @override
    int get hashCode =>
        aspects.hashCode +
        aspectGroups.hashCode +
        hasInteractiveAspects.hashCode;

  factory BlueprintAspects.fromJson(Map<String, dynamic> json) => _$BlueprintAspectsFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintAspectsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

