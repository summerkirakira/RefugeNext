#if SWIFT_PACKAGE
import RefugeAppUpdate
#endif
import Foundation

guard CommandLine.arguments.count == 2 else {
  fputs("Usage: refuge_updater request.json\n", stderr)
  exit(2)
}
do {
  try MacUpdateRunner.run(URL(fileURLWithPath: CommandLine.arguments[1]))
} catch {
  fputs(("Mac update failed: " + error.localizedDescription + "\n"), stderr)
  exit(1)
}
