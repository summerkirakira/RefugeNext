import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../../datasource/data_model.dart';
import '../../../datasource/models/spectrum/friend_request.dart';
import '../../../datasource/models/friend.dart';
import '../../../network/api_service.dart';
import '../../../funcs/toast.dart';

WoltModalSheetPage getFriendRequestBottomSheet(BuildContext context) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    isTopBarLayerAlwaysVisible: true,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('好友请求',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    trailingNavBarWidget: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        icon: const Icon(Icons.close),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final requests = dataModel.friendRequests ?? [];
        if (requests.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.person_outline, size: 48, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('暂无好友请求', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
          );
        }

        // 用当前用户的 friends 列表中自己的 id 来区分收到/发出
        // 从 lobby members 中找自己的 member_id
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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (received.isNotEmpty) ...[
                const Text('收到的请求', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 8),
                ...received.map((r) => _buildReceivedCard(r)),
                const SizedBox(height: 16),
              ],
              if (sent.isNotEmpty) ...[
                const Text('发出的请求', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 8),
                ...sent.map((r) => _buildSentCard(r)),
              ],
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReceivedCard(FriendRequest request) {
    final member = request.members?.isNotEmpty == true ? request.members!.first : null;
    final isProcessing = _processing.contains(request.id);

    return _RequestCard(
      member: member,
      trailing: isProcessing
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => _accept(request.id),
                  child: const Text('接受'),
                ),
                TextButton(
                  onPressed: () => _decline(request.id),
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: const Text('拒绝'),
                ),
              ],
            ),
    );
  }

  Widget _buildSentCard(FriendRequest request) {
    final member = request.members?.isNotEmpty == true ? request.members!.first : null;
    final isProcessing = _processing.contains(request.id);
    return _RequestCard(
      member: member,
      trailing: isProcessing
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
          : TextButton(
              onPressed: () => _cancel(request.id),
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              child: const Text('取消'),
            ),
    );
  }

  Future<void> _accept(String requestId) async {
    setState(() => _processing.add(requestId));
    final success = await RsiApiClient().acceptFriend(requestId);
    if (success && mounted) {
      // 从本地列表中移除，WS 会推送好友列表更新
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
  final Widget trailing;

  const _RequestCard({required this.member, required this.trailing});

  @override
  Widget build(BuildContext context) {
    final name = member?.displayname ?? '未知用户';
    final nickname = member?.nickname;
    final avatar = member?.avatar ??
        'https://cdn.robertsspaceindustries.com/static/images/account/avatar_default_big.jpg';
    final fullAvatar = avatar.startsWith('http') ? avatar : 'https://robertsspaceindustries.com$avatar';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: CachedNetworkImageProvider(fullAvatar),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (nickname != null)
                  Text('@$nickname', style: TextStyle(fontSize: 12, color: Colors.grey.withOpacity(0.7))),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
