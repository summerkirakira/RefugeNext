import '../network/api_service.dart';
import '../datasource/models/user.dart';
import '../network/parsers/user_parser.dart';
import '../repo/user.dart';
import 'dart:typed_data';


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

  final loginResponse = await rsiClient.login(email: email, password: password, captcha: captcha);

  if (loginResponse.data == null) {
    return LoginStatus(
        success: false,
        msg: loginResponse.msg,
        needCode: false,
        needCaptcha: false);
  }

  if (loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1) {
    final user = await parseNewUser(email, password,
        loginResponse.data!.device_id, loginResponse.data!.session_id);
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

  if (loginResponse.data == null) {
    return LoginStatus(success: false, msg: loginResponse.msg, needCode: false, needCaptcha: false);
  }

  if (loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1) {
    final user = await parseNewUser(email, password,
        loginResponse.data!.device_id, loginResponse.data!.session_id);
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