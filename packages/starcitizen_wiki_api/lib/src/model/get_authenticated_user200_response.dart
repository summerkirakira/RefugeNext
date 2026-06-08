//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'get_authenticated_user200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetAuthenticatedUser200Response {
  /// Returns a new [GetAuthenticatedUser200Response] instance.
  GetAuthenticatedUser200Response({

     this.id,

     this.name,

     this.email,

     this.emailVerifiedAt,

     this.isAdmin,

     this.languageId,

     this.createdAt,

     this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'email_verified_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? emailVerifiedAt;



  @JsonKey(
    
    name: r'is_admin',
    required: false,
    includeIfNull: false,
  )


  final bool? isAdmin;



  @JsonKey(
    
    name: r'language_id',
    required: false,
    includeIfNull: false,
  )


  final int? languageId;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetAuthenticatedUser200Response &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.emailVerifiedAt == emailVerifiedAt &&
      other.isAdmin == isAdmin &&
      other.languageId == languageId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode +
        (emailVerifiedAt == null ? 0 : emailVerifiedAt.hashCode) +
        isAdmin.hashCode +
        (languageId == null ? 0 : languageId.hashCode) +
        (createdAt == null ? 0 : createdAt.hashCode) +
        (updatedAt == null ? 0 : updatedAt.hashCode);

  factory GetAuthenticatedUser200Response.fromJson(Map<String, dynamic> json) => _$GetAuthenticatedUser200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAuthenticatedUser200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

