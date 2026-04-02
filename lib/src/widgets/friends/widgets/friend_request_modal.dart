import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../datasource/data_model.dart';
import '../../../datasource/models/spectrum/friend_request.dart';
import '../../../datasource/models/friend.dart';
import '../../../network/api_service.dart';
import '../../../funcs/toast.dart';

String _formatTime(int? timestamp) {
  if (timestamp == null) return '';
  try {
    final dt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formatter = DateFormat('yyyy-MM-dd', 'zh_CN');
    return formatter.format(dt);
  } catch (e) {
    return '';
  }
}

WoltModalSheetPage getFriendRequestBottomSheet(BuildContext context) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('好友请求',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
        onPressed: () => Navigator.of(context).pop(),
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
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: const FriendRequestContent(),
  );
}

class FriendRequestContent extends StatefulWidget {
  const FriendRequestContent({super.key});

  @override
  State<FriendRequestContent> createState() => _FriendRequestContentState();
}

class _FriendRequestContentState extends State<FriendRequestContent> {
  final Set<String> _processing = {};
  bool _showReceived = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final requests = dataModel.friendRequests ?? [];

        String? myMemberId;
        final lobbies = dataModel.privateLobbies;
        if (lobbies != null && lobbies.isNotEmpty) {
          for (final m in lobbies.first.members ?? []) {
            if (m.nickname == dataModel.currentUser?.handle) {
              myMemberId = m.id;
              break;
            }
          }
        }

        final received = requests.where((r) => r.targetMemberId == myMemberId).toList();
        final sent = requests.where((r) => r.requestingMemberId == myMemberId).toList();
        final displayList = _showReceived ? received : sent;

        return Container(
          height: 600,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 统计信息和过滤器
              Container(
                padding: const EdgeInsets.all(15),
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
                            Text('${received.length}',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const Text('收到', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('${sent.length}',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const Text('发出', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => setState(() => _showReceived = true),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _showReceived
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.3),
                            ),
                            child: const Text('收到的请求'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => setState(() => _showReceived = false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !_showReceived
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.3),
                            ),
                            child: const Text('发出的请求'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 请求列表
              Expanded(
                child: displayList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.people_outline, size: 50, color: Colors.grey),
                            Text(
                              _showReceived ? '暂无收到的请求' : '暂无发出的请求',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: displayList.length,
                        itemBuilder: (context, index) {
                          final request = displayList[index];
                          if (_showReceived) {
                            return _buildReceivedCard(request);
                          } else {
                            return _buildSentCard(request);
                          }
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReceivedCard(FriendRequest request) {
    final member = _getOtherMember(request);
    final isProcessing = _processing.contains(request.id);

    return _RequestCard(
      member: member,
      timeCreated: request.timeCreated,
      trailing: isProcessing
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => _accept(request.id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        foregroundColor: Colors.green[700],
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('接受', style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () => _decline(request.id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.2),
                        foregroundColor: Colors.red[700],
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        minimumSize: Size.zero,
                      ),
                      child: const Text('拒绝', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildSentCard(FriendRequest request) {
    final member = _getOtherMember(request);
    final isProcessing = _processing.contains(request.id);

    return _RequestCard(
      member: member,
      timeCreated: request.timeCreated,
      trailing: isProcessing
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('等待中',
                      style: TextStyle(fontSize: 11, color: Colors.orange[700], fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => _cancel(request.id),
                  child: Text('取消', style: TextStyle(fontSize: 11, color: Colors.grey[600], decoration: TextDecoration.underline)),
                ),
              ],
            ),
    );
  }

  Friend? _getOtherMember(FriendRequest request) {
    if (request.members == null || request.members!.isEmpty) return null;
    // members 中可能有两个人，找到不是自己的那个
    final handle = context.read<MainDataModel>().currentUser?.handle;
    for (final m in request.members!) {
      if (m.nickname != handle) return m;
    }
    return request.members!.first;
  }

  Future<void> _accept(String requestId) async {
    setState(() => _processing.add(requestId));
    final success = await RsiApiClient().acceptFriend(requestId);
    if (success && mounted) {
      final requests = context.read<MainDataModel>().friendRequests;
      requests?.removeWhere((r) => r.id == requestId);
      context.read<MainDataModel>().notifyListeners();
    }
    if (mounted) setState(() => _processing.remove(requestId));
  }

  Future<void> _cancel(String requestId) async {
    setState(() => _processing.add(requestId));
    final success = await RsiApiClient().cancelFriendRequest(requestId);
    if (success && mounted) {
      final requests = context.read<MainDataModel>().friendRequests;
      requests?.removeWhere((r) => r.id == requestId);
      context.read<MainDataModel>().notifyListeners();
    }
    if (mounted) setState(() => _processing.remove(requestId));
  }

  Future<void> _decline(String requestId) async {
    setState(() => _processing.add(requestId));
    final success = await RsiApiClient().declineFriendRequest(requestId);
    if (success && mounted) {
      final requests = context.read<MainDataModel>().friendRequests;
      requests?.removeWhere((r) => r.id == requestId);
      context.read<MainDataModel>().notifyListeners();
    }
    if (mounted) setState(() => _processing.remove(requestId));
  }
}

class _RequestCard extends StatelessWidget {
  final Friend? member;
  final int? timeCreated;
  final Widget trailing;

  const _RequestCard({required this.member, this.timeCreated, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final name = member?.displayname ?? '未知用户';
    final nickname = member?.nickname;
    final avatar = member?.avatar;
    final fullAvatar = avatar != null
        ? (avatar.startsWith('http') ? avatar : 'https://robertsspaceindustries.com$avatar')
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          AdvancedAvatar(
            name: name,
            size: 50,
            image: fullAvatar != null ? CachedNetworkImageProvider(fullAvatar) : null,
            decoration: const BoxDecoration(shape: BoxShape.circle),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                if (nickname != null && nickname != name)
                  Text('@$nickname', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                const SizedBox(height: 5),
                if (timeCreated != null)
                  Text('时间: ${_formatTime(timeCreated)}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
