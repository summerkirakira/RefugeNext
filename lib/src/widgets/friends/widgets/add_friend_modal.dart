import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../network/api_service.dart';
import '../../../datasource/models/friend.dart';

WoltModalSheetPage getAddFriendBottomSheet(BuildContext context) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('添加好友',
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
    child: const AddFriendContent(),
  );
}

class AddFriendContent extends StatefulWidget {
  const AddFriendContent({super.key});

  @override
  State<AddFriendContent> createState() => _AddFriendContentState();
}

class _AddFriendContentState extends State<AddFriendContent> {
  final TextEditingController _searchController = TextEditingController();
  List<Friend> _searchResults = [];
  bool _isLoading = false;
  final Set<String> _addingIds = {};

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _searchResults = [];
    });

    try {
      final results = await RsiApiClient().searchMember(_searchController.text);
      if (mounted) {
        setState(() => _searchResults = results);
      }
    } catch (e) {
      print('Search error: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _addFriend(Friend friend) async {
    setState(() => _addingIds.add(friend.id));
    await RsiApiClient().addFriend(friend.id);
    if (mounted) setState(() => _addingIds.remove(friend.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: '输入玩家名称',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => _search(),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _isLoading ? null : _search,
                style: ElevatedButton.styleFrom(minimumSize: const Size(80, 48)),
                child: _isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('搜索'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_search, size: 50, color: Colors.grey),
                            SizedBox(height: 12),
                            Text('搜索玩家以添加好友', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final friend = _searchResults[index];
                          return _buildUserCard(friend);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(Friend friend) {
    String? avatarUrl = friend.avatar;
    if (avatarUrl != null && !avatarUrl.startsWith('http')) {
      avatarUrl = 'https://robertsspaceindustries.com$avatarUrl';
    }
    final isAdding = _addingIds.contains(friend.id);

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
            name: friend.displayname,
            size: 50,
            image: avatarUrl != null ? CachedNetworkImageProvider(avatarUrl) : null,
            decoration: const BoxDecoration(shape: BoxShape.circle),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(friend.displayname,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                if (friend.nickname.isNotEmpty && friend.nickname != friend.displayname)
                  Text('@${friend.nickname}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
          isAdding
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : IconButton(
                  onPressed: () => _addFriend(friend),
                  icon: const Icon(Icons.person_add),
                ),
        ],
      ),
    );
  }
}
