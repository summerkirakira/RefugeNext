import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/ship_info.dart';

/// 解析载具缩略图 URL,供详情页大图与卡片小图共用。
///
/// 取图顺序:
/// 1. wiki 自带 `images`(starcitizen.tools 实拍题图):
///    - [small] 为 true 优先 600px 缩略图(卡片用,省流);
///    - 否则优先原图(详情页头图用,高清);
/// 2. 回退:按英文名匹配现有船库 [ShipInfoRepo] 的 biaoju 渲染图;
/// 3. 都没有返回 null(调用方自行兜底占位)。
String? vehicleThumbnailUrl(GameVehicle v, {bool small = false}) {
  final images = v.images;
  if (images != null && images.isNotEmpty) {
    final first = images.first;
    final url = small
        ? (first.thumbnailUrl ?? first.originalUrl)
        : (first.originalUrl ?? first.thumbnailUrl);
    if (url != null && url.isNotEmpty) {
      return url;
    }
  }
  final name = v.name?.toLowerCase();
  if (name == null) {
    return null;
  }
  for (final ship in ShipInfoRepo().getShipsSync()) {
    if (ship.name.toLowerCase() == name) {
      final pic = ship.shipNameBinding?.shipPicName;
      if (pic != null) {
        return 'https://image.biaoju.site/refuge/data/ship_render/$pic.thumb.png';
      }
    }
  }
  return null;
}
