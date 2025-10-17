import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import '../../network/cirno/cirno_api.dart';
import '../../datasource/models/cirno/account.dart';
import '../../funcs/toast.dart';
import '../../funcs/cirno_auth.dart';

/// 避难所账户详情页面
class RefugeAccountDetailPage extends StatefulWidget {
  const RefugeAccountDetailPage({Key? key}) : super(key: key);

  @override
  _RefugeAccountDetailPageState createState() =>
      _RefugeAccountDetailPageState();
}

class _RefugeAccountDetailPageState extends State<RefugeAccountDetailPage> {
  bool _isLoading = true;
  AccountInfoResponse? _accountInfo;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadAccountInfo();
  }

  /// 加载账户信息
  Future<void> _loadAccountInfo() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final accountInfo = await CirnoApiClient().getAccountInfo();
      if (mounted) {
        setState(() {
          _accountInfo = accountInfo;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
        showToast(message: "获取账户信息失败: ${e.toString()}");
      }
    }
  }

  /// 将 VIP 秒数转换为天数
  int _getVipDays(double totalVipSeconds) {
    return (totalVipSeconds / 86400).floor();
  }

  /// 格式化创建时间
  String _formatCreatedTime(String createdAt) {
    try {
      final dateTime = DateTime.parse(createdAt);
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return createdAt;
    }
  }

  /// 显示解绑设备确认对话框
  Future<void> _showUnbindConfirmDialog(
      String deviceUuid, bool isCurrentDevice) async {
    if (isCurrentDevice) {
      showToast(message: "无法解绑当前设备");
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认解绑'),
        content: Text('确定要解绑设备 ${deviceUuid.substring(0, 8)}... 吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _unbindDevice(deviceUuid);
    }
  }

  /// 解绑设备
  Future<void> _unbindDevice(String deviceUuid) async {
    try {
      await CirnoApiClient().unbindDevice(deviceUuid);
      showToast(message: "设备解绑成功");
      // 重新加载账户信息
      await _loadAccountInfo();
    } catch (e) {
      showToast(message: "解绑失败: ${e.toString()}");
    }
  }

  /// 显示登出确认对话框
  Future<void> _showLogoutConfirmDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认登出'),
        content: const Text('确定要登出避难所账号吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _logout();
    }
  }

  /// 登出
  Future<void> _logout() async {
    try {
      await CirnoApiClient().logout();
      showToast(message: "已登出");
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(message: "登出失败: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),
      appBar: AppBar(
        title: const Text('避难所账号详情'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        '加载失败',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _loadAccountInfo,
                        icon: const Icon(Icons.refresh),
                        label: const Text('重试'),
                      ),
                    ],
                  ),
                )
              : _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_accountInfo == null) {
      return const Center(child: Text('无账户信息'));
    }

    final vipDays = _getVipDays(_accountInfo!.totalVipSeconds);
    final currentDeviceUuid = CirnoAuth.instance?.uuid ?? '';

    return RefreshIndicator(
      onRefresh: _loadAccountInfo,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 账户基本信息
          SettingsGroup(
            settingsGroupTitle: "账户信息",
            items: [
              SettingsItem(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: _accountInfo!.email));
                  showToast(message: "已复制邮箱到剪贴板");
                },
                icons: Icons.email_outlined,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.blue,
                ),
                title: "邮箱",
                subtitle: _accountInfo!.email,
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.calendar_today_outlined,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.green,
                ),
                title: "注册时间",
                subtitle: _formatCreatedTime(_accountInfo!.createdAt),
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.workspace_premium_outlined,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.orange,
                ),
                title: "VIP 剩余",
                subtitle: "$vipDays 天",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.stars_outlined,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.purple,
                ),
                title: "积分",
                subtitle: "${_accountInfo!.totalCredit}",
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 设备管理
          SettingsGroup(
            settingsGroupTitle: "绑定设备 (${_accountInfo!.devices.length})",
            items: _accountInfo!.devices.map((device) {
              final isCurrentDevice = device.uuid == currentDeviceUuid;
              return SettingsItem(
                onTap: () {
                  _showUnbindConfirmDialog(device.uuid, isCurrentDevice);
                },
                icons: isCurrentDevice
                    ? Icons.phone_android
                    : Icons.devices_outlined,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: isCurrentDevice ? Colors.teal : Colors.grey,
                ),
                title: device.uuid.length > 16
                    ? "${device.uuid.substring(0, 8)}...${device.uuid.substring(device.uuid.length - 8)}"
                    : device.uuid,
                subtitle: isCurrentDevice ? "当前设备" : "点击解绑",
                trailing: isCurrentDevice
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.link_off, color: Colors.grey),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // 登出按钮
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: _showLogoutConfirmDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                '登出账号',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
