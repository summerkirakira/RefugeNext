#pragma once
#include <filesystem>
#include <functional>

namespace refuge::update {
namespace fs = std::filesystem;
struct BundlePaths {
  fs::path install;
  fs::path staged;
  fs::path transaction;
  fs::path backup;
};
bool ReparsePoint(const fs::path& path);
BundlePaths ValidatePaths(const fs::path& install, const fs::path& staged,
                          const fs::path& transaction);
// The launcher throws only if process creation failed, before any new app runs.
void ReplaceBundle(const BundlePaths& paths,
                   const std::function<void(const fs::path&)>& launch);
}  // namespace refuge::update
