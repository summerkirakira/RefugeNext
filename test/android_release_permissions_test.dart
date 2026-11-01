import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'release app owns network and installer permissions independently of plugins',
      () {
    final manifest =
        File('android/app/src/main/AndroidManifest.xml').readAsStringSync();
    for (final permission in [
      'INTERNET',
      'ACCESS_NETWORK_STATE',
      'REQUEST_INSTALL_PACKAGES'
    ]) {
      expect(
          manifest,
          matches(RegExp(
              '<uses-permission\\s+android:name="android\\.permission\\.$permission"\\s*/>')),
          reason:
              '$permission must be in the main manifest, not only debug or a transitive plugin');
    }
  });
}
