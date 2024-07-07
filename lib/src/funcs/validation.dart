import 'package:local_auth/local_auth.dart';


Future<bool> isBiometricsAvailable() async {
  final localAuth = LocalAuthentication();
  return await localAuth.canCheckBiometrics;
}


Future<bool> authenticateWithBiometrics({required String reason}) async {
  final localAuth = LocalAuthentication();
  return await localAuth.authenticate(
    localizedReason: reason,
  );
}