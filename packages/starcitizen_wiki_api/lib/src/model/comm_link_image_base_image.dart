//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_image_base_image.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkImageBaseImage {
  /// Returns a new [CommLinkImageBaseImage] instance.
  CommLinkImageBaseImage({

     this.id,

     this.name,
  });

      /// Internal database ID of the base image
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// File name of the base image
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkImageBaseImage &&
      other.id == id &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode;

  factory CommLinkImageBaseImage.fromJson(Map<String, dynamic> json) => _$CommLinkImageBaseImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkImageBaseImageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

