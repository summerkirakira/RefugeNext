import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/funcs/validation.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('debug authentication succeeds without a native authentication plugin',
      () async {
    expect(kDebugMode, isTrue);
    expect(await authenticateWithBiometrics(reason: '调试验证'), isTrue);
  });
}
