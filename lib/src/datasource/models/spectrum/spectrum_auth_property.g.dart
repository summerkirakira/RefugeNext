// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spectrum_auth_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpectrumAuthPropertyImpl _$$SpectrumAuthPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumAuthPropertyImpl(
      success: (json['success'] as num).toInt(),
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : SpectrumAuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpectrumAuthPropertyImplToJson(
        _$SpectrumAuthPropertyImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

_$SpectrumAuthDataImpl _$$SpectrumAuthDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumAuthDataImpl(
      spectrumToken: json['spectrumToken'] as String?,
      gameToken: json['gameToken'] as String?,
      featureFlags: json['featureFlags'] == null
          ? null
          : SpectrumFeatureFlags.fromJson(
              json['featureFlags'] as Map<String, dynamic>),
      subscriptionsKeys: json['subscriptionsKeys'] == null
          ? null
          : SpectrumSubscriptionsKeys.fromJson(
              json['subscriptionsKeys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpectrumAuthDataImplToJson(
        _$SpectrumAuthDataImpl instance) =>
    <String, dynamic>{
      'spectrumToken': instance.spectrumToken,
      'gameToken': instance.gameToken,
      'featureFlags': instance.featureFlags,
      'subscriptionsKeys': instance.subscriptionsKeys,
    };

_$SpectrumFeatureFlagsImpl _$$SpectrumFeatureFlagsImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumFeatureFlagsImpl(
      gs: json['gs'] as bool?,
      pf: json['pf'] as bool?,
      nn: json['nn'] as bool?,
      nh: json['nh'] as bool?,
      nf: json['nf'] as bool?,
    );

Map<String, dynamic> _$$SpectrumFeatureFlagsImplToJson(
        _$SpectrumFeatureFlagsImpl instance) =>
    <String, dynamic>{
      'gs': instance.gs,
      'pf': instance.pf,
      'nn': instance.nn,
      'nh': instance.nh,
      'nf': instance.nf,
    };

_$SpectrumSubscriptionsKeysImpl _$$SpectrumSubscriptionsKeysImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumSubscriptionsKeysImpl(
      broadcast: json['broadcast'] as String?,
    );

Map<String, dynamic> _$$SpectrumSubscriptionsKeysImplToJson(
        _$SpectrumSubscriptionsKeysImpl instance) =>
    <String, dynamic>{
      'broadcast': instance.broadcast,
    };
