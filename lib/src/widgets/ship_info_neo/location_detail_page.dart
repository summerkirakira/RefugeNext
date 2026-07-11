import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/location.dart';
import 'package:refuge_next/src/repo/translation.dart';
// 复用通用卡片/格式化 helper(顶层纯函数,非继承页)
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show itemCard, itemRows, itemRow, itemGroupHeader;

/// 独立的地点详情测试页(不继承 GameItemDetailPage)。
///
/// 列表用 [LocationRepo] 下载的 [GameStarmapLocation]。本版先实现「概览」卡
/// (层级 / 状态 / 概览)。仅作开发调试用。
class LocationDetailPage extends StatefulWidget {
  const LocationDetailPage({
    super.key,
    this.initialLocation,
    this.allowSwitch = true,
  });

  /// 指定展示的地点;为 null 时取本地第一条。
  final GameStarmapLocation? initialLocation;

  /// 是否显示「切换地点」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  State<LocationDetailPage> createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  List<GameStarmapLocation> _all = [];
  GameStarmapLocation? _selected;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.wait([
      LocationRepo().getLocations(),
      TranslationRepo().getTranslations(),
    ]).then((results) {
      if (!mounted) return;
      final locations = results[0] as List<GameStarmapLocation>;
      setState(() {
        _all = locations;
        _selected = widget.initialLocation ??
            (locations.isNotEmpty ? locations.first : null);
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('地点详情')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final l = _selected;
    if (l == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('地点详情')),
        body: const Center(child: Text('本地暂无数据,请先在数据库页下载')),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTitle(l),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _cards(l)
                      .map((c) => Padding(
                          padding: const EdgeInsets.only(top: 12), child: c))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============ 头部(仿 GameItem 详情页:题图 + 信息 + 简介) ============

  String? _headerImage(GameStarmapLocation l) {
    final images = l.images;
    if (images == null || images.isEmpty) return null;
    final first = images.first;
    return first.originalUrl ?? first.thumbnailUrl;
  }

  Widget _buildTitle(GameStarmapLocation l) {
    final thumbUrl = _headerImage(l);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final narrow = constraints.maxWidth < 500;
              if (narrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (thumbUrl != null) ...[
                      _titleImage(thumbUrl,
                          aspectRatio: 16 / 9, showBack: true),
                      const SizedBox(height: 12),
                    ],
                    _titleInfo(l),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (thumbUrl != null) ...[
                    Expanded(
                      flex: 9,
                      child: _titleImage(thumbUrl,
                          aspectRatio: 3 / 2, showBack: true),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(flex: 11, child: _titleInfo(l)),
                ],
              );
            },
          ),
          if (thumbUrl == null)
            Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 20,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _titleImage(String url,
      {required double aspectRatio, bool showBack = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, _) => Container(color: Colors.black12),
              errorWidget: (context, _, __) => Container(
                color: Colors.black12,
                child: const Icon(Icons.place_outlined,
                    size: 48, color: Colors.white54),
              ),
            ),
            if (showBack) Positioned(top: 8, left: 8, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleInfo(GameStarmapLocation l) {
    final subtitle = [l.type?.name, l.system]
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .join(' · ');
    final desc = l.description?.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(l.name ?? l.designation ?? '未知',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            if (widget.allowSwitch && _all.isNotEmpty)
              SizedBox(
                width: 32,
                height: 32,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  icon: const Icon(Icons.swap_horiz),
                  tooltip: '切换地点',
                  onPressed: () => _showSelector(context),
                ),
              ),
          ],
        ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ),
        if (desc != null && desc.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              desc,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  // ============ 卡片 ============

  String? _vis(bool? hidden) =>
      hidden == null ? null : (hidden ? '隐藏' : '可见');
  String? _yn(bool? v) => v == null ? null : (v ? '是' : '否');
  String? _respawn(String? t) {
    if (t == null || t.isEmpty || t.toLowerCase() == 'none') return '无';
    return t;
  }

  List<Widget> _cards(GameStarmapLocation l) {
    return [
      itemCard('概览', [
        ...itemGroupHeader('层级'),
        ...itemRows([
          itemRow('恒星', l.star?.name),
          itemRow('星系', l.system),
          itemRow('上级', l.parent?.name),
        ]),
        ...itemGroupHeader('状态'),
        ...itemRows([
          itemRow('星图', _vis(l.hideInStarmap)),
          itemRow('世界', _vis(l.hideInWorld)),
          itemRow('可扫描', _yn(l.isScannable)),
          itemRow('旅行',
              l.blockTravel == null ? null : (l.blockTravel! ? '禁止' : '允许')),
        ]),
        ...itemGroupHeader('概览'),
        ...itemRows([
          itemRow('子地点', l.childCount?.toString()),
          itemRow('任务', l.missionCount?.toString()),
          itemRow('重生', _respawn(l.respawnLocationType)),
        ]),
      ]),
    ];
  }

  // ============ 切换地点 modal ============

  void _showSelector(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        var filtered = List<GameStarmapLocation>.of(_all);
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.7,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: '搜索地点名',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        onChanged: (value) {
                          final lower = value.toLowerCase();
                          setSheetState(() {
                            filtered = _all.where((l) {
                              return (l.name?.toLowerCase().contains(lower) ??
                                      false) ||
                                  (l.designation
                                          ?.toLowerCase()
                                          .contains(lower) ??
                                      false);
                            }).toList();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final l = filtered[index];
                          return ListTile(
                            dense: true,
                            title: Text(l.name ?? l.designation ?? '未知'),
                            subtitle: Text(
                              [l.type?.name, l.system]
                                  .whereType<String>()
                                  .join(' · '),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                              setState(() => _selected = l);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
