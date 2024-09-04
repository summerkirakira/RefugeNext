import 'package:freezed_annotation/freezed_annotation.dart';

part 'buyback.freezed.dart';
part 'buyback.g.dart';

@unfreezed
class BuybackItem with _$BuybackItem {
  factory BuybackItem({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'date') required int date,
    @JsonKey(name: 'contains') required String contains,
    @JsonKey(name: 'also_contains') required String alsoContains,
    @JsonKey(name: 'insert_time') required int insertTime,
    @JsonKey(name: 'isUpgrade') @Default(false) bool isUpgrade,
    @JsonKey(name: 'formShipId') @Default(0) int formShipId,
    @JsonKey(name: 'toShipId') @Default(0) int toShipId,
    @JsonKey(name: 'toSkuId') @Default(0) int toSkuId,
    @JsonKey(name: 'chinesName') String? chinesName,
    @JsonKey(name: 'chinese_contains') String? chineseContains,
    @JsonKey(name: 'chineseAlsoContains') String? chineseAlsoContains,
    @JsonKey(name: 'url') required String? url,
    @JsonKey(name: 'price') @Default(0) int price,
    @JsonKey(name: 'number') required int number,
    @JsonKey(name: 'idList') required List<int> idList,
  }) = _BuybackItem;

  factory BuybackItem.fromJson(Map<String, dynamic> json) =>
      _$BuybackItemFromJson(json);
}
