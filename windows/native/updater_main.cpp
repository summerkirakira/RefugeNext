#include <windows.h>
#include <bcrypt.h>
#include <shellapi.h>
#include "update_bundle.h"
#include "update_process.h"
#include "third_party/json.hpp"
#include <array>
#include <fstream>
#include <map>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

namespace fs = std::filesystem;
using Json = nlohmann::json;
using Handle = std::unique_ptr<void, decltype(&CloseHandle)>;
static std::wstring Wide(const std::string& value) {
  const int size = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, value.data(), static_cast<int>(value.size()), nullptr, 0);
  if (!size) throw std::runtime_error("Invalid UTF-8 path");
  std::wstring result(size, L'\0');
  MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, value.data(), static_cast<int>(value.size()), result.data(), size);
  return result;
}
static void WriteJson(const fs::path& path, const Json& value) {
  const fs::path temporary = path.wstring() + L".tmp";
  { std::ofstream output(temporary, std::ios::binary | std::ios::trunc);
    output << value.dump(); output.flush();
    if (!output) throw std::runtime_error("Cannot write update result"); }
  if (!MoveFileExW(temporary.c_str(), path.c_str(), MOVEFILE_REPLACE_EXISTING | MOVEFILE_WRITE_THROUGH))
    throw std::runtime_error("Cannot publish update result");
}
static std::string HashFile(const fs::path& path) {
  BCRYPT_ALG_HANDLE algorithm = nullptr;
  BCRYPT_HASH_HANDLE hash = nullptr;
  std::vector<BYTE> object;
  if (BCryptOpenAlgorithmProvider(&algorithm, BCRYPT_SHA256_ALGORITHM, nullptr, 0) != 0)
    throw std::runtime_error("SHA-256 unavailable");
  struct Cleanup {
    BCRYPT_ALG_HANDLE& algorithm; BCRYPT_HASH_HANDLE& hash;
    ~Cleanup() { if (hash) BCryptDestroyHash(hash); if (algorithm) BCryptCloseAlgorithmProvider(algorithm, 0); }
  } cleanup{algorithm, hash};
  DWORD length = 0, copied = 0;
  if (BCryptGetProperty(algorithm, BCRYPT_OBJECT_LENGTH, reinterpret_cast<PUCHAR>(&length), sizeof(length), &copied, 0) != 0)
    throw std::runtime_error("SHA-256 initialization failed");
  object.resize(length);
  if (BCryptCreateHash(algorithm, &hash, object.data(), length, nullptr, 0, 0) != 0)
    throw std::runtime_error("SHA-256 initialization failed");
  std::ifstream input(path, std::ios::binary);
  if (!input) throw std::runtime_error("Cannot read update bundle");
  std::array<char, 65536> bytes{};
  while (input) {
    input.read(bytes.data(), bytes.size());
    const auto count = input.gcount();
    if (count && BCryptHashData(hash, reinterpret_cast<PUCHAR>(bytes.data()), static_cast<ULONG>(count), 0) != 0)
      throw std::runtime_error("SHA-256 read failed");
  }
  if (!input.eof()) throw std::runtime_error("Cannot finish reading update bundle");
  std::array<BYTE, 32> digest{};
  if (BCryptFinishHash(hash, digest.data(), static_cast<ULONG>(digest.size()), 0) != 0)
    throw std::runtime_error("SHA-256 finalization failed");
  constexpr char hex[] = "0123456789abcdef";
  std::string result;
  for (const auto value : digest) { result += hex[value >> 4]; result += hex[value & 15]; }
  return result;
}
static std::wstring ProductVersion(const fs::path& exe) {
  DWORD ignored = 0;
  const auto size = GetFileVersionInfoSizeW(exe.c_str(), &ignored);
  if (!size) throw std::runtime_error("Executable version is missing");
  std::vector<BYTE> data(size);
  if (!GetFileVersionInfoW(exe.c_str(), 0, size, data.data())) throw std::runtime_error("Cannot read executable version");
  void* value = nullptr; UINT length = 0;
  if (!VerQueryValueW(data.data(), L"\\StringFileInfo\\040904e4\\ProductVersion", &value, &length) || !length)
    throw std::runtime_error("Executable version is missing");
  return static_cast<wchar_t*>(value);
}
static void CheckArchitecture(const fs::path& path) {
  std::ifstream file(path, std::ios::binary);
  IMAGE_DOS_HEADER dos{};
  file.read(reinterpret_cast<char*>(&dos), sizeof(dos));
  if (!file || dos.e_magic != IMAGE_DOS_SIGNATURE || dos.e_lfanew < 0)
    throw std::runtime_error("Invalid Windows executable");
  file.seekg(dos.e_lfanew);
  DWORD signature = 0; IMAGE_FILE_HEADER header{};
  file.read(reinterpret_cast<char*>(&signature), sizeof(signature));
  file.read(reinterpret_cast<char*>(&header), sizeof(header));
  if (!file || signature != IMAGE_NT_SIGNATURE || header.Machine != IMAGE_FILE_MACHINE_AMD64)
    throw std::runtime_error("Update executable is not x64");
}
static void CheckBundle(const Json& job, const refuge::update::BundlePaths& paths) {
  const auto zip = fs::path(Wide(job.at("zipPath").get<std::string>()));
  if (refuge::update::ReparsePoint(zip) ||
      fs::file_size(zip) != job.at("zipSize").get<uint64_t>() ||
      HashFile(zip) != job.at("zipSha256").get<std::string>())
    throw std::runtime_error("Update archive hash mismatch");
  const auto& files = job.at("files");
  if (!files.is_object() || files.empty() || files.size() > 10000)
    throw std::runtime_error("Invalid bundle file manifest");
  size_t found = 0;
  for (const auto& item : fs::recursive_directory_iterator(paths.staged)) {
    if (refuge::update::ReparsePoint(item.path())) throw std::runtime_error("Update bundle contains a link");
    if (!item.is_regular_file()) continue;
    const auto name = item.path().lexically_relative(paths.staged).generic_u8string();
    if (!files.contains(name) || HashFile(item.path()) != files.at(name).get<std::string>())
      throw std::runtime_error("Update bundle file hash mismatch");
    ++found;
  }
  if (found != files.size()) throw std::runtime_error("Update bundle is incomplete");
  for (const auto* required : {"refuge_next.exe", "refuge_updater.exe", "flutter_windows.dll", "sqlite3.dll", "data/icudtl.dat", "data/app.so"}) {
    if (!files.contains(required)) throw std::runtime_error("Required bundle file is missing");
  }
  CheckArchitecture(paths.staged / "refuge_next.exe");
  CheckArchitecture(paths.staged / "refuge_updater.exe");
  if (!fs::is_directory(paths.staged / "data/flutter_assets") ||
      ProductVersion(paths.staged / "refuge_next.exe") != Wide(job.at("version").get<std::string>()))
    throw std::runtime_error("Update bundle version mismatch");
}
static void Launch(const fs::path& executable) {
  refuge::update::LaunchAndConfirm(executable);
}
int WINAPI wWinMain(HINSTANCE, HINSTANCE, wchar_t*, int) {
  int argc = 0;
  wchar_t** argv = CommandLineToArgvW(GetCommandLineW(), &argc);
  if (!argv || argc != 2) { if (argv) LocalFree(argv); return 2; }
  const fs::path request = argv[1]; LocalFree(argv);
  fs::path transaction;
  bool parent_exited = false;
  bool restart_requested = false;
  bool new_app_started = false;
  fs::path installation;
  try {
    if (request.filename() != L"request.json" || refuge::update::ReparsePoint(request))
      throw std::runtime_error("Invalid update request");
    transaction = fs::canonical(request.parent_path());
    std::ifstream input(request, std::ios::binary);
    const auto job = Json::parse(input);
    if (job.at("schemaVersion") != 1 || fs::canonical(Wide(job.at("transactionPath").get<std::string>())) != transaction)
      throw std::runtime_error("Update transaction mismatch");
    const auto paths = refuge::update::ValidatePaths(Wide(job.at("installPath").get<std::string>()), Wide(job.at("stagedPath").get<std::string>()), transaction);
    installation = paths.install;
    const auto mutex_name = L"Local\\RefugeUpdater-" + std::to_wstring(std::hash<std::wstring>{}(paths.install.wstring()));
    Handle mutex(CreateMutexW(nullptr, TRUE, mutex_name.c_str()), CloseHandle);
    if (!mutex || GetLastError() == ERROR_ALREADY_EXISTS) throw std::runtime_error("Another update is running");
    const auto pid = job.at("parentPid").get<DWORD>();
    Handle parent(OpenProcess(SYNCHRONIZE | PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid), CloseHandle);
    if (!parent) throw std::runtime_error("Current app process is unavailable");
    std::wstring image(32768, L'\0'); DWORD image_size = static_cast<DWORD>(image.size());
    if (!QueryFullProcessImageNameW(parent.get(), 0, image.data(), &image_size)) throw std::runtime_error("Cannot identify current app");
    image.resize(image_size);
    if (!fs::equivalent(fs::path(image), paths.install / "refuge_next.exe")) throw std::runtime_error("Current app process does not match installation");
    CheckBundle(job, paths);
    if (fs::exists(transaction / "cancel")) {
      fs::remove_all(paths.staged);
      WriteJson(transaction / "result.json", {{"state", "cancelled"}});
      return 0;
    }
    // Require explicit commit by default; the Dart client sets requiresCommit.
    const bool requires_commit = job.value("requiresCommit", true);
    WriteJson(transaction / "ready.json", {{"state", "ready"}, {"requiresCommit", requires_commit}});
    const ULONGLONG deadline = GetTickCount64() + 60000;
    while (WaitForSingleObject(parent.get(), 250) != WAIT_OBJECT_0) {
      if (fs::exists(transaction / "cancel")) {
        fs::remove_all(paths.staged);
        WriteJson(transaction / "result.json", {{"state", "cancelled"}});
        return 0;
      }
      if (GetTickCount64() >= deadline) throw std::runtime_error("Current app did not exit; update was not applied");
    }
    parent_exited = true;
    restart_requested = !requires_commit || fs::exists(transaction / "commit");
    if (fs::exists(transaction / "cancel") ||
        !restart_requested) {
      fs::remove_all(paths.staged);
      WriteJson(transaction / "result.json", {{"state", "cancelled"}});
      // An uncommitted app exit is not a request to restart it.
      if (restart_requested) Launch(installation / "refuge_next.exe");
      return 0;
    }
    CheckBundle(job, paths);
    refuge::update::ReplaceBundle(paths, Launch);
    new_app_started = true;
    WriteJson(transaction / "result.json", {{"state", "installed"}, {"version", job.at("version")}});
    return 0;
  } catch (const std::exception& error) {
    if (!transaction.empty()) {
      try {
        const Json result{{"state", "failed"}, {"message", error.what()}};
        if (!fs::exists(transaction / "ready.json")) WriteJson(transaction / "ready.json", result);
        WriteJson(transaction / "result.json", result);
      } catch (...) {}
    }
    if (parent_exited && restart_requested && !new_app_started && fs::is_regular_file(installation / "refuge_next.exe")) {
      try { Launch(installation / "refuge_next.exe"); } catch (...) {}
    }
    return 1;
  }
}
