import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangar.freezed.dart';
part 'hangar.g.dart';

@unfreezed
class HangarSubItem with _$HangarSubItem {
  factory HangarSubItem({
    required String id,
    required String image,
    required int packageId,
    required String title,
    required String kind,
    required String subtitle,
    required int insertTime,
    String? chineseSubtitle,
    String? chineseTitle,
    required int price,
    required int fromShipPrice,
    required int toShipPrice,
  }) = _HangarSubItem;

  factory HangarSubItem.fromJson(Map<String, dynamic> json) => _$HangarSubItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Tag with _$Tag {
  factory Tag({
    required String name,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@unfreezed
class HangarItem with _$HangarItem {
  factory HangarItem({
    required int id,
    required List<int> idList,
    required String name,
    String? chineseName,
    required String image,
    required int number,
    required String status,
    required List<String> tags,
    required String date,
    required String contains,
    required int price,
    required String insurance,
    required String alsoContains,
    required List<HangarSubItem> items,
    required bool isUpgrade,
    String? chineseAlsoContains,
    required List<HangarItem> rawData,
    required String ownedBy,
    required int currentPrice,
    required bool canGit,
    required bool canReclaim,
    required bool canUpgrade,
    required int page,
  }) = _HangarItem;

  factory HangarItem.fromJson(Map<String, dynamic> json) => _$HangarItemFromJson(json);
}
