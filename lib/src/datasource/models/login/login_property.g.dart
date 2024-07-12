// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginPropertyImpl _$$LoginPropertyImplFromJson(Map<String, dynamic> json) =>
    _$LoginPropertyImpl(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginPropertyImplToJson(_$LoginPropertyImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      accountSignin: json['accountSignin'] == null
          ? null
          : Login.fromJson(json['accountSignin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'accountSignin': instance.accountSignin,
    };

_$LoginImpl _$$LoginImplFromJson(Map<String, dynamic> json) => _$LoginImpl(
      displayname: json['displayname'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$LoginImplToJson(_$LoginImpl instance) =>
    <String, dynamic>{
      'displayname': instance.displayname,
      'id': instance.id,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      message: json['message'] as String,
      extensions:
          Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
      code: json['code'] as String,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'extensions': instance.extensions,
      'code': instance.code,
    };

_$ExtensionsImpl _$$ExtensionsImplFromJson(Map<String, dynamic> json) =>
    _$ExtensionsImpl(
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExtensionsImplToJson(_$ExtensionsImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
    };

_$DetailsImpl _$$DetailsImplFromJson(Map<String, dynamic> json) =>
    _$DetailsImpl(
      sessionId: json['sessionId'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$DetailsImplToJson(_$DetailsImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'deviceId': instance.deviceId,
    };

_$LauncherLoginPropertyImpl _$$LauncherLoginPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$LauncherLoginPropertyImpl(
      success: (json['success'] as num).toInt(),
      code: json['code'] as String,
      msg: json['msg'] as String,
      data: json['data'] == null
          ? null
          : DataDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LauncherLoginPropertyImplToJson(
        _$LauncherLoginPropertyImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

_$DataDetailsImpl _$$DataDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DataDetailsImpl(
      session_id: json['session_id'] as String,
      device_id: json['device_id'] as String?,
    );

Map<String, dynamic> _$$DataDetailsImplToJson(_$DataDetailsImpl instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'device_id': instance.device_id,
    };

_$LoginBodyImpl _$$LoginBodyImplFromJson(Map<String, dynamic> json) =>
    _$LoginBodyImpl(
      captcha: json['captcha'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      remember: json['remember'] as bool? ?? true,
    );

Map<String, dynamic> _$$LoginBodyImplToJson(_$LoginBodyImpl instance) =>
    <String, dynamic>{
      'captcha': instance.captcha,
      'email': instance.email,
      'password': instance.password,
      'remember': instance.remember,
    };

_$LauncherLoginBodyImpl _$$LauncherLoginBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$LauncherLoginBodyImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      remember: json['remember'] as bool? ?? true,
      captcha: json['captcha'] as String?,
    );

Map<String, dynamic> _$$LauncherLoginBodyImplToJson(
        _$LauncherLoginBodyImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'remember': instance.remember,
      'captcha': instance.captcha,
    };

_$MultiStepLoginBodyImpl _$$MultiStepLoginBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiStepLoginBodyImpl(
      code: json['code'] as String,
      deviceName: json['deviceName'] as String? ?? "StarRefuge",
      deviceType: json['deviceType'] as String? ?? "computer",
      duration: json['duration'] as String? ?? "year",
    );

Map<String, dynamic> _$$MultiStepLoginBodyImplToJson(
        _$MultiStepLoginBodyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'deviceName': instance.deviceName,
      'deviceType': instance.deviceType,
      'duration': instance.duration,
    };

_$LauncherMultiStepLoginBodyImpl _$$LauncherMultiStepLoginBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$LauncherMultiStepLoginBodyImpl(
      code: json['code'] as String,
      deviceName: json['deviceName'] as String? ?? "StarRefuge",
      deviceType: json['deviceType'] as String? ?? "computer",
      duration: json['duration'] as String? ?? "year",
    );

Map<String, dynamic> _$$LauncherMultiStepLoginBodyImplToJson(
        _$LauncherMultiStepLoginBodyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'deviceName': instance.deviceName,
      'deviceType': instance.deviceType,
      'duration': instance.duration,
    };

_$MultiStepLoginPropertyImpl _$$MultiStepLoginPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$MultiStepLoginPropertyImpl(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MultiStepLoginPropertyImplToJson(
        _$MultiStepLoginPropertyImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };

_$RecaptchaPostBodyImpl _$$RecaptchaPostBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$RecaptchaPostBodyImpl();

Map<String, dynamic> _$$RecaptchaPostBodyImplToJson(
        _$RecaptchaPostBodyImpl instance) =>
    <String, dynamic>{};
