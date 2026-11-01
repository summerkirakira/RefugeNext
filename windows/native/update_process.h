#pragma once
#include <windows.h>
#include <filesystem>
#include <string>

namespace refuge::update {
// Success means the child has displayed its first window and remained alive.
DWORD LaunchAndConfirm(const std::filesystem::path& executable,
                       const std::wstring& arguments = L"",
                       DWORD startup_timeout_ms = 20000);
}  // namespace refuge::update
