import '../network/api_service.dart';
import '../repo/user.dart';
import '../services/rsi_session_service.dart';
import '../services/rsi_web_session.dart';
import 'login.dart';

final rsiWebSession = RsiWebSessionCoordinator(
  session: RsiSessionService.instance,
  synchronize: synchronizeRsiWebSession,
  identify: () => RsiApiClient().sessionIdentity(),
  refreshCsrf: () => RsiApiClient().refreshCsrfToken(),
  authorize: () => RsiApiClient().setAuthToken(),
  relogin: () async {
    final session = RsiSessionService.instance;
    final expected = session.generation;
    final handle = session.account;
    if (handle == null) return false;
    final user = await UserRepo().getUser(handle: handle);
    session.assertGeneration(expected);
    if (user == null) return false;
    final result =
        await loginFirstStep(email: user.email, password: user.password);
    return result.success && session.account == handle;
  },
);

Future<void> synchronizeRsiWebSession({bool verifyIdentity = false}) =>
    RsiSessionService.instance.synchronizeFromWeb(
      (cookies) => RsiApiClient().sessionIdentity(cookies: cookies),
      verifyIdentity: verifyIdentity,
    );
