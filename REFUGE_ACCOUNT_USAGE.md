# 避难所账号功能使用指南

## 概述

已为 CirnoAPI 添加了完整的避难所账号功能，包括：
- 账号注册/登录
- JWT token 自动持久化
- 设备绑定管理
- 游戏日志上传与查询
- 所有需要认证的请求自动携带 JWT

## 核心组件

### 1. 数据模型 (`lib/src/datasource/models/cirno/account.dart`)
- `AccountRegisterRequest` - 注册请求
- `AccountLoginRequest` - 登录请求
- `AccountLoginResponse` - 登录响应
- `AccountDeviceInfo` - 设备信息
- `AccountInfoResponse` - 账号信息
- `GameLogRequest` - 游戏日志请求
- `GameLogBatchRequest` - 批量日志请求
- `GameLogResult` - 日志上传结果

### 2. JWT 持久化仓库 (`lib/src/repo/refuge_account.dart`)
- 使用 SharedPreferences 持久化 JWT token
- 自动管理登录状态

### 3. CirnoAPI 增强 (`lib/src/network/cirno/cirno_api.dart`)
- 拦截器自动为所有请求添加 JWT（如果已登录）
- 提供完整的账号相关 API

## 使用示例

### 注册账号
```dart
try {
  await CirnoApiClient().registerAccount(
    email: 'user@example.com',
    password: 'your_password',
  );
  // 注册成功
} catch (e) {
  // 处理错误（邮箱已存在等）
}
```

### 登录账号
```dart
try {
  final response = await CirnoApiClient().loginAccount(
    email: 'user@example.com',
    password: 'your_password',
  );

  // JWT token 已自动保存到本地
  print('登录成功: ${response.email}');
  print('Access Token: ${response.accessToken}');
} catch (e) {
  // 处理登录失败
}
```

### 检查登录状态
```dart
final isLoggedIn = await RefugeAccountRepo().isLoggedIn();

if (isLoggedIn) {
  final email = await RefugeAccountRepo().getAccountEmail();
  print('已登录账号: $email');
}
```

### 绑定设备到账号
```dart
try {
  await CirnoApiClient().bindDeviceToAccount();
  // 当前设备已绑定到账号
} catch (e) {
  // 处理绑定失败（需要先登录）
}
```

### 获取账号信息
```dart
try {
  final accountInfo = await CirnoApiClient().getAccountInfo();

  print('邮箱: ${accountInfo.email}');
  print('VIP 时长: ${accountInfo.totalVipSeconds} 秒');
  print('积分: ${accountInfo.totalCredit}');
  print('绑定设备数: ${accountInfo.devices.length}');

  // 遍历绑定的设备
  for (final device in accountInfo.devices) {
    print('设备 UUID: ${device.uuid}');
  }
} catch (e) {
  // 处理错误（需要先登录）
}
```

### 解绑设备
```dart
try {
  await CirnoApiClient().unbindDevice('device-uuid-here');
  // 设备已解绑
} catch (e) {
  // 处理解绑失败
}
```

### 批量上传游戏日志
```dart
final logs = [
  GameLogRequest(
    logTime: '2025-01-17T10:30:00Z',
    gameAccountName: 'PlayerName',
    logType: 'combat',
    content: 'Combat log content',
  ),
  GameLogRequest(
    logTime: '2025-01-17T10:31:00Z',
    gameAccountName: 'PlayerName',
    logType: 'mission',
    content: 'Mission completed',
  ),
];

try {
  final result = await CirnoApiClient().addGameLogBatch(logs);

  print('总计: ${result.total}');
  print('插入: ${result.inserted}');
  print('重复: ${result.duplicated}');
} catch (e) {
  // 处理上传失败（需要先登录）
}
```

### 查询游戏日志
```dart
try {
  final response = await CirnoApiClient().queryGameLogs(
    logType: 'combat',
    startTime: '2025-01-01T00:00:00Z',
    endTime: '2025-01-31T23:59:59Z',
    page: 0,
    perPage: 20,
  );

  // response 是一个 Map，包含分页和日志数据
  print('查询结果: $response');
} catch (e) {
  // 处理查询失败（需要先登录）
}
```

### 登出
```dart
await CirnoApiClient().logout();
// JWT token 和邮箱信息已清除
```

## 自动 JWT 携带机制

所有需要认证的 API 请求会自动携带 JWT token，无需手动添加 Authorization header：

```dart
// CirnoAPI 拦截器自动处理
// 如果已登录，会自动添加: Authorization: Bearer {jwt_token}

// 示例：调用需要认证的 API
final accountInfo = await CirnoApiClient().getAccountInfo();
// ✓ JWT 已自动添加到请求头
```

## 完整使用流程示例

```dart
class RefugeAccountManager {
  final _api = CirnoApiClient();
  final _repo = RefugeAccountRepo();

  // 注册并登录
  Future<void> signUp(String email, String password) async {
    await _api.registerAccount(email: email, password: password);
    await _api.loginAccount(email: email, password: password);
    await _api.bindDeviceToAccount();
  }

  // 登录
  Future<void> signIn(String email, String password) async {
    await _api.loginAccount(email: email, password: password);
  }

  // 检查登录状态
  Future<bool> checkLoginStatus() async {
    return await _repo.isLoggedIn();
  }

  // 获取当前账号信息
  Future<AccountInfoResponse?> getCurrentAccount() async {
    if (await _repo.isLoggedIn()) {
      return await _api.getAccountInfo();
    }
    return null;
  }

  // 登出
  Future<void> signOut() async {
    await _api.logout();
  }
}
```

## 注意事项

1. **JWT 持久化**: JWT token 会自动保存到 SharedPreferences，应用重启后仍然有效
2. **自动认证**: 登录后的所有 API 请求会自动携带 JWT，无需手动处理
3. **错误处理**: 需要认证的 API 在未登录时会返回 401 错误，需要捕获处理
4. **设备绑定**: 一个账号可以绑定多个设备，使用 `unbindDevice` 解绑不需要的设备
5. **日志去重**: 游戏日志上传时会自动去重，重复的日志不会被重复插入

## API 端点映射

| 功能 | 端点 | 方法 | 需要 JWT |
|------|------|------|---------|
| 注册账号 | `/account/register` | POST | ✗ |
| 登录账号 | `/account/login` | POST | ✗ |
| 绑定设备 | `/account/bind` | POST | ✓ |
| 获取账号信息 | `/account/info` | GET | ✓ |
| 解绑设备 | `/account/unbind/{uuid}` | DELETE | ✓ |
| 添加游戏日志 | `/gamelog/add` | POST | ✓ |
| 查询游戏日志 | `/gamelog/query` | GET | ✓ |
