import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';

/// 兼容已有镜像：对完整 URL 字符串取 SHA-256（UTF-8）后加 `.webp` →
/// `https://image.biaoju.site/starcitizen/wiki/images/<sha256>.webp`
///
/// 整串 URL 原样保留，不解码或重新编码路径。
/// url 为空时返回 null。
String? wikiImageFallbackUrl(String? url) {
  if (url == null || url.isEmpty) return null;
  final hash = sha256.convert(utf8.encode(url)).toString();
  return 'https://image.biaoju.site/starcitizen/wiki/images/$hash.webp';
}

/// 优先兼容完整地址的镜像，再尝试不含查询参数和片段的镜像。
/// Wiki 题图地址可能带有 `?htmpc` 这样的参数，而镜像文件按无参数地址命名。
/// 直接截取原字符串，保留路径中的百分号编码；相同候选只请求一次。
List<String> wikiImageFallbackUrls(String? url) {
  final original = wikiImageFallbackUrl(url);
  if (original == null) return const [];
  final normalized = wikiImageFallbackUrl(url!.split(RegExp(r'[?#]')).first);
  return {original, if (normalized != null) normalized}.toList();
}

/// 供各图片站点的 errorWidget 复用：依次尝试 SHA-256 镜像候选，
/// 全部失败或没有候选时返回最终占位 [onFail]。
/// [imageBuilder] 传入与 primary 相同的圆角 builder（列表卡片用）；详情页传 null 走 [fit]。
/// [placeholder] 在镜像加载期间显示，不传时为空白。
Widget wikiImageFallback(
  String url, {
  required Widget onFail,
  Widget Function(BuildContext, ImageProvider)? imageBuilder,
  BoxFit fit = BoxFit.cover,
  Widget? placeholder,
  Duration fadeInDuration = const Duration(milliseconds: 500),
  Duration fadeOutDuration = const Duration(milliseconds: 1000),
}) {
  final candidates = wikiImageFallbackUrls(url);
  Widget attempt(int index) {
    if (index >= candidates.length) return onFail;
    return CachedNetworkImage(
      key: ValueKey(candidates[index]),
      imageUrl: candidates[index],
      fit: imageBuilder == null ? fit : null,
      imageBuilder: imageBuilder,
      placeholder: placeholder == null ? null : (_, __) => placeholder,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      errorWidget: (_, __, ___) => attempt(index + 1),
    );
  }

  return attempt(0);
}
