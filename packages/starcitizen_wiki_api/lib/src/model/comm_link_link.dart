//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkLink {
  /// Returns a new [CommLinkLink] instance.
  CommLinkLink({

     this.href,

     this.text,
  });

      /// The URL the link points to.
  @JsonKey(
    
    name: r'href',
    required: false,
    includeIfNull: false,
  )


  final String? href;



      /// Display text of the hyperlink.
  @JsonKey(
    
    name: r'text',
    required: false,
    includeIfNull: false,
  )


  final String? text;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkLink &&
      other.href == href &&
      other.text == text;

    @override
    int get hashCode =>
        href.hashCode +
        text.hashCode;

  factory CommLinkLink.fromJson(Map<String, dynamic> json) => _$CommLinkLinkFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

