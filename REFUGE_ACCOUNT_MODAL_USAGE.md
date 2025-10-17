# 避难所账号登录/注册 Modal 使用指南

## 概述

已创建一个完整的避难所账号登录/注册 Modal 组件，位于 `lib/src/widgets/user_info/refuge_account_modal.dart`。

## 功能特性

### ✨ 核心功能
- **登录模式**: 邮箱 + 密码登录
- **注册模式**: 邮箱 + 密码 + 确认密码注册
- **Tab 切换**: 平滑切换登录/注册模式
- **自动设备绑定**: 登录成功后自动绑定当前设备
- **表单验证**: 邮箱格式、密码长度、密码确认等完整验证
- **错误处理**: 完善的网络错误和验证错误处理

### 🎨 UI 特性
- Material Design 风格
- 密码可见性切换（眼睛图标）
- 加载状态指示器
- 响应式布局
- 与现有项目风格完全一致（使用 wolt_modal_sheet）

## 使用方法

### 1. 基本使用

```dart
import 'package:refuge_next/src/widgets/user_info/refuge_account_modal.dart';

// 在任何地方调用以显示 Modal
showRefugeAccountModal(context);
```

### 2. 在按钮中使用

```dart
ElevatedButton(
  onPressed: () {
    showRefugeAccountModal(context);
  },
  child: Text('登录/注册避难所账号'),
)
```

### 3. 在菜单项中使用

```dart
ListTile(
  leading: Icon(Icons.account_circle),
  title: Text('避难所账号'),
  onTap: () {
    showRefugeAccountModal(context);
  },
)
```

### 4. 在用户信息页面使用

```dart
// 例如在用户页面的设置区域
Card(
  child: ListTile(
    leading: Icon(Icons.cloud),
    title: Text('避难所账号'),
    subtitle: Text('登录以同步数据'),
    trailing: Icon(Icons.arrow_forward_ios),
    onTap: () {
      showRefugeAccountModal(context);
    },
  ),
)
```

## 完整示例

### 集成到用户信息页面

```dart
import 'package:flutter/material.dart';
import 'package:refuge_next/src/widgets/user_info/refuge_account_modal.dart';
import 'package:refuge_next/src/repo/refuge_account.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isLoggedIn = false;
  String? _email;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final isLoggedIn = await RefugeAccountRepo().isLoggedIn();
    final email = await RefugeAccountRepo().getAccountEmail();

    setState(() {
      _isLoggedIn = isLoggedIn;
      _email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户中心')),
      body: ListView(
        children: [
          // 避难所账号卡片
          Card(
            margin: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(
                Icons.cloud_outlined,
                size: 40,
                color: _isLoggedIn ? Colors.green : Colors.grey,
              ),
              title: Text('避难所账号'),
              subtitle: Text(
                _isLoggedIn
                  ? '已登录: $_email'
                  : '登录以同步游戏日志和数据',
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (!_isLoggedIn) {
                  showRefugeAccountModal(context).then((_) {
                    // Modal 关闭后刷新登录状态
                    _checkLoginStatus();
                  });
                } else {
                  // 已登录，显示账号管理选项
                  _showAccountManagement();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAccountManagement() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('账号管理'),
        content: Text('邮箱: $_email'),
        actions: [
          TextButton(
            onPressed: () async {
              await CirnoApiClient().logout();
              Navigator.pop(context);
              _checkLoginStatus();
            },
            child: Text('登出'),
          ),
        ],
      ),
    );
  }
}
```

## 工作流程

### 注册流程
1. 用户点击「注册」Tab
2. 填写邮箱、密码、确认密码
3. 点击「注册」按钮
4. 验证表单（邮箱格式、密码长度、密码匹配）
5. 调用 `CirnoApiClient().registerAccount()`
6. 注册成功后自动切换到登录 Tab，并预填邮箱
7. 用户可以直接输入密码登录

### 登录流程
1. 用户点击「登录」Tab（默认）
2. 填写邮箱和密码
3. 点击「登录」按钮
4. 验证表单（邮箱格式、必填字段）
5. 调用 `CirnoApiClient().loginAccount()` - JWT 自动保存
6. 自动调用 `CirnoApiClient().bindDeviceToAccount()` 绑定设备
7. 显示成功消息并关闭 Modal

### 错误处理
- **邮箱格式错误**: "请输入有效的邮箱地址"
- **必填字段为空**: "请输入邮箱和密码" / "请填写所有字段"
- **密码过短**: "密码长度至少为 6 位"
- **密码不匹配**: "两次输入的密码不一致"
- **网络错误**: "登录失败: {错误信息}" / "注册失败: {错误信息}"

## 表单验证规则

### 邮箱验证
- 使用正则表达式: `^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$`
- 支持常见邮箱格式

### 密码验证
- 最小长度: 6 位
- 注册时需要确认密码匹配

## UI 组件说明

### Tab 切换
- 使用 `TabController` 管理两个 Tab
- 平滑动画过渡
- 当前选中的 Tab 使用主题色高亮

### 密码输入框
- 默认隐藏密码
- 点击眼睛图标切换显示/隐藏
- 支持登录密码、注册密码、确认密码三个独立的可见性状态

### 加载状态
- 提交表单时显示加载指示器
- 按钮变为禁用状态防止重复提交
- 加载完成后恢复正常状态

### 快速切换
- 登录页底部有「还没有账号？立即注册」链接
- 注册页底部有「已有账号？立即登录」链接
- 点击链接平滑切换到对应 Tab

## 与后端 API 集成

Modal 自动调用以下 API：

### 注册
```dart
await CirnoApiClient().registerAccount(
  email: email,
  password: password,
);
```

### 登录
```dart
await CirnoApiClient().loginAccount(
  email: email,
  password: password,
);
// JWT token 自动保存到本地
```

### 设备绑定
```dart
await CirnoApiClient().bindDeviceToAccount();
// 登录成功后自动调用
```

## 样式定制

如果需要自定义样式，可以修改以下部分：

### 修改主题色
Modal 使用 `Theme.of(context).primaryColor`，会自动跟随应用主题。

### 修改尺寸
```dart
Container(
  height: 550,  // 修改此值调整 Modal 高度
  padding: const EdgeInsets.all(20),
  // ...
)
```

### 修改圆角
```dart
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),  // 修改此值调整输入框圆角
),
```

## 注意事项

1. **依赖项**: 确保已添加 `wolt_modal_sheet` 依赖
2. **网络权限**: 确保应用有网络访问权限
3. **错误提示**: 使用 `showToast()` 显示错误，确保已导入 toast 功能
4. **状态刷新**: Modal 关闭后需要手动刷新父页面的登录状态
5. **设备绑定失败**: 如果设备绑定失败，不会影响登录（仅打印日志）

## 扩展功能

可以基于此 Modal 扩展以下功能：

1. **忘记密码**: 添加重置密码功能
2. **第三方登录**: 集成 Google、Apple 登录
3. **邮箱验证**: 添加邮箱验证码功能
4. **密码强度指示器**: 显示密码强度
5. **记住我**: 添加记住登录状态选项
6. **自动填充**: 从系统密码管理器自动填充

## 文件结构

```
lib/src/widgets/user_info/
└── refuge_account_modal.dart
    ├── showRefugeAccountModal()      // 显示 Modal 的便捷函数
    ├── getRefugeAccountPage()        // 创建 WoltModalSheetPage
    ├── RefugeAccountWidget           // 主 Widget
    └── _RefugeAccountWidgetState     // State 管理
        ├── _buildLoginForm()         // 登录表单
        ├── _buildRegisterForm()      // 注册表单
        ├── _handleLogin()            // 登录处理
        ├── _handleRegister()         // 注册处理
        └── _isValidEmail()           // 邮箱验证
```
