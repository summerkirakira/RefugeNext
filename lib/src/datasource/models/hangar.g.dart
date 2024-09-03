// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HangarSubItemImpl _$$HangarSubItemImplFromJson(Map<String, dynamic> json) =>
    _$HangarSubItemImpl(
      id: json['id'] as String,
      image: json['image'] as String,
      packageId: (json['packageId'] as num).toInt(),
      title: json['title'] as String,
      kind: json['kind'] as String,
      subtitle: json['subtitle'] as String,
      insertTime: (json['insertTime'] as num).toInt(),
      chineseSubtitle: json['chineseSubtitle'] as String?,
      chineseTitle: json['chineseTitle'] as String?,
      price: (json['price'] as num).toInt(),
      fromShipPrice: (json['fromShipPrice'] as num).toInt(),
      toShipPrice: (json['toShipPrice'] as num).toInt(),
    );

Map<String, dynamic> _$$HangarSubItemImplToJson(_$HangarSubItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'packageId': instance.packageId,
      'title': instance.title,
      'kind': instance.kind,
      'subtitle': instance.subtitle,
      'insertTime': instance.insertTime,
      'chineseSubtitle': instance.chineseSubtitle,
      'chineseTitle': instance.chineseTitle,
      'price': instance.price,
      'fromShipPrice': instance.fromShipPrice,
      'toShipPrice': instance.toShipPrice,
    };

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'name': instance.name,
    };

_$HangarItemImpl _$$HangarItemImplFromJson(Map<String, dynamic> json) =>
    _$HangarItemImpl(
      id: (json['id'] as num).toInt(),
      idList: (json['idList'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: json['name'] as String,
      chineseName: json['chineseName'] as String?,
      image: json['image'] as String,
      number: (json['number'] as num).toInt(),
      status: json['status'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      date: json['date'] as String,
      contains: json['contains'] as String,
      price: (json['price'] as num).toInt(),
      insurance: json['insurance'] as String,
      alsoContains: json['alsoContains'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => HangarSubItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isUpgrade: json['isUpgrade'] as bool,
      chineseAlsoContains: json['chineseAlsoContains'] as String?,
      rawData: (json['rawData'] as List<dynamic>)
          .map((e) => HangarItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownedBy: json['ownedBy'] as String,
      currentPrice: (json['currentPrice'] as num).toInt(),
      canGit: json['canGit'] as bool,
      canReclaim: json['canReclaim'] as bool,
      canUpgrade: json['canUpgrade'] as bool,
      page: (json['page'] as num).toInt(),
      upgradeInfo: json['upgradeInfo'] == null
          ? null
          : UpgradeInfo.fromJson(json['upgradeInfo'] as Map<String, dynamic>),
      fromShip: json['fromShip'] == null
          ? null
          : ShipAlias.fromJson(json['fromShip'] as Map<String, dynamic>),
      toShip: json['toShip'] == null
          ? null
          : ShipAlias.fromJson(json['toShip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HangarItemImplToJson(_$HangarItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idList': instance.idList,
      'name': instance.name,
      'chineseName': instance.chineseName,
      'image': instance.image,
      'number': instance.number,
      'status': instance.status,
      'tags': instance.tags,
      'date': instance.date,
      'contains': instance.contains,
      'price': instance.price,
      'insurance': instance.insurance,
      'alsoContains': instance.alsoContains,
      'items': instance.items,
      'isUpgrade': instance.isUpgrade,
      'chineseAlsoContains': instance.chineseAlsoContains,
      'rawData': instance.rawData,
      'ownedBy': instance.ownedBy,
      'currentPrice': instance.currentPrice,
      'canGit': instance.canGit,
      'canReclaim': instance.canReclaim,
      'canUpgrade': instance.canUpgrade,
      'page': instance.page,
      'upgradeInfo': instance.upgradeInfo,
      'fromShip': instance.fromShip,
      'toShip': instance.toShip,
    };
