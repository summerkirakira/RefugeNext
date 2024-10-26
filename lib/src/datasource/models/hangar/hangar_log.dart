import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangar_log.freezed.dart';
part 'hangar_log.g.dart';

@freezed
class HangarLog with _$HangarLog {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HangarLog({
    required String id,
    required int time,
    required String type,
    required String name,
    String? chineseName,
    int? price,
    String? source,
    String? target,
    String? operator,
    String? reason,
    String? order,
    required int insertTime,
  }) = _HangarLog;

  factory HangarLog.fromJson(Map<String, dynamic> json) =>
      _$HangarLogFromJson(json);
}