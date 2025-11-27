import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../network/api_service.dart';
import '../../../datasource/models/friend.dart';

WoltModalSheetPage getAddFriendBottomSheet(BuildContext context) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    isTopBarLayerAlwaysVisible: true,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text('添加好友',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    ),
    trailingNavBarWidget: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        icon: const Icon(Icons.close),
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

  Future<void> _search() async {
    if (_searchController.text.isEmpty) return;
    
    // Remove focus from text field to dismiss keyboard
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _searchResults = [];
    });

    try {
      final results = await RsiApiClient().searchMember(_searchController.text);
      if (mounted) {
        setState(() {
          _searchResults = results;
        });
      }
    } catch (e) {
      // Handle error silently or show toast
      print('Search error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: '输入玩家名称',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => _search(),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _isLoading ? null : _search,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 48),
                ),
                child: _isLoading 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('搜索'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_searchResults.isEmpty && !_isLoading)
             const Padding(
               padding: EdgeInsets.only(top: 20.0),
               child: Center(child: Text('搜索玩家以添加好友', style: TextStyle(color: Colors.grey))),
             ),
          
          if (_searchResults.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _searchResults.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final friend = _searchResults[index];
                // 处理头像URL，加上base url
                String? avatarUrl = friend.avatar;
                if (avatarUrl != null && !avatarUrl.startsWith('http')) {
                  avatarUrl = "https://robertsspaceindustries.com$avatarUrl";
                }

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: AdvancedAvatar(
                    name: friend.displayname,
                    size: 40,
                    image: avatarUrl != null ? CachedNetworkImageProvider(avatarUrl) : null,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                  ),
                  title: Text(friend.nickname.isNotEmpty ? friend.nickname : friend.displayname),
                  subtitle: Text(friend.displayname),
                  trailing: IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () async {
                      // 可以添加一个状态来禁用按钮，防止重复点击，并在请求完成后恢复
                      // setState(() { _isAddingFriend = true; }); // 示例加载状态
                      final success = await RsiApiClient().addFriend(friend.id);
                      if (success) {
                        // 可以在此处进一步处理，例如：更新UI，禁用该条目的添加按钮等
                        // 例如：可以在成功后刷新好友列表或者更新UI状态
                      }
                      // setState(() { _isAddingFriend = false; }); // 示例加载状态
                    },
                  ),
                );
              },
            ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
