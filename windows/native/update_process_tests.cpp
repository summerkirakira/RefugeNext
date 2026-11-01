#include "update_process.h"
#include <iostream>
#include <stdexcept>

static void Check(bool condition, const char* message) {
  if (!condition) throw std::runtime_error(message);
}
static int Child(const std::string& mode) {
  if (mode == "--exit") return 7;
  if (mode == "--no-window") { Sleep(30000); return 0; }
  WNDCLASSW wc{};
  wc.lpfnWndProc = DefWindowProcW;
  wc.hInstance = GetModuleHandleW(nullptr);
  wc.lpszClassName = L"RefugeUpdaterTestWindow";
  RegisterClassW(&wc);
  HWND window = CreateWindowW(wc.lpszClassName, L"Cirno updater test",
      WS_OVERLAPPEDWINDOW, 10, 10, 320, 120, nullptr, nullptr, wc.hInstance, nullptr);
  if (!window) return 8;
  ShowWindow(window, SW_SHOW);
  const auto deadline = GetTickCount64() + (mode == "--window-exit" ? 700 : 10000);
  MSG msg{};
  while (GetTickCount64() < deadline) {
    while (PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE)) {
      TranslateMessage(&msg); DispatchMessageW(&msg);
    }
    Sleep(10);
  }
  return mode == "--window-exit" ? 7 : 0;
}
int main(int argc, char** argv) {
  if (argc == 2) return Child(argv[1]);
  try {
    wchar_t image[32768]{};
    Check(GetModuleFileNameW(nullptr, image, 32768) != 0, "Cannot locate test executable");
    const std::filesystem::path executable(image);
    for (const auto* mode : {L"--exit", L"--window-exit", L"--no-window"}) {
      bool rejected = false;
      try {
        const auto pid = refuge::update::LaunchAndConfirm(executable, mode, 3000);
        // A regression must not leave a fixture behind.
        HANDLE child = OpenProcess(PROCESS_TERMINATE | SYNCHRONIZE, FALSE, pid);
        if (child) { TerminateProcess(child, 9); WaitForSingleObject(child, 5000); CloseHandle(child); }
      } catch (const std::exception&) { rejected = true; }
      Check(rejected, "Updater accepted a child that failed to start its window");
    }
    const auto pid = refuge::update::LaunchAndConfirm(executable, L"--window", 5000);
    HANDLE child = OpenProcess(PROCESS_TERMINATE | SYNCHRONIZE, FALSE, pid);
    Check(child != nullptr && WaitForSingleObject(child, 0) == WAIT_TIMEOUT,
          "Confirmed app is not running");
    TerminateProcess(child, 0); WaitForSingleObject(child, 5000); CloseHandle(child);
    std::cout << "PASS: immediate exit, exit after first frame, startup timeout, stable window\n";
    return 0;
  } catch (const std::exception& error) {
    std::cerr << "FAIL: " << error.what() << '\n';
    return 1;
  }
}
