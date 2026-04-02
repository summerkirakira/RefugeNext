import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../datasource/models/spectrum/private_lobby.dart';
import '../../../datasource/models/spectrum/spectrum_message.dart';
import '../../../datasource/models/friend.dart';
import '../../../datasource/data_model.dart';
import '../../../network/api_service.dart';
import '../../../services/spectrum_ws_service.dart';
import 'package:provider/provider.dart';

// ---------------------------------------------------------------------------
// ChatThemeData — 集中管理聊天界面样式，方便主题切换
// ---------------------------------------------------------------------------

class ChatThemeData {
  final Color myBubbleColor;
  final Color otherBubbleColor;
  final Color myTextColor;
  final Color otherTextColor;
  final Color timeTextColor;
  final Color inputBarColor;
  final Color backgroundColor;
  final double bubbleRadius;

  const ChatThemeData({
    required this.myBubbleColor,
    required this.otherBubbleColor,
    required this.myTextColor,
    required this.otherTextColor,
    required this.timeTextColor,
    required this.inputBarColor,
    required this.backgroundColor,
    this.bubbleRadius = 12,
  });

  factory ChatThemeData.fromContext(BuildContext context) {
    final theme = Theme.of(context);
    return ChatThemeData(
      myBubbleColor: theme.colorScheme.primary,
      otherBubbleColor: theme.colorScheme.surfaceContainerHighest,
      myTextColor: theme.colorScheme.onPrimary,
      otherTextColor: theme.colorScheme.onSurface,
      timeTextColor: theme.colorScheme.onSurface.withOpacity(0.4),
      inputBarColor: theme.colorScheme.surfaceContainerLow,
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}

// ---------------------------------------------------------------------------
// ChatDetailPage
// ---------------------------------------------------------------------------

class ChatDetailPage extends StatefulWidget {
  final PrivateLobby lobby;
  final String currentUserHandle;

  const ChatDetailPage({
    super.key,
    required this.lobby,
    required this.currentUserHandle,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<SpectrumMessage> _messages = [];
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  StreamSubscription<Map<String, dynamic>>? _wsSub;

  bool _loading = true;
  bool _loadingMore = false;
  bool _hasMore = true;
  String? _currentMemberId;

  Friend? get _otherMember {
    if (widget.lobby.members == null) return null;
    for (final m in widget.lobby.members!) {
      if (m.nickname != widget.currentUserHandle) return m;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _resolveCurrentMemberId();
    _loadMessages();
    _subscribeToWs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainDataModel>().activeChatLobbyId = widget.lobby.id;
    });
  }

  void _resolveCurrentMemberId() {
    if (widget.lobby.members == null) return;
    for (final m in widget.lobby.members!) {
      if (m.nickname == widget.currentUserHandle) {
        _currentMemberId = m.id;
        break;
      }
    }
  }

  Future<void> _loadMessages() async {
    setState(() => _loading = true);
    try {
      final history = await RsiApiClient().getMessageHistory(lobbyId: widget.lobby.id);
      setState(() {
        _messages.addAll(history);
        _hasMore = history.length >= 50;
        _loading = false;
      });
      _scrollToBottom();
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  Future<void> _loadMoreMessages() async {
    if (_loadingMore || !_hasMore || _messages.isEmpty) return;
    setState(() => _loadingMore = true);
    try {
      final oldestId = _messages.first.id;
      final older = await RsiApiClient().getMessageHistory(
        lobbyId: widget.lobby.id,
        messageId: oldestId,
      );
      setState(() {
        _messages.insertAll(0, older);
        _hasMore = older.length >= 50;
        _loadingMore = false;
      });
    } catch (e) {
      setState(() => _loadingMore = false);
    }
  }

  void _subscribeToWs() {
    _wsSub = SpectrumWsService().eventStream.listen((event) {
      if (event['type'] == 'message.new') {
        final msgData = event['message'];
        if (msgData == null) return;
        try {
          final msg = SpectrumMessage.fromJson(msgData);
          if (msg.lobbyId == widget.lobby.id) {
            setState(() => _messages.add(msg));
            _scrollToBottom();
          }
        } catch (_) {}
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    _inputController.clear();
    await RsiApiClient().sendMessage(lobbyId: widget.lobby.id, plaintext: text);
  }

  @override
  void dispose() {
    context.read<MainDataModel>().activeChatLobbyId = null;
    _wsSub?.cancel();
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatTheme = ChatThemeData.fromContext(context);
    final other = _otherMember;
    final otherName = other?.displayname ?? '私聊';

    return Scaffold(
      backgroundColor: chatTheme.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(otherName),
            if (other?.nickname != null) ...[
              const SizedBox(width: 6),
              Text(
                '@${other!.nickname}',
                style: TextStyle(fontSize: 13, color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.5)),
              ),
            ],
            if (other?.presence != null) ...[
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _presenceColor(other!.presence!.status),
                ),
              ),
            ],
          ],
        ),
      ),
      body: Column(
        children: [
          // 消息列表
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels <= 50 && !_loadingMore && _hasMore) {
                        _loadMoreMessages();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      itemCount: _messages.length + (_loadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_loadingMore && index == 0) {
                          return const Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
                          );
                        }
                        final msgIndex = _loadingMore ? index - 1 : index;
                        final msg = _messages[msgIndex];
                        final isMe = msg.memberId == _currentMemberId;

                        // 日期分割线
                        Widget? separator;
                        if (msgIndex == 0) {
                          separator = _TimeSeparator(timestamp: msg.timeCreated, chatTheme: chatTheme);
                        } else {
                          final prev = _messages[msgIndex - 1];
                          final diff = (msg.timeCreated ?? 0) - (prev.timeCreated ?? 0);
                          if (diff >= 300) {
                            separator = _TimeSeparator(timestamp: msg.timeCreated, chatTheme: chatTheme);
                          }
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (separator != null) separator,
                            _MessageBubble(
                              message: msg,
                              isMe: isMe,
                              chatTheme: chatTheme,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ),

          // 输入栏
          Container(
            color: chatTheme.inputBarColor,
            padding: EdgeInsets.only(
              left: 12,
              right: 4,
              top: 8,
              bottom: MediaQuery.of(context).padding.bottom + 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: '输入消息...',
                      filled: true,
                      fillColor: chatTheme.backgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      isDense: true,
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send, color: chatTheme.myBubbleColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Color _presenceColor(String status) {
    switch (status) {
      case 'online':
        return Colors.green;
      case 'away':
        return Colors.amber;
      case 'do_not_disturb':
        return Colors.red;
      case 'playing':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

// ---------------------------------------------------------------------------
// _TimeSeparator — 日期分割线
// ---------------------------------------------------------------------------

class _TimeSeparator extends StatelessWidget {
  final int? timestamp;
  final ChatThemeData chatTheme;

  const _TimeSeparator({required this.timestamp, required this.chatTheme});

  @override
  Widget build(BuildContext context) {
    final label = _formatSeparatorTime(timestamp);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Divider(color: chatTheme.timeTextColor.withOpacity(0.3), thickness: 0.5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(label, style: TextStyle(color: chatTheme.timeTextColor, fontSize: 11)),
          ),
          Expanded(child: Divider(color: chatTheme.timeTextColor.withOpacity(0.3), thickness: 0.5)),
        ],
      ),
    );
  }

  static String _formatSeparatorTime(int? ts) {
    if (ts == null) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final msgDay = DateTime(dt.year, dt.month, dt.day);
    final time = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    if (msgDay == today) {
      return time;
    } else if (msgDay == yesterday) {
      return '昨天 $time';
    } else {
      return '${dt.month}月${dt.day}日 $time';
    }
  }
}

// ---------------------------------------------------------------------------
// _MessageBubble — 单条消息气泡
// ---------------------------------------------------------------------------

class _MessageBubble extends StatelessWidget {
  final SpectrumMessage message;
  final bool isMe;
  final ChatThemeData chatTheme;

  const _MessageBubble({
    required this.message,
    required this.isMe,
    required this.chatTheme,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = message.member?.avatar ??
        'https://cdn.robertsspaceindustries.com/static/images/account/avatar_default_big.jpg';
    final text = message.displayText;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(avatar),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isMe ? chatTheme.myBubbleColor : chatTheme.otherBubbleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(chatTheme.bubbleRadius),
                      topRight: Radius.circular(chatTheme.bubbleRadius),
                      bottomLeft: Radius.circular(isMe ? chatTheme.bubbleRadius : 4),
                      bottomRight: Radius.circular(isMe ? 4 : chatTheme.bubbleRadius),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isMe ? chatTheme.myTextColor : chatTheme.otherTextColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(avatar),
            ),
          ],
        ],
      ),
    );
  }

}
