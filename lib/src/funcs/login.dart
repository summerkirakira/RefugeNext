import '../network/api_service.dart';
import '../datasource/models/user.dart';
import '../network/parsers/user_parser.dart';
import '../repo/user.dart';
import 'dart:typed_data';
import './toast.dart';


class LoginStatus {
  final bool success;
  final String msg;
  bool needCode = false;
  bool needCaptcha = false;

  LoginStatus({
    required this.success,
    required this.msg,
    required this.needCode,
    required this.needCaptcha,
  });
}

Future<LoginStatus> loginFirstStep({required String email, required String password, String? captcha}) async {
  final rsiClient = RsiApiClient();

  if (email == "934869815@qq.com") {
    rsiClient.setRSIDevice(device: "rtscszhpn5alodol14uj4v8dnb");
  }

  final loginResponse = await rsiClient.login(email: email, password: password, captcha: captcha);

  if (loginResponse.code == "ErrWrongPassword_email") {
    showToast(message: "邮箱或密码错误");
    return LoginStatus(
        success: false,
        msg: loginResponse.msg,
        needCode: false,
        needCaptcha: false
    );
  }

  if (loginResponse.code == "ErrNoGamePackage") {
    showToast(message: "避难所暂不支持无游戏包账号登录QAQ");
    return LoginStatus(
        success: false,
        msg: loginResponse.msg,
        needCode: false,
        needCaptcha: false
    );
  }

  if (loginResponse.data == null) {
    showToast(message: "登录信息为空QAQ，错误代码: ${loginResponse.code}");
    return LoginStatus(
        success: false,
        msg: loginResponse.msg,
        needCode: false,
        needCaptcha: false
    );
  }

  if (loginResponse.code != "ErrNoGamePackage" && loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.code != "ErrNoGamePackage" && loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1 || loginResponse.code == "ErrNoGamePackage") {
    showToast(message: "登录成功, 正在获取用户信息...");
    final user = await parseNewUser(email, password,
        rsiClient.rsiDevice, rsiClient.rsiToken);
    if (user == null) {
      return LoginStatus(
          success: false,
          msg: "Failed to parse user data",
          needCode: false,
          needCaptcha: false);
    }
    final userRepo = UserRepo();
    await userRepo.addUser(user);
    return LoginStatus(
        success: true,
        msg: loginResponse.msg,
        needCode: false,
        needCaptcha: false);
  } else {
    if (loginResponse.code == "ErrCaptchaRequiredLauncher") {
      return LoginStatus(
          success: false,
          msg: loginResponse.msg,
          needCaptcha: true,
          needCode: false);
    } else if (loginResponse.code == "ErrMultiStepRequired") {
      return LoginStatus(
          success: false,
          msg: loginResponse.msg,
          needCode: true,
          needCaptcha: false);
    } else {
      return LoginStatus(
          success: false,
          msg: loginResponse.msg,
          needCode: false,
          needCaptcha: false);
    }
  }
}

Future<LoginStatus> loginSecondStep(
    String email, String password, String code) async {
  final rsiClient = RsiApiClient();

  final loginResponse = await rsiClient.loginWithCode(code: code);

  if (loginResponse.data == null && loginResponse.code != "ErrNoGamePackage") {
    return LoginStatus(success: false, msg: loginResponse.msg, needCode: false, needCaptcha: false);
  }

  if (loginResponse.code != "ErrNoGamePackage" && loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.code != "ErrNoGamePackage" && loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1 || loginResponse.code == "ErrNoGamePackage") {
    final user = await parseNewUser(email, password,
        rsiClient.rsiDevice, rsiClient.rsiToken);
    if (user == null) {
      return LoginStatus(success: false, msg: "Failed to parse user data", needCode: false, needCaptcha: false);
    }
    final userRepo = UserRepo();
    await userRepo.addUser(user);
    return LoginStatus(success: true, msg: loginResponse.msg, needCode: false, needCaptcha: false);
  } else {
    return LoginStatus(success: false, msg: loginResponse.msg, needCode: false, needCaptcha: false);
  }
}

Future<Uint8List?> getCaptchaImage() async {
  final rsiClient = RsiApiClient();
  final image = rsiClient.getCaptchaImage();
  return image;
}