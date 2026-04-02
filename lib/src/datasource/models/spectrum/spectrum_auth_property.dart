import 'package:freezed_annotation/freezed_annotation.dart';

part 'spectrum_auth_property.freezed.dart';
part 'spectrum_auth_property.g.dart';

@unfreezed
class SpectrumAuthProperty with _$SpectrumAuthProperty {
  factory SpectrumAuthProperty({
    required int success,
    String? code,
    String? msg,
    SpectrumAuthData? data,
  }) = _SpectrumAuthProperty;

  factory SpectrumAuthProperty.fromJson(Map<String, dynamic> json) => _$SpectrumAuthPropertyFromJson(json);
}

@unfreezed
class SpectrumAuthData with _$SpectrumAuthData {
  factory SpectrumAuthData({
    String? spectrumToken,
    String? gameToken,
    SpectrumFeatureFlags? featureFlags,
    SpectrumSubscriptionsKeys? subscriptionsKeys,
  }) = _SpectrumAuthData;

  factory SpectrumAuthData.fromJson(Map<String, dynamic> json) => _$SpectrumAuthDataFromJson(json);
}

@unfreezed
class SpectrumFeatureFlags with _$SpectrumFeatureFlags {
  factory SpectrumFeatureFlags({
    bool? gs,
    bool? pf,
    bool? nn,
    bool? nh,
    bool? nf,
  }) = _SpectrumFeatureFlags;

  factory SpectrumFeatureFlags.fromJson(Map<String, dynamic> json) => _$SpectrumFeatureFlagsFromJson(json);
}

@unfreezed
class SpectrumSubscriptionsKeys with _$SpectrumSubscriptionsKeys {
  factory SpectrumSubscriptionsKeys({
    String? broadcast,
  }) = _SpectrumSubscriptionsKeys;

  factory SpectrumSubscriptionsKeys.fromJson(Map<String, dynamic> json) => _$SpectrumSubscriptionsKeysFromJson(json);
}
