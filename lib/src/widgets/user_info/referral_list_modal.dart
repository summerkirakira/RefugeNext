import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import '../../datasource/models/referral/referral_list_property.dart';
import '../../network/graphql/account/referral_list_query.dart';
import '../../funcs/toast.dart';
import '../../network/parsers/player_info_parser.dart';
import '../utility/player_search_bottomsheet.dart' show DetailInfoItem, OrganizationInfo;

String _formatTime(String timeString) {
  try {
    final dateTime = DateTime.parse(timeString);
    final formatter = DateFormat('yyyy-MM-dd', 'zh_CN');
    return formatter.format(dateTime);
  } catch (e) {
    return timeString;
  }
}

class ReferralListState {
  final List<ReferralRecruitListData> allUsers;
  final bool isLoading;
  final bool hasError;
  final bool showConverted;
  final int totalRecruits;
  final int totalProspects;
  final bool isReversed;
  final int displayedCount;
  final String campaignId;
  static const int pageSize = 10;

  ReferralListState({
    this.allUsers = const [],
    this.isLoading = false,
    this.hasError = false,
    this.showConverted = false,
    this.totalRecruits = 0,
    this.totalProspects = 0,
    this.isReversed = false,
    this.displayedCount = 10,
    this.campaignId = "1",
  });

  int get totalCount => showConverted ? totalRecruits : (totalRecruits + totalProspects);

  List<ReferralRecruitListData> get filteredUsers {
    // 数据已经在API层面按照showConverted过滤了，直接返回
    return allUsers;
  }

  List<ReferralRecruitListData> get sortedUsers {
    final filtered = List<ReferralRecruitListData>.from(filteredUsers);
    filtered.sort((a, b) {
      final dateA = DateTime.tryParse(a.enlistedOn) ?? DateTime(1970);
      final dateB = DateTime.tryParse(b.enlistedOn) ?? DateTime(1970);
      return isReversed ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
    });
    return filtered;
  }

  List<ReferralRecruitListData> get displayedUsers {
    final sorted = sortedUsers;
    return sorted.take(displayedCount).toList();
  }

  bool get hasMoreData => displayedUsers.length < sortedUsers.length;

  ReferralListState copyWith({
    List<ReferralRecruitListData>? allUsers,
    bool? isLoading,
    bool? hasError,
    bool? showConverted,
    int? totalRecruits,
    int? totalProspects,
    bool? isReversed,
    int? displayedCount,
    String? campaignId,
  }) {
    return ReferralListState(
      allUsers: allUsers ?? this.allUsers,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      showConverted: showConverted ?? this.showConverted,
      totalRecruits: totalRecruits ?? this.totalRecruits,
      totalProspects: totalProspects ?? this.totalProspects,
      isReversed: isReversed ?? this.isReversed,
      displayedCount: displayedCount ?? this.displayedCount,
      campaignId: campaignId ?? this.campaignId,
    );
  }
}

WoltModalSheetPage getReferralListPage(BuildContext modalSheetContext, BuildContext mainContext) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    pageTitle: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('已邀请用户', style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ))
        ],
      )
    ),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () => Navigator.of(modalSheetContext).pop(),
      ),
    ),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
    ),
    child: ReferralListWidget(),
  );
}

class ReferralListWidget extends StatefulWidget {
  @override
  _ReferralListWidgetState createState() => _ReferralListWidgetState();
}

class _ReferralListWidgetState extends State<ReferralListWidget> {
  ReferralListState _state = ReferralListState(isLoading: true);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _loadReferralData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      // 当滚动到距离底部200像素时开始加载更多
      if (_state.hasMoreData && !_state.isLoading) {
        _loadMoreData();
      }
    }
  }

  Future<void> _loadReferralData() async {
    setState(() {
      _state = _state.copyWith(
        isLoading: true,
        hasError: false,
        displayedCount: ReferralListState.pageSize,
      );
    });

    try {
      // 根据当前过滤状态加载对应数据
      final query = ReferralListQuery(
        converted: _state.showConverted, // 根据当前状态选择数据类型
        limit: 10000, // 使用大limit
        page: 1,
        campaignId: _state.campaignId,
      );

      final result = await query.execute();

      setState(() {
        _state = _state.copyWith(
          allUsers: result.data,
          isLoading: false,
          totalRecruits: result.recruitsCount,
          totalProspects: result.prospectsCount,
        );
      });
    } catch (e) {
      setState(() {
        _state = _state.copyWith(isLoading: false, hasError: true);
      });
      showToast(message: "加载邀请用户数据失败");
    }
  }

  void _loadMoreData() {
    if (!_state.hasMoreData) return;

    setState(() {
      _state = _state.copyWith(
        displayedCount: _state.displayedCount + ReferralListState.pageSize,
      );
    });
  }

  void _toggleFilter() {
    setState(() {
      _state = _state.copyWith(
        showConverted: !_state.showConverted,
        displayedCount: ReferralListState.pageSize, // 重置显示数量
      );
    });
    _loadReferralData(); // 重新加载对应类型的数据
  }

  void _toggleSort() {
    setState(() {
      _state = _state.copyWith(
        isReversed: !_state.isReversed,
        displayedCount: ReferralListState.pageSize, // 重置显示数量
      );
    });
  }

  void _toggleCampaign() {
    setState(() {
      _state = _state.copyWith(
        campaignId: _state.campaignId == "1" ? "2" : "1",
        displayedCount: ReferralListState.pageSize, // 重置显示数量
      );
    });
    _loadReferralData(); // 重新加载对应版本的数据
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // 统计信息和过滤器
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('${_state.totalRecruits}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('已购买', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('${_state.totalProspects}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('未购买', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _toggleFilter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _state.showConverted
                            ? Theme.of(context).primaryColor
                            : Colors.grey.withOpacity(0.3),
                        ),
                        child: Text(_state.showConverted ? '已购买' : '未购买'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: _toggleCampaign,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _state.campaignId == "2"
                            ? Theme.of(context).primaryColor
                            : Colors.grey.withOpacity(0.3),
                        ),
                        label: Text(
                          _state.campaignId == "2" ? '新版' : '旧版',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: _toggleSort,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _state.isReversed
                            ? Theme.of(context).primaryColor.withOpacity(0.8)
                            : Colors.grey.withOpacity(0.3),
                        ),
                        icon: Icon(
                          _state.isReversed ? Icons.arrow_downward : Icons.arrow_upward,
                          size: 14,
                        ),
                        label: Text(
                          _state.isReversed ? '最新' : '最旧',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // 用户列表
          Expanded(
            child: _state.isLoading
              ? Center(child: CircularProgressIndicator())
              : _state.hasError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 50, color: Colors.grey),
                        Text('加载失败', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _loadReferralData,
                          child: Text('重试'),
                        ),
                      ],
                    ),
                  )
                : _state.displayedUsers.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.people_outline, size: 50, color: Colors.grey),
                          Text(_state.showConverted ? '暂无已购买用户' : '暂无邀请用户',
                            style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _state.displayedUsers.length + (_state.hasMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= _state.displayedUsers.length) {
                          // 显示加载更多指示器
                          return _buildLoadMoreIndicator();
                        }
                        final user = _state.displayedUsers[index];
                        return _buildUserCard(user);
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(ReferralRecruitListData user) {
    return GestureDetector(
      onTap: () async {
        // 使用displayName作为handle查询玩家信息
        final playerInfo = await getPlayerSearchResult(user.displayName);
        if (!mounted) return;

        if (playerInfo != null) {
          // 使用专门的邀请用户详情页面
          final detailPage = referralUserDetailPage(context, playerInfo);
          WoltModalSheet.of(context).addPage(detailPage);
          WoltModalSheet.of(context).showNext();
        } else {
          showToast(message: "无法获取玩家详细信息");
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            // 用户头像
            AdvancedAvatar(
              name: user.displayName,
              size: 50,
              image: user.avatar.isNotEmpty
                ? CachedNetworkImageProvider(user.avatar)
                : null,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),

            SizedBox(width: 15),

            // 用户信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.displayName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (user.nickname.isNotEmpty && user.nickname != user.displayName)
                    Text(
                      user.nickname,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  SizedBox(height: 5),
                  Text(
                    '注册: ${_formatTime(user.enlistedOn)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  if (user.convertedOn != null && user.convertedOn!.isNotEmpty)
                    Text(
                      '购买: ${_formatTime(user.convertedOn!)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ),

            // 状态标识和详情图标
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: user.convertedOn != null && user.convertedOn!.isNotEmpty
                      ? Colors.green.withOpacity(0.2)
                      : Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    user.convertedOn != null && user.convertedOn!.isNotEmpty ? '已购买' : '未购买',
                    style: TextStyle(
                      fontSize: 11,
                      color: user.convertedOn != null && user.convertedOn!.isNotEmpty
                        ? Colors.green[700]
                        : Colors.orange[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    if (_state.hasMoreData) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: GestureDetector(
            onTap: _loadMoreData,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '加载更多',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
        ),
      );
    } else if (_state.displayedUsers.isNotEmpty) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            '已加载全部数据',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}

// 专门用于邀请列表的用户详情页面
WoltModalSheetPage referralUserDetailPage(BuildContext modalContext, PlayerSearchResult playerInfo) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    isTopBarLayerAlwaysVisible: true,
    topBarTitle: Text(playerInfo.handle),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () {
          // 返回到邀请列表页面
          WoltModalSheet.of(modalContext).showPrevious();
        },
      ),
    ),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: () => Navigator.of(modalContext).pop(),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(playerInfo.image),
            ),
          ),
          const SizedBox(height: 16),
          if (playerInfo.organization != null) ...[
            OrganizationInfo(playerInfo: playerInfo)
          ],
          const SizedBox(height: 16),

          DetailInfoItem(
            leading: Icon(Icons.person_outline),
            title: '昵称',
            value: playerInfo.name,
          ),

          DetailInfoItem(
            leading: Icon(Icons.account_box_outlined),
            title: 'Handle',
            value: playerInfo.handle,
          ),

          DetailInfoItem(
            leading: Icon(Icons.schedule_outlined),
            title: '注册时间',
            value: playerInfo.enlisted,
          ),

          DetailInfoItem(
            leading: Icon(Icons.location_on_outlined),
            title: '地点',
            value: playerInfo.location ?? '未知',
          ),

          DetailInfoItem(
            leading: Icon(Icons.language_outlined),
            title: '语言',
            value: playerInfo.fluency,
          ),

          const SizedBox(height: 80),
        ],
      ),
    ),
  );
}