import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_property.freezed.dart';
part 'login_property.g.dart';

@freezed
class LoginProperty with _$LoginProperty {
  const factory LoginProperty({
    List<Error>? errors,
    Data? data,
  }) = _LoginProperty;

  factory LoginProperty.fromJson(Map<String, dynamic> json) => _$LoginPropertyFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    Login? accountSignin,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Login with _$Login {
  const factory Login({
    required String displayname,
    required int id,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}

@freezed
class Error with _$Error {
  const factory Error({
    required String message,
    required Extensions extensions,
    required String code,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

@freezed
class Extensions with _$Extensions {
  const factory Extensions({
    required Details details,
  }) = _Extensions;

  factory Extensions.fromJson(Map<String, dynamic> json) => _$ExtensionsFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    String? sessionId,
    String? deviceId,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
}

@freezed
class LauncherLoginProperty with _$LauncherLoginProperty {
  const factory LauncherLoginProperty({
    required int success,
    required String code,
    required String msg,
    required DataDetails? data,
  }) = _LauncherLoginProperty;

  factory LauncherLoginProperty.fromJson(Map<String, dynamic> json) => _$LauncherLoginPropertyFromJson(json);
}

@freezed
class DataDetails with _$DataDetails {
  const factory DataDetails({
    required String session_id,
    String? device_id,
  }) = _DataDetails;

  factory DataDetails.fromJson(Map<String, dynamic> json) => _$DataDetailsFromJson(json);
}

@freezed
class LoginBody with _$LoginBody {
  const factory LoginBody({
    required String captcha,
    required String email,
    required String password,
    @Default(true) bool remember,
  }) = _LoginBody;

  factory LoginBody.fromJson(Map<String, dynamic> json) => _$LoginBodyFromJson(json);
}

@freezed
class LauncherLoginBody with _$LauncherLoginBody {
  const factory LauncherLoginBody({
    required String username,
    required String password,
    @Default(true) bool remember,
    String? captcha,
  }) = _LauncherLoginBody;

  factory LauncherLoginBody.fromJson(Map<String, dynamic> json) => _$LauncherLoginBodyFromJson(json);
}

@freezed
class MultiStepLoginBody with _$MultiStepLoginBody {
  const factory MultiStepLoginBody({
    required String code,
    @Default("StarRefuge") String deviceName,
    @Default("computer") String deviceType,
    @Default("year") String duration,
  }) = _MultiStepLoginBody;

  factory MultiStepLoginBody.fromJson(Map<String, dynamic> json) => _$MultiStepLoginBodyFromJson(json);
}

@freezed
class LauncherMultiStepLoginBody with _$LauncherMultiStepLoginBody {
  const factory LauncherMultiStepLoginBody({
    required String code,
    @Default("StarRefuge") String deviceName,
    @Default("computer") String deviceType,
    @Default("year") String duration,
  }) = _LauncherMultiStepLoginBody;

  factory LauncherMultiStepLoginBody.fromJson(Map<String, dynamic> json) => _$LauncherMultiStepLoginBodyFromJson(json);
}

@freezed
class MultiStepLoginProperty with _$MultiStepLoginProperty {
  const factory MultiStepLoginProperty({
    List<Error>? errors,
    required Data data,
  }) = _MultiStepLoginProperty;

  factory MultiStepLoginProperty.fromJson(Map<String, dynamic> json) => _$MultiStepLoginPropertyFromJson(json);
}

@freezed
class RecaptchaPostBody with _$RecaptchaPostBody {
  const factory RecaptchaPostBody() = _RecaptchaPostBody;

  factory RecaptchaPostBody.fromJson(Map<String, dynamic> json) => _$RecaptchaPostBodyFromJson(json);
}
