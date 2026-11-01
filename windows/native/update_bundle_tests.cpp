#include "update_bundle.h"
#include <chrono>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#ifdef _WIN32
#include <windows.h>
#endif
namespace fs = std::filesystem;
using refuge::update::ValidatePaths;
using refuge::update::ReplaceBundle;
static void Check(bool value, const char* message) {
  if (!value) throw std::runtime_error(message);
}
static void Put(const fs::path& path, const std::string& value) {
  fs::create_directories(path.parent_path());
  std::ofstream(path, std::ios::binary) << value;
}
static std::string Read(const fs::path& path) {
  std::ifstream input(path, std::ios::binary);
  return {std::istreambuf_iterator<char>(input), std::istreambuf_iterator<char>()};
}
struct Fixture {
  fs::path root, install, staged, transaction;
  Fixture() {
    const auto stamp = std::chrono::steady_clock::now().time_since_epoch().count();
#ifdef _WIN32
    root = fs::temp_directory_path() / (L"Cirno-更新-" + std::to_wstring(stamp));
#else
    root = fs::temp_directory_path() / ("cirno-update-" + std::to_string(stamp));
#endif
    install = root / "app";
    transaction = root / "cache/0123456789abcdef0123456789abcdef";
    staged = root / ".app-update-0123456789abcdef0123456789abcdef";
    fs::create_directories(transaction);
    Put(install / "refuge_next.exe", "old");
    Put(install / "obsolete.dll", "old-only");
    Put(staged / "refuge_next.exe", "new");
    Put(staged / "new.dll", "new-only");
    Put(root / "userdata/database.sqlite", "user-data");
  }
  ~Fixture() { std::error_code ignored; fs::remove_all(root, ignored); }
};
int main() {
  try {
    {
      Fixture f;
      const auto paths = ValidatePaths(f.install, f.staged, f.transaction);
      bool launched = false;
      ReplaceBundle(paths, [&](const fs::path& exe) {
        Check(fs::equivalent(exe, f.install / "refuge_next.exe"), "Launch path changed");
        Check(Read(exe) == "new", "New executable not installed");
        launched = true;
      });
      Check(launched, "App was not relaunched");
      Check(!fs::exists(f.install / "obsolete.dll"), "Obsolete DLL retained");
      Check(Read(paths.backup / "refuge_next.exe") == "old", "Old bundle not preserved");
      Check(Read(f.root / "userdata/database.sqlite") == "user-data", "User data changed");
    }
    {
      Fixture f;
      const auto paths = ValidatePaths(f.install, f.staged, f.transaction);
      bool failed = false;
      try { ReplaceBundle(paths, [](const fs::path&) { throw std::runtime_error("Launch denied"); }); }
      catch (const std::exception&) { failed = true; }
      Check(failed && Read(f.install / "refuge_next.exe") == "old", "Launch failure did not restore original bundle");
      Check(fs::exists(f.install / "obsolete.dll") && !fs::exists(paths.backup), "Rollback was incomplete");
    }
    {
      Fixture f;
      const auto foreign = f.root / "elsewhere/staged";
      fs::create_directories(foreign);
      bool rejected = false;
      try { ValidatePaths(f.install, foreign, f.transaction); }
      catch (const std::exception&) { rejected = true; }
      Check(rejected, "Unrelated staging directory accepted");
    }
    {
      Fixture f;
      const auto paths = ValidatePaths(f.install, f.staged, f.transaction);
      Put(paths.backup / "protected.txt", "previous");
      bool rejected = false;
      try { ReplaceBundle(paths, [](const fs::path&) {}); }
      catch (const std::exception&) { rejected = true; }
      Check(rejected && Read(paths.backup / "protected.txt") == "previous", "Existing backup overwritten");
    }
    {
      Fixture f;
      const auto linked = f.root / "linked";
      fs::create_directory_symlink(f.install, linked);
      bool rejected = false;
      try { ValidatePaths(linked, f.staged, f.transaction); }
      catch (const std::exception&) { rejected = true; }
      Check(rejected, "Linked installation accepted");
    }
#ifdef _WIN32
    {
      Fixture f;
      const auto paths = ValidatePaths(f.install, f.staged, f.transaction);
      HANDLE lock = CreateFileW(f.install.c_str(), FILE_LIST_DIRECTORY, FILE_SHARE_READ | FILE_SHARE_WRITE,
                                nullptr, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, nullptr);
      Check(lock != INVALID_HANDLE_VALUE, "Cannot create lock fixture");
      bool rejected = false;
      try { ReplaceBundle(paths, [](const fs::path&) {}); }
      catch (const std::exception&) { rejected = true; }
      CloseHandle(lock);
      Check(rejected && Read(f.install / "refuge_next.exe") == "old", "Locked installation was modified");
    }
#endif
    std::cout << "PASS: bundle replacement, stale DLL removal, rollback, path isolation, links, user data" << std::endl;
    return 0;
  } catch (const std::exception& error) {
    std::cerr << "FAIL: " << error.what() << std::endl;
    return 1;
  }
}
