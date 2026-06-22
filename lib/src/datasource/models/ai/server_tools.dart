/// 服务端内联工具（SERVER_TOOLS）的展示文案。中性位置，供 SSE 解析层与聊天 UI 共用。
/// 这些工具在服务端内联执行（RAG / 查参数），客户端不执行、只展示「小九调用了 X」。
const Map<String, String> kServerToolLabels = {
  'retrieve_docs': '检索资料',
  'get_ship_spec': '查询舰船参数',
};

/// 服务端工具的展示文案：命中 [kServerToolLabels] 时，有 query 拼成「检索资料：货运船」式样，
/// 否则纯标签；非服务端工具返回 null。
String? serverToolLabel(String name, {String? query}) {
  final label = kServerToolLabels[name];
  if (label == null) return null;
  final q = query?.trim();
  return (q != null && q.isNotEmpty) ? '$label：$q' : label;
}
