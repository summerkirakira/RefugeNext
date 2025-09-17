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
  final List<ReferralRecruitListData> users;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final int currentPage;
  final bool showConverted;
  final bool hasMoreData;
  final int totalRecruits;
  final int totalProspects;

  ReferralListState({
    this.users = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasError = false,
    this.currentPage = 1,
    this.showConverted = false,
    this.hasMoreData = true,
    this.totalRecruits = 0,
    this.totalProspects = 0,
  });

  ReferralListState copyWith({
    List<ReferralRecruitListData>? users,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
    int? currentPage,
    bool? showConverted,
    bool? hasMoreData,
    int? totalRecruits,
    int? totalProspects,
  }) {
    return ReferralListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      currentPage: currentPage ?? this.currentPage,
      showConverted: showConverted ?? this.showConverted,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      totalRecruits: totalRecruits ?? this.totalRecruits,
      totalProspects: totalProspects ?? this.totalProspects,
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
      if (_state.hasMoreData && !_state.isLoadingMore && !_state.isLoading) {
        _loadMoreData();
      }
    }
  }

  Future<void> _loadReferralData() async {
    setState(() {
      _state = _state.copyWith(
        isLoading: true,
        hasError: false,
        currentPage: 1,
        hasMoreData: true,
        users: [],
      );
    });

    try {
      final query = ReferralListQuery(
        converted: _state.showConverted,
        limit: 10,
        page: 1,
      );

      final result = await query.execute();

      setState(() {
        _state = _state.copyWith(
          users: result.data,
          isLoading: false,
          currentPage: 1,
          hasMoreData: result.data.length >= 10,
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

  Future<void> _loadMoreData() async {
    if (_state.isLoadingMore || !_state.hasMoreData) return;

    setState(() {
      _state = _state.copyWith(isLoadingMore: true);
    });

    try {
      final nextPage = _state.currentPage + 1;
      final query = ReferralListQuery(
        converted: _state.showConverted,
        limit: 10,
        page: nextPage,
      );

      final result = await query.execute();

      setState(() {
        _state = _state.copyWith(
          users: [..._state.users, ...result.data],
          isLoadingMore: false,
          currentPage: nextPage,
          hasMoreData: result.data.length >= 10,
          totalRecruits: result.recruitsCount,
          totalProspects: result.prospectsCount,
        );
      });
    } catch (e) {
      setState(() {
        _state = _state.copyWith(isLoadingMore: false);
      });
      showToast(message: "加载更多数据失败");
    }
  }

  void _toggleFilter() {
    setState(() {
      _state = _state.copyWith(
        showConverted: !_state.showConverted,
      );
    });
    _loadReferralData();
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
                      child: ElevatedButton(
                        onPressed: _toggleFilter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _state.showConverted
                            ? Theme.of(context).primaryColor
                            : Colors.grey.withOpacity(0.3),
                        ),
                        child: Text(_state.showConverted ? '已购买用户' : '全部用户'),
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
                : _state.users.isEmpty
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
                      itemCount: _state.users.length + (_state.hasMoreData || _state.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= _state.users.length) {
                          // 显示加载更多指示器
                          return _buildLoadMoreIndicator();
                        }
                        final user = _state.users[index];
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
    if (_state.isLoadingMore) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 10),
              Text('加载更多...', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      );
    } else if (!_state.hasMoreData && _state.users.isNotEmpty) {
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