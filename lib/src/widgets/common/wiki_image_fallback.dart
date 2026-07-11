import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';

/// wiki 图片下载失败时的回退链接：对**完整 URL 字符串**取 SHA-256（UTF-8）后加 `.webp` →
/// `https://image.biaoju.site/starcitizen/wiki/images/<sha256>.webp`
///
/// 与服务端镜像 pipeline 一致：`sha256(url.encode("utf-8")).hexdigest()`。
/// 整串 url 原样（不取 basename、不解码、不去前缀）。提为顶层纯函数便于单测。
/// url 为空时返回 null。
String? wikiImageFallbackUrl(String? url) {
  if (url == null || url.isEmpty) return null;
  final hash = sha256.convert(utf8.encode(url)).toString();
  return 'https://image.biaoju.site/starcitizen/wiki/images/$hash.webp';
}

/// 供各图片站点的 errorWidget 复用：wiki 图加载失败后，先尝试 md5 回退图，
/// 回退图也失败 / 无回退 URL 时返回最终占位 [onFail]。
/// [imageBuilder] 传入与 primary 相同的圆角 builder（列表卡片用）；详情页传 null 走 [fit]。
Widget wikiImageFallback(
  String url, {
  required Widget onFail,
  Widget Function(BuildContext, ImageProvider)? imageBuilder,
  BoxFit fit = BoxFit.cover,
}) {
  final fb = wikiImageFallbackUrl(url);
  if (fb == null) return onFail;
  return CachedNetworkImage(
    imageUrl: fb,
    fit: imageBuilder == null ? fit : null,
    imageBuilder: imageBuilder,
    errorWidget: (_, __, ___) => onFail,
  );
}
