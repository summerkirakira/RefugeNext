import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../network/cirno/cirno_api.dart';
import '../../funcs/toast.dart';

/// 显示避难所账号登录/注册 Modal
void showRefugeAccountModal(BuildContext context) {
  WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (modalSheetContext) {
      return [
        getRefugeAccountPage(modalSheetContext, context),
      ];
    },
  );
}

/// 获取避难所账号页面
WoltModalSheetPage getRefugeAccountPage(
  BuildContext modalSheetContext,
  BuildContext mainContext,
) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    navBarHeight: 60,
    pageTitle: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '避难所账号',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
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
    child: RefugeAccountWidget(),
  );
}

/// 避难所账号 Widget
class RefugeAccountWidget extends StatefulWidget {
  @override
  _RefugeAccountWidgetState createState() => _RefugeAccountWidgetState();
}

class _RefugeAccountWidgetState extends State<RefugeAccountWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 登录表单
  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  bool _loginPasswordVisible = false;
  bool _isLoginLoading = false;

  // 注册表单
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _registerConfirmPasswordController = TextEditingController();
  bool _registerPasswordVisible = false;
  bool _registerConfirmPasswordVisible = false;
  bool _isRegisterLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _registerConfirmPasswordController.dispose();
    super.dispose();
  }

  /// 验证邮箱格式
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  /// 登录处理
  Future<void> _handleLogin() async {
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text;

    // 验证
    if (email.isEmpty || password.isEmpty) {
      showToast(message: "请输入邮箱和密码");
      return;
    }

    if (!_isValidEmail(email)) {
      showToast(message: "请输入有效的邮箱地址");
      return;
    }

    setState(() {
      _isLoginLoading = true;
    });

    try {
      // 调用登录 API
      await CirnoApiClient().loginAccount(
        email: email,
        password: password,
      );

      // 绑定设备到账号
      try {
        await CirnoApiClient().bindDeviceToAccount();
      } catch (e) {
        // 绑定失败不影响登录
        print('绑定设备失败: $e');
      }

      showToast(message: "登录成功！");

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      showToast(message: "登录失败: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() {
          _isLoginLoading = false;
        });
      }
    }
  }

  /// 注册处理
  Future<void> _handleRegister() async {
    final email = _registerEmailController.text.trim();
    final password = _registerPasswordController.text;
    final confirmPassword = _registerConfirmPasswordController.text;

    // 验证
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showToast(message: "请填写所有字段");
      return;
    }

    if (!_isValidEmail(email)) {
      showToast(message: "请输入有效的邮箱地址");
      return;
    }

    if (password.length < 6) {
      showToast(message: "密码长度至少为 6 位");
      return;
    }

    if (password != confirmPassword) {
      showToast(message: "两次输入的密码不一致");
      return;
    }

    setState(() {
      _isRegisterLoading = true;
    });

    try {
      // 调用注册 API
      await CirnoApiClient().registerAccount(
        email: email,
        password: password,
      );

      showToast(message: "注册成功！请登录");

      // 切换到登录页面并填入邮箱
      _loginEmailController.text = email;
      _tabController.animateTo(0);

      // 清空注册表单
      _registerEmailController.clear();
      _registerPasswordController.clear();
      _registerConfirmPasswordController.clear();
    } catch (e) {
      showToast(message: "注册失败: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() {
          _isRegisterLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Tab 切换
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: '登录'),
                Tab(text: '注册'),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Tab 内容
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 登录表单
                _buildLoginForm(),

                // 注册表单
                _buildRegisterForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建登录表单
  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '登录到您的避难所账号',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),

          // 邮箱输入框
          TextField(
            controller: _loginEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: '邮箱',
              hintText: '请输入邮箱',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 15),

          // 密码输入框
          TextField(
            controller: _loginPasswordController,
            obscureText: !_loginPasswordVisible,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '请输入密码',
              prefixIcon: Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _loginPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _loginPasswordVisible = !_loginPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 25),

          // 登录按钮
          ElevatedButton(
            onPressed: _isLoginLoading ? null : _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: _isLoginLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    '登录',
                    style: TextStyle(fontSize: 16),
                  ),
          ),

          SizedBox(height: 15),

          // 切换到注册
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('还没有账号？'),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(1);
                },
                child: Text('立即注册'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 构建注册表单
  Widget _buildRegisterForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '创建您的避难所账号',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),

          // 邮箱输入框
          TextField(
            controller: _registerEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: '邮箱',
              hintText: '请输入邮箱',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 15),

          // 密码输入框
          TextField(
            controller: _registerPasswordController,
            obscureText: !_registerPasswordVisible,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '至少 6 位',
              prefixIcon: Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _registerPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _registerPasswordVisible = !_registerPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 15),

          // 确认密码输入框
          TextField(
            controller: _registerConfirmPasswordController,
            obscureText: !_registerConfirmPasswordVisible,
            decoration: InputDecoration(
              labelText: '确认密码',
              hintText: '请再次输入密码',
              prefixIcon: Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _registerConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _registerConfirmPasswordVisible =
                        !_registerConfirmPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 25),

          // 注册按钮
          ElevatedButton(
            onPressed: _isRegisterLoading ? null : _handleRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: _isRegisterLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    '注册',
                    style: TextStyle(fontSize: 16),
                  ),
          ),

          SizedBox(height: 15),

          // 切换到登录
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('已有账号？'),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(0);
                },
                child: Text('立即登录'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
