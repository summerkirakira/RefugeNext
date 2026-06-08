//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_output.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintOutput {
  /// Returns a new [BlueprintOutput] instance.
  BlueprintOutput({

     this.uuid,

     this.name,

     this.class_,

     this.type,

     this.typeLabel,

     this.subType,

     this.subtype,

     this.grade,

     this.itemWebUrl,
  });

      /// UUID of the crafted item
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the crafted item
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Internal class identifier of the crafted item
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



      /// Type category of the crafted item (e.g. WeaponPersonal, Char_Armor_Torso)
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Human-readable label for the type
  @JsonKey(
    
    name: r'type_label',
    required: false,
    includeIfNull: false,
  )


  final String? typeLabel;



      /// Sub-type classification of the crafted item
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Deprecated: Use sub_type.
  @Deprecated('subtype has been deprecated')
  @JsonKey(
    
    name: r'subtype',
    required: false,
    includeIfNull: false,
  )


  final String? subtype;



      /// Grade or quality tier of the crafted item
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final String? grade;



      /// Web URL for the crafted item detail page
  @JsonKey(
    
    name: r'item_web_url',
    required: false,
    includeIfNull: false,
  )


  final String? itemWebUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintOutput &&
      other.uuid == uuid &&
      other.name == name &&
      other.class_ == class_ &&
      other.type == type &&
      other.typeLabel == typeLabel &&
      other.subType == subType &&
      other.subtype == subtype &&
      other.grade == grade &&
      other.itemWebUrl == itemWebUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (class_ == null ? 0 : class_.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subtype == null ? 0 : subtype.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (itemWebUrl == null ? 0 : itemWebUrl.hashCode);

  factory BlueprintOutput.fromJson(Map<String, dynamic> json) => _$BlueprintOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintOutputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

