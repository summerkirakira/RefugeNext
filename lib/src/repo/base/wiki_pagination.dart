/// Wiki 可能将请求的 page[size] 限制为更小的值，不能用请求条数判断末页。
/// 缺少分页元数据时继续请求到空页；未完成就触及上限时抛错，避免保存残缺数据。
bool hasMoreWikiPages({
  required int page,
  required int itemCount,
  required int maxPages,
  int? lastPage,
}) {
  if (lastPage != null) {
    if (itemCount == 0 && (page > 1 || page < lastPage)) {
      throw StateError('Wiki 第 $page 页为空，但共有 $lastPage 页');
    }
    if (page >= lastPage) return false;
  } else if (itemCount == 0) {
    return false;
  }
  if (page >= maxPages) {
    throw StateError('Wiki 数据尚未下载完整，已达到 $maxPages 页上限');
  }
  return true;
}
