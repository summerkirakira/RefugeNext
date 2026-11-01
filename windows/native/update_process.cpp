#include "update_process.h"
#include <memory>
#include <stdexcept>

namespace refuge::update {
namespace {
struct WindowSearch { DWORD pid; bool found = false; };
BOOL CALLBACK FindWindow(HWND window, LPARAM parameter) {
  auto& search = *reinterpret_cast<WindowSearch*>(parameter);
  DWORD pid = 0;
  GetWindowThreadProcessId(window, &pid);
  if (pid == search.pid && IsWindowVisible(window) && !GetWindow(window, GW_OWNER)) {
    search.found = true;
    return FALSE;
  }
  return TRUE;
}
}  // namespace
DWORD LaunchAndConfirm(const std::filesystem::path& executable,
                       const std::wstring& arguments, DWORD startup_timeout_ms) {
  std::wstring command = L"\"" + executable.wstring() + L"\" " + arguments;
  STARTUPINFOW startup{sizeof(startup)}; PROCESS_INFORMATION process{};
  if (!CreateProcessW(executable.c_str(), command.data(), nullptr, nullptr, FALSE,
                      0, nullptr, executable.parent_path().c_str(), &startup, &process))
    throw std::runtime_error("Cannot launch updated app");
  CloseHandle(process.hThread);
  std::unique_ptr<void, decltype(&CloseHandle)> child(process.hProcess, CloseHandle);
  const auto deadline = GetTickCount64() + startup_timeout_ms;
  ULONGLONG visible_since = 0;
  while (GetTickCount64() < deadline) {
    if (WaitForSingleObject(child.get(), 100) == WAIT_OBJECT_0) {
      DWORD code = 0; GetExitCodeProcess(child.get(), &code);
      throw std::runtime_error("Updated app exited during startup (code " + std::to_string(code) + ")");
    }
    WindowSearch search{process.dwProcessId};
    EnumWindows(FindWindow, reinterpret_cast<LPARAM>(&search));
    if (!search.found) { visible_since = 0; continue; }
    const auto now = GetTickCount64();
    if (!visible_since) visible_since = now;
    if (now - visible_since >= 2000 && WaitForSingleObject(child.get(), 0) == WAIT_TIMEOUT)
      return process.dwProcessId;
  }
  // Stop only the child we just launched, releasing its executable and DLLs
  // before ReplaceBundle restores the previous program directory.
  if (WaitForSingleObject(child.get(), 0) != WAIT_OBJECT_0 &&
      (!TerminateProcess(child.get(), ERROR_TIMEOUT) ||
       WaitForSingleObject(child.get(), 5000) != WAIT_OBJECT_0))
    throw std::runtime_error("Cannot stop updated app after startup timeout");
  throw std::runtime_error("Updated app did not display its first window");
}
}  // namespace refuge::update
