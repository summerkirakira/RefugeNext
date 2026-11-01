#include "update_bundle.h"
#include <algorithm>
#include <cwctype>
#include <stdexcept>
#include <string>
#ifdef _WIN32
#include <windows.h>
#endif

namespace refuge::update {
bool ReparsePoint(const fs::path& path) {
  if (fs::is_symlink(fs::symlink_status(path))) return true;
#ifdef _WIN32
  const DWORD attrs = GetFileAttributesW(path.c_str());
  return attrs != INVALID_FILE_ATTRIBUTES &&
         (attrs & FILE_ATTRIBUTE_REPARSE_POINT) != 0;
#else
  return false;
#endif
}
static void NoLinks(const fs::path& path) {
  for (fs::path current = path; !current.empty();) {
    if (ReparsePoint(current)) throw std::runtime_error("Update path contains a link");
    const auto parent = current.parent_path();
    if (parent == current) break;
    current = parent;
  }
}
static bool Inside(const fs::path& path, const fs::path& root) {
  auto a = path.begin(), b = root.begin();
  for (; b != root.end(); ++a, ++b) {
    if (a == path.end()) return false;
    auto part = a->wstring(), expected = b->wstring();
#ifdef _WIN32
    std::transform(part.begin(), part.end(), part.begin(), ::towlower);
    std::transform(expected.begin(), expected.end(), expected.begin(), ::towlower);
#endif
    if (part != expected) return false;
  }
  return true;
}
BundlePaths ValidatePaths(const fs::path& install, const fs::path& staged,
                          const fs::path& transaction) {
  for (const auto& path : {install, staged, transaction}) {
    if (!path.is_absolute() || !fs::is_directory(path))
      throw std::runtime_error("Update directory is missing");
    NoLinks(path);
  }
  BundlePaths result{fs::canonical(install), fs::canonical(staged),
                     fs::canonical(transaction), {}};
  const auto id = result.transaction.filename().string();
  if (id.size() != 32 || id.find_first_not_of("0123456789abcdef") != std::string::npos)
    throw std::runtime_error("Invalid update transaction");
  const auto prefix = L"." + result.install.filename().wstring() + L"-update-";
  if (result.install == result.install.root_path() ||
      result.staged.parent_path() != result.install.parent_path() ||
      result.staged.filename().wstring() != prefix + result.transaction.filename().wstring() ||
      Inside(result.transaction, result.install) ||
      Inside(result.transaction, result.staged) ||
      Inside(result.install, result.transaction))
    throw std::runtime_error("Invalid installation or staging path");
  result.backup = result.install.parent_path() /
      (L"." + result.install.filename().wstring() + L"-previous-" + result.transaction.filename().wstring());
  if (fs::exists(result.backup)) throw std::runtime_error("Backup directory already exists");
  if (!fs::is_regular_file(result.install / "refuge_next.exe"))
    throw std::runtime_error("Current app executable is missing");
  return result;
}
void ReplaceBundle(const BundlePaths& paths,
                   const std::function<void(const fs::path&)>& launch) {
  // Recheck after the parent exits: no recursive copy into a live DLL bundle.
  const auto validated = ValidatePaths(paths.install, paths.staged, paths.transaction);
  fs::rename(validated.install, validated.backup);
  bool installed = false;
  try {
    fs::rename(validated.staged, validated.install);
    installed = true;
    launch(validated.install / "refuge_next.exe");
  } catch (...) {
    // The launch callback only succeeds after a stable first window. Restore
    // the program bundle on startup failure; user data is never moved here.
    if (installed) fs::rename(validated.install, validated.staged);
    fs::rename(validated.backup, validated.install);
    throw;
  }
}
}  // namespace refuge::update
