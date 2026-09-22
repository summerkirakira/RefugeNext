import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datasource/data_model.dart';
import '../../funcs/login.dart';
import '../../repo/user.dart';

Future<bool?> openLoginPage(BuildContext context) {
  final model = context.read<MainDataModel>();
  return Navigator.of(context, rootNavigator: true).push<bool>(
    CupertinoPageRoute(
      builder: (_) => UserLoginPage(onSignedIn: () async {
        final user = await UserRepo().getCurrentUser();
        if (user == null) throw StateError('登录信息未保存');
        await model.updateCurrentUser(user, refreshInBackground: true);
      }),
    ),
  );
}

typedef LoginFirstStep = Future<LoginStatus> Function(
    {required String email, required String password, String? captcha});

enum _LoginStep { credentials, captcha, emailCode }

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({
    super.key,
    required this.onSignedIn,
    this.firstStep = loginFirstStep,
    this.secondStep = loginSecondStep,
    this.loadCaptcha = getCaptchaImage,
  });

  final Future<void> Function() onSignedIn;
  final LoginFirstStep firstStep;
  final Future<LoginStatus> Function(String, String, String) secondStep;
  final Future<Uint8List?> Function() loadCaptcha;

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _verification = TextEditingController();
  _LoginStep _step = _LoginStep.credentials;
  Uint8List? _captcha;
  bool _processing = false;
  bool _hidePassword = true;
  bool _authenticated = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _verification.dispose();
    super.dispose();
  }

  Future<void> _refreshCaptcha() async {
    if (_processing) return;
    setState(() {
      _processing = true;
      _error = null;
      _verification.clear();
    });
    try {
      final image = await widget.loadCaptcha();
      if (!mounted) return;
      setState(() {
        _captcha = image;
        if (image == null || image.isEmpty) _error = '验证码加载失败，请点击刷新';
      });
    } catch (_) {
      if (mounted) setState(() => _error = '验证码加载失败，请点击刷新');
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  Future<void> _submit() async {
    if (_processing || (!_authenticated && !_formKey.currentState!.validate())) {
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      _processing = true;
      _error = null;
    });
    try {
      // 验证码只能使用一次；账号切换失败后仅重试本地切换，不重复验证。
      if (_authenticated) {
        await _finishSignIn();
        return;
      }
      final status = _step == _LoginStep.emailCode
          ? await widget.secondStep(
              _email.text.trim(), _password.text, _verification.text.trim())
          : await widget.firstStep(
              email: _email.text.trim(),
              password: _password.text,
              captcha: _step == _LoginStep.captcha
                  ? _verification.text.trim()
                  : null,
            );
      if (!mounted) return;
      if (status.success) {
        _authenticated = true;
        await _finishSignIn();
      } else if (status.needCode) {
        setState(() {
          _step = _LoginStep.emailCode;
          _verification.clear();
        });
      } else if (status.needCaptcha) {
        setState(() {
          _step = _LoginStep.captcha;
          _verification.clear();
          _captcha = null;
        });
        final image = await widget.loadCaptcha();
        if (!mounted) return;
        setState(() {
          _captcha = image;
          if (image == null || image.isEmpty) _error = '验证码加载失败，请点击刷新';
        });
      } else {
        setState(() => _error = status.msg.isEmpty ? '登录未成功，请重试' : status.msg);
      }
    } catch (error, stack) {
      // 不记录异常正文/请求内容，避免将密码、验证码或 Cookie 写入日志。
      debugPrint('登录失败（${_authenticated ? '切换账号' : _step.name}）: '
          '${error.runtimeType}\n$stack');
      if (mounted) setState(() => _error = _loginErrorMessage(error));
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  Future<void> _finishSignIn() async {
    await widget.onSignedIn();
    if (!mounted) return;
    setState(() => _processing = false);
    Navigator.of(context).pop(true);
  }

  String _loginErrorMessage(Object error) {
    if (_authenticated) return '验证已通过，切换账号失败，请点击重试';
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return '连接官网失败，请检查网络后重试';
      }
      final status = error.response?.statusCode;
      if (status != null) return '官网请求失败（$status），请稍后重试';
    }
    if (error is FormatException || error is TypeError) {
      return '官网返回的数据无法解析，请稍后重试';
    }
    return '登录处理失败，请稍后重试';
  }

  InputDecoration _decoration(String label, IconData icon,
          {Widget? suffixIcon}) =>
      InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 21),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final credentials = _step == _LoginStep.credentials;
    final captcha = _step == _LoginStep.captcha;
    final title = credentials
        ? '登录 RSI 账号'
        : captcha
            ? '图片验证'
            : '邮箱验证';
    return PopScope(
      canPop: !_processing,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('登录'),
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: _processing ? null : () => Navigator.of(context).pop(),
            icon: const BackButtonIcon(),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: AutofillGroup(
                  onDisposeAction: AutofillContextAction.cancel,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                'assets/images/cirno_avatar.jpeg',
                                width: 72,
                                height: 72),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        if (!credentials) ...[
                          const SizedBox(height: 8),
                          Text(
                            captcha
                                ? '请输入图片中的验证码，继续登录。'
                                : '请输入发送至 ${_email.text.trim()} 的验证码。',
                            style: TextStyle(
                                color: colors.onSurfaceVariant, height: 1.5),
                          ),
                        ],
                        const SizedBox(height: 32),
                        if (credentials) ...[
                          TextFormField(
                            key: const ValueKey('login-email'),
                            controller: _email,
                            enabled: !_processing && !_authenticated,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.username],
                            autocorrect: false,
                            decoration: _decoration(
                                '邮箱', Icons.alternate_email_rounded),
                            validator: (value) =>
                                value == null || value.trim().isEmpty
                                    ? '请输入邮箱'
                                    : null,
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            key: const ValueKey('login-password'),
                            controller: _password,
                            enabled: !_processing && !_authenticated,
                            obscureText: _hidePassword,
                            autocorrect: false,
                            enableSuggestions: false,
                            autofillHints: const [AutofillHints.password],
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            decoration: _decoration(
                              '密码',
                              Icons.lock_outline_rounded,
                              suffixIcon: IconButton(
                                tooltip: _hidePassword ? '显示密码' : '隐藏密码',
                                onPressed: _processing
                                    ? null
                                    : () => setState(
                                        () => _hidePassword = !_hidePassword),
                                icon: Icon(_hidePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              ),
                            ),
                            validator: (value) =>
                                value == null || value.isEmpty ? '请输入密码' : null,
                          ),
                        ] else ...[
                          if (captcha) ...[
                            Container(
                              height: 130,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: colors.surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(14)),
                              child: _captcha == null || _captcha!.isEmpty
                                  ? const Text('验证码暂未加载')
                                  : Image.memory(_captcha!,
                                      fit: BoxFit.contain,
                                      errorBuilder: (_, __, ___) =>
                                          const Text('验证码无法显示，请刷新')),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: _processing ? null : _refreshCaptcha,
                                icon:
                                    const Icon(Icons.refresh_rounded, size: 18),
                                label: const Text('刷新验证码'),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          TextFormField(
                            key: ValueKey(_step),
                            controller: _verification,
                            enabled: !_processing && !_authenticated,
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            autofillHints: captcha
                                ? null
                                : const [AutofillHints.oneTimeCode],
                            onFieldSubmitted: (_) => _submit(),
                            decoration: _decoration(
                                '验证码', Icons.verified_user_outlined),
                            validator: (value) =>
                                value == null || value.trim().isEmpty
                                    ? '请输入验证码'
                                    : null,
                          ),
                        ],
                        if (_error != null) ...[
                          const SizedBox(height: 16),
                          Semantics(
                              liveRegion: true,
                              child: Text(_error!,
                                  style: TextStyle(color: colors.error))),
                        ],
                        const SizedBox(height: 28),
                        FilledButton(
                          style: FilledButton.styleFrom(
                              minimumSize: const Size.fromHeight(52),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          onPressed: _processing ? null : _submit,
                          child: _processing
                              ? const SizedBox.square(
                                  dimension: 22,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2))
                              : Text(_authenticated
                                  ? '重试进入应用'
                                  : credentials
                                      ? '登录'
                                      : '继续登录'),
                        ),
                        if (!credentials) ...[
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: _processing
                                ? null
                                : () => setState(() {
                                      _step = _LoginStep.credentials;
                                      _authenticated = false;
                                      _error = null;
                                      _verification.clear();
                                    }),
                            child: const Text('返回修改账号'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
