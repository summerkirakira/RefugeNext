// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuybackItemImpl _$$BuybackItemImplFromJson(Map<String, dynamic> json) =>
    _$BuybackItemImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      date: (json['date'] as num).toInt(),
      contains: json['contains'] as String,
      alsoContains: json['also_contains'] as String,
      insertTime: (json['insert_time'] as num).toInt(),
      isUpgrade: json['isUpgrade'] as bool? ?? false,
      formShipId: (json['formShipId'] as num?)?.toInt() ?? 0,
      toShipId: (json['toShipId'] as num?)?.toInt() ?? 0,
      toSkuId: (json['toSkuId'] as num?)?.toInt() ?? 0,
      chinesName: json['chinesName'] as String?,
      chineseContains: json['chinese_contains'] as String?,
      chineseAlsoContains: json['chineseAlsoContains'] as String?,
      url: json['url'] as String?,
      price: (json['price'] as num?)?.toInt() ?? 0,
      number: (json['number'] as num).toInt(),
      idList: (json['idList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$BuybackItemImplToJson(_$BuybackItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'date': instance.date,
      'contains': instance.contains,
      'also_contains': instance.alsoContains,
      'insert_time': instance.insertTime,
      'isUpgrade': instance.isUpgrade,
      'formShipId': instance.formShipId,
      'toShipId': instance.toShipId,
      'toSkuId': instance.toSkuId,
      'chinesName': instance.chinesName,
      'chinese_contains': instance.chineseContains,
      'chineseAlsoContains': instance.chineseAlsoContains,
      'url': instance.url,
      'price': instance.price,
      'number': instance.number,
      'idList': instance.idList,
    };
