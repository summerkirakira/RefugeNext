import '../network/api_service.dart';
import '../datasource/models/user.dart';
import '../network/parsers/user_parser.dart';
import '../repo/user.dart';

class LoginStatus {
  final bool success;
  final String msg;
  final bool needCode = false;
  final bool needCaptcha = false;

  LoginStatus({
    required this.success,
    required this.msg,
    needCode,
    needCaptcha,
  });
}

Future<LoginStatus> loginFirstStep(String email, String password) async {

  final rsiClient = RsiApiClient();

  final loginResponse = await rsiClient.login(email: email, password: password);

  if (loginResponse.data == null) {
    return LoginStatus(success: false, msg: loginResponse.msg);
  }

  if (loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1) {
    final user = await parseNewUser(email, password, loginResponse.data!.device_id, loginResponse.data!.session_id);
    if (user == null) {
      return LoginStatus(success: false, msg: "Failed to parse user data");
    }
    final userRepo = UserRepo();
    await userRepo.addUser(user);
    return LoginStatus(success: true, msg: loginResponse.msg);
  } else {
    if (loginResponse.code == "ErrCaptchaRequiredLauncher") {
      return LoginStatus(success: false, msg: loginResponse.msg, needCaptcha: true);
    } else {
      return LoginStatus(success: false, msg: loginResponse.msg, needCode: true);
    }
  }
}

Future<LoginStatus> loginSecondStep(String email, String password, String code) async {
  final rsiClient = RsiApiClient();

  final loginResponse = await rsiClient.loginWithCode(code: code);

  if (loginResponse.data == null) {
    return LoginStatus(success: false, msg: loginResponse.msg);
  }

  if (loginResponse.data!.device_id != null) {
    rsiClient.setRSIDevice(device: loginResponse.data!.device_id!);
  }

  if (loginResponse.data!.session_id.isNotEmpty) {
    rsiClient.setRSIToken(token: loginResponse.data!.session_id);
  }

  if (loginResponse.success == 1) {
    final user = await parseNewUser(email, password, loginResponse.data!.device_id, loginResponse.data!.session_id);
    if (user == null) {
      return LoginStatus(success: false, msg: "Failed to parse user data");
    }
    final userRepo = UserRepo();
    await userRepo.addUser(user);
    return LoginStatus(success: true, msg: loginResponse.msg);
  } else {
    return LoginStatus(success: false, msg: loginResponse.msg);
  }
}