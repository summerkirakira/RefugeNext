/// Owners of in-flight user data register a flush hook. Updates may exit only
/// after all hooks complete; a failure leaves the application running.
class UpdateShutdown {
  static final _hooks = <Future<void> Function()>{};
  static void register(Future<void> Function() hook) => _hooks.add(hook);
  static void unregister(Future<void> Function() hook) => _hooks.remove(hook);
  static Future<void> flush() =>
      Future.wait(_hooks.toList().map((f) => f())).then((_) {});
}
