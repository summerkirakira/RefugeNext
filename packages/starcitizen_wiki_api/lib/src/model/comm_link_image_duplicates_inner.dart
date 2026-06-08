//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_image_duplicates_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkImageDuplicatesInner {
  /// Returns a new [CommLinkImageDuplicatesInner] instance.
  CommLinkImageDuplicatesInner({

     this.id,

     this.name,
  });

      /// Internal database ID of the duplicate image
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// File name of the duplicate image
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkImageDuplicatesInner &&
      other.id == id &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode;

  factory CommLinkImageDuplicatesInner.fromJson(Map<String, dynamic> json) => _$CommLinkImageDuplicatesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkImageDuplicatesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

