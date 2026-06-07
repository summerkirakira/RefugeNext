// 真连后端的预览入口：用真实 AiRepo / AiChatService。
// debug 模式下 AiChatService 自动指向 localhost:8080（见 kDebugAiBaseUrl）。
// 绕开登录主流程，仅初始化 cirno-token 供请求拦截器使用。
// 运行：flutter run -t lib/preview/ai_chat_dev.dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/datasource/ai_chat_model.dart';
import '../src/funcs/cirno_auth.dart';
import '../src/repo/refuge_account.dart';
import '../src/widgets/ai_chat/ai_chat_page.dart';

/// 测试服务器要求 Bearer JWT。把一个有效 token 粘到这里即可联调；
/// 留空则沿用本机已登录(真实 app 登录过)的 token。
const String kDevJwt = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化 CirnoAuth，使 CirnoApiClient 拦截器里的 CirnoAuth.instance!.uuid 可用。
  await CirnoAuth.getInstance();
  if (kDevJwt.isNotEmpty) {
    await RefugeAccountRepo().setJwtToken(kDevJwt);
  }
  runApp(const _DevApp());
}

class _DevApp extends StatefulWidget {
  const _DevApp();

  @override
  State<_DevApp> createState() => _DevAppState();
}

class _DevAppState extends State<_DevApp> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.material, useMaterial3: false).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.material, useMaterial3: false).toTheme,
      themeMode: _mode,
      home: ChangeNotifierProvider<AiChatModel>(
        // 默认 AiRepo() → 真实 AiChatService → debug 自动连 localhost:8080。
        create: (_) => AiChatModel(sessionId: 'dev')..loadFromDisk(),
        child: const AiChatPage(),
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
          Positioned(
            right: 12,
            bottom: 96,
            child: FloatingActionButton.small(
              heroTag: 'devThemeToggle',
              onPressed: () => setState(
                () => _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
              ),
              child: Icon(_mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
        ],
      ),
    );
  }
}
