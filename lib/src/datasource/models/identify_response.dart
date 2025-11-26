import 'package:freezed_annotation/freezed_annotation.dart';
import 'friend.dart';

part 'identify_response.freezed.dart';
part 'identify_response.g.dart';

@unfreezed
class IdentifyResponse with _$IdentifyResponse {
  factory IdentifyResponse({
    required int success,
    String? code,
    String? msg,
    IdentifyData? data,
  }) = _IdentifyResponse;

  factory IdentifyResponse.fromJson(Map<String, dynamic> json) => _$IdentifyResponseFromJson(json);
}

@unfreezed
class IdentifyData with _$IdentifyData {
  factory IdentifyData({
    List<Friend>? friends,
  }) = _IdentifyData;

  factory IdentifyData.fromJson(Map<String, dynamic> json) => _$IdentifyDataFromJson(json);
}
