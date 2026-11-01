# Windows / macOS 应用内更新

支持 Windows x64 和 macOS ARM64 独立发行版。启动检查和设置中的“检查更新”共用当前更新弹窗。用户依次点击“下载更新”“重启并更新”；下载完成不会自动退出。首个包含更新器的版本需要手动安装一次。

## 清单与分发

公开地址为 `https://image.biaoju.site/starcitizen/app/{platform}/{architecture}/latest.json`，平台分别为 `windows/x64`、`macos/arm64`。404 表示尚未发布安装包。请求不携带用户账号令牌。Android 的 `/v2/version` 和资源配置不变。

清单格式：

```json
{
  "schemaVersion": 1,
  "platform": "windows",
  "architecture": "x64",
  "name": "4.6.3",
  "code": 443,
  "notes": "4.6.3更新：\n修复说明。\n\nby.妖精",
  "url": "https://image.biaoju.site/starcitizen/app/windows/x64/refuge-4.6.3-443-windows-x64.zip",
  "size": 123456,
  "sha256": "实际文件的64位SHA-256"
}
```

客户端按语义版本和构建号排序；同一平台的新包使用递增版本，不能更改已发布文件的内容。下载缓存由平台隔离，完整包重新校验后可复用；中断的部分下载重新开始，不支持进程退出后的后台下载或断点续传。

## 构建与发布

Windows 在构建机运行：

```powershell
.\scripts\build_windows_release.ps1 -Flutter C:\path\to\flutter.bat
```

输出为完整 Release ZIP，根目录直接包含 `refuge_next.exe`、`refuge_updater.exe`、依赖 DLL、`data/` 和 `refuge-release.json`，不加额外的 Release 文件夹。

Mac 在 Apple Silicon 构建机设置 `REFUGE_CODE_SIGN_IDENTITY` 为现有 Developer ID Application 证书的 SHA-1，然后运行：

```bash
bash scripts/build_macos_release.sh
```

可用 `REFUGE_FLUTTER` 指定 Flutter 可执行文件。构建脚本只生成产物，不退出或替换已安装 App。最低系统版本为 macOS 12。产物中的原生代码统一裁剪为 ARM64 后签名；保留当前 Bundle ID `vip.kirakira.Refuge-ios`。独立发行产物使用 `Standalone.entitlements`，原有开发配置保留沙盒。若配置了 `REFUGE_NOTARY_PROFILE`，额外执行公证与 stapler；没有配置时仅签名，不宣称通过公证或全新机器的 Gatekeeper 验证。

准备清单（不发布）：

```bash
python3 scripts/desktop_release.py PATH_TO_ZIP \
  --platform windows --notes-file notes.txt --output latest.preview.json
```

Mac 使用 `--platform macos` 并在 Mac 执行，以验证真实签名与架构。上线时在上述命令末尾添加 `--publish`。使用现有 SSH 账号 `ubuntu@biaoju.site`，不把密钥写入源码；可通过 `--ssh-host` 和 `--remote-root` 指定部署位置。

发布工具先校验 ZIP 与包内真实版本，再上传到临时文件。服务器在平台锁内校验版本递增、保持版本化文件不可变、读取公开下载地址核对完整哈希，最后原子替换 `latest.json`，保留上一份 `previous.json`。公网核验失败时不会切换清单。

服务器应对 `latest.json` 配置 `Cache-Control: no-cache`；客户端亦发送 no-cache 请求。版本化 ZIP 可以长期缓存。发布前需确认域名已有对应目录映射及可写权限；本次实现不自动修改服务器配置或激活线上清单。

## 安装与恢复

Windows 更新器在安装目录外运行，校验 ZIP、解压文件哈希、x64 PE 和实际 ProductVersion。应用保存待写入数据、关闭官网子窗口和托盘，写入 commit 后真正退出。更新器整目录替换，移除旧 DLL。新版窗口显示并持续运行两秒才确认成功；启动超时只停止本次启动的失败进程，恢复旧程序并重开。

Mac 更新器确认相同签名要求、Bundle ID、Info.plist 版本、ARM64 和完整签名，通过 `renameatx_np(RENAME_SWAP)` 交换 App。新版需写入首帧确认并存活两秒；失败恢复旧 App。旧沙盒数据采用可重入的复制迁移，目标已有数据不覆盖，原目录不删除。迁移失败停止业务初始化并显示原因。

两端安装目录及其父目录须可写；Mac 不支持磁盘映像、App Translocation 或只读安装位置。更新不申请管理员权限，退出超时不强杀旧应用。用户数据库和文档不会随程序回滚，后续涉及数据库迁移的版本必须保证旧版兼容。

事务记录位于平台 Application Support 的 `updates/{platform}/transactions/<id>`。Mac 根目录为 `~/Library/Application Support/vip.kirakira.Refuge-ios/updates/macos`。`request.json`、`ready.json`、`commit`、`result.json` 用于诊断；最近失败会显示在更新弹窗。旧程序备份保留在安装目录旁，确认正常使用后可手动清理；暂不自动删除历史备份。

## 验证

```bash
flutter test test/desktop_update_test.dart test/app_update_controller_test.dart test/app_update_sheet_test.dart
python3 -m unittest discover -s test -p desktop_release_test.py
# Mac
swift test --package-path macos/Packages/RefugeAppUpdate
python3 tools/test_macos_updater.py --repo "$PWD" --signed-app PATH_TO_SIGNED_APP --job NEW_TEST_DIRECTORY
```

Windows 的 `tools/test_windows_updater.ps1` 编译真实 Flutter Runner 的 A/B 版本并验证成功升级、启动崩溃恢复、文件篡改拒绝和未提交退出取消，数据库使用独立目录。fixture 产物不得交付用户；测试后用正常入口重新构建发布包。

移植参考：本地 CirnoTerminal 的 `windows/native/update_*`、`windows_update_installer.dart` 和 `macos/Packages/CirnoAppUpdate`。没有复制控制 worker、Gateway 客户端鉴权或自动跟随每次提交发版的机制。

Mac 进程验证覆盖正常升级、立即崩溃、未报告首帧、签名不符、x86_64 包和只读安装目录。发布包还应通过 `test/desktop_release_artifact_test.dart`，用环境变量 `REFUGE_DESKTOP_ZIP` 与 `REFUGE_DESKTOP_MANIFEST` 指定实际 ZIP 和预览清单。

### 正式界面验证（2026-11-01）

在 Mac 实机 `/Applications/星河避难所.app` 和 CirnoBuilder Windows 虚拟机中，使用正常 `lib/main.dart` 的 Release 构建完成了 `4.6.3+442 → 4.6.3+443` 更新。低版本包仅在独立构建副本中调整版本号和清单地址，临时清单与 ZIP 使用现有 HTTPS 静态文件服务；未替换正式 `latest.json`。目标包为此前校验的正式候选包。

通过真实界面依次点击“下载更新”“重启并更新”，确认下载后旧进程继续运行，第二次点击才退出并启动新版。Windows 事务记录为 `installed`，Mac 为 `succeeded`，两端安装后的主程序、Flutter 业务代码和更新器均与目标包一致；Mac 完整签名校验通过，更新前的 2 个数据文件和 7 个 Flutter 设置值保持一致。

两端本次均为未登录状态，未验证已登录账号的会话保留。Mac 首次运行时完成了文稿目录访问授权；此测试不代表从互联网下载后的 Gatekeeper／公证验收。测试结束后保留已升级的 443 版和旧包备份，删除临时服务端测试目录。
