[CmdletBinding()]
param(
  [string]$Flutter = 'flutter.bat',
  [string]$VersionName = '4.6.3',
  [long]$BuildNumber = 443,
  [string]$OutputDirectory
)
$ErrorActionPreference = 'Stop'
if (Get-Process refuge_next -ErrorAction SilentlyContinue) {
  throw 'Exit RefugeNext before testing its single-instance restart protocol.'
}
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
if (!$OutputDirectory) { $OutputDirectory = Join-Path $repo 'build/windows-update-validation' }
$root = [IO.Path]::GetFullPath($OutputDirectory)
if (Test-Path $root) { throw 'Use a new output directory for each updater verification.' }
New-Item -ItemType Directory $root | Out-Null
$configPath = Join-Path $root 'current.json'
$oldBuild = $BuildNumber - 1
$newBuild = $BuildNumber
function Write-Json($Path, $Value) {
  [IO.File]::WriteAllText($Path, ($Value | ConvertTo-Json -Depth 15), [Text.UTF8Encoding]::new($false))
}
function Assert($Condition, $Message) { if (!$Condition) { throw $Message } }
function Wait-Until([scriptblock]$Condition, [string]$Message) {
  $deadline = [DateTime]::UtcNow.AddSeconds(90)
  do {
    try { if (& $Condition) { return } } catch { }
    Start-Sleep -Milliseconds 100
  } while ([DateTime]::UtcNow -lt $deadline)
  throw $Message
}
function Stop-Fixture($PidValue, $Install) {
  $process = Get-Process -Id $PidValue -ErrorAction SilentlyContinue
  if ($process -and $process.Path -eq (Join-Path $Install 'refuge_next.exe')) {
    Stop-Process -Id $PidValue
    $process.WaitForExit(10000) | Out-Null
  }
}
Push-Location $repo
try {
  foreach ($entry in @(@{ name = 'A'; number = $oldBuild }, @{ name = 'B'; number = $newBuild })) {
    # PowerShell 5 wraps native stderr as errors, including CMake warnings.
    $previousPreference = $ErrorActionPreference
    try {
      $ErrorActionPreference = 'Continue'
      & $Flutter build windows --release --no-pub --target=tools/windows_update_fixture.dart `
        "--build-name=$VersionName" "--build-number=$($entry.number)" `
        "--dart-define=REFUGE_WINDOWS_UPDATE_FIXTURE=$($configPath.Replace('\', '/'))"
      $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $previousPreference }
    if ($code -ne 0) { throw "Fixture $($entry.name) build failed" }
    Copy-Item 'build/windows/x64/runner/Release' (Join-Path $root $entry.name) -Recurse
  }
  $zip = Join-Path $root 'fixture-windows.zip'
  Compress-Archive -Path (Join-Path $root 'B/*') -DestinationPath $zip
  $release = @{
    platform = 'windows'; architecture = 'x64'; name = $VersionName; code = $newBuild
    notes = 'Isolated update verification'; url = 'https://example.test/update.zip'
    size = (Get-Item $zip).Length; sha256 = (Get-FileHash $zip -Algorithm SHA256).Hash.ToLowerInvariant()
  }
  $results = @()
  $modes = @('normal', 'startup-crash', 'tampered', 'uncommitted')
  foreach ($mode in $modes) {
    $case = Join-Path $root "更新-$mode"
    $install = Join-Path $case '应用'
    $support = Join-Path $case '用户数据'
    New-Item -ItemType Directory $support -Force | Out-Null
    Copy-Item (Join-Path $root 'A') $install -Recurse
    [IO.File]::WriteAllText((Join-Path $install 'obsolete.dll'), 'old-only')
    [IO.File]::WriteAllText((Join-Path $support 'layout.json'), '{"width":1280,"route":"today"}')
    $before = (Get-FileHash (Join-Path $install 'refuge_next.exe') -Algorithm SHA256).Hash
    Write-Json $configPath @{
      supportPath = $support; zipPath = $zip; release = $release; mode = $mode
      failBuild = $(if ($mode -eq 'startup-crash') { $newBuild } else { 0 })
    }
    $parent = Start-Process -FilePath (Join-Path $install 'refuge_next.exe') -WorkingDirectory $install -PassThru
    $updated = $null; $restored = $null
    try {
      $pointer = Join-Path $support 'updates/windows/last-transaction.json'
      Wait-Until { Test-Path $pointer } "${mode}: updater did not prepare"
      $id = (Get-Content $pointer -Raw -Encoding UTF8 | ConvertFrom-Json).id
      $transaction = Join-Path $support "updates/windows/transactions/$id"
      $resultPath = Join-Path $transaction 'result.json'
      Wait-Until { Test-Path $resultPath } "${mode}: updater did not finish"
      $result = Get-Content $resultPath -Raw -Encoding UTF8 | ConvertFrom-Json
      $newMarker = Join-Path $support "started-$newBuild.json"
      $oldMarker = Join-Path $support "started-$oldBuild.json"
      if ($mode -eq 'normal') {
        Assert ($result.state -eq 'installed') "${mode}: installation failed: $($result.message)"
        Wait-Until { Test-Path $newMarker } "${mode}: new version did not start"
        $updated = Get-Content $newMarker -Raw -Encoding UTF8 | ConvertFrom-Json
        Assert $parent.HasExited "${mode}: old process is still running"
        Assert ($updated -and (Get-Process -Id $updated.pid -ErrorAction SilentlyContinue)) "${mode}: new process is not running"
        Assert ($updated.buildNumber -eq $newBuild) "${mode}: wrong build restarted"
        Assert (!(Test-Path (Join-Path $install 'obsolete.dll'))) "${mode}: old DLL was retained"
        Assert ($updated.databaseValue -eq '更新后保留的用户数据') "${mode}: database value changed"
        Assert ($updated.layout -eq '{"width":1280,"route":"today"}') "${mode}: layout changed"
      } elseif ($mode -eq 'startup-crash') {
        if (Test-Path $newMarker) { $updated = Get-Content $newMarker -Raw -Encoding UTF8 | ConvertFrom-Json }
        Assert ($result.state -eq 'failed') 'Startup failure was reported as success'
        Wait-Until { (Get-Content $oldMarker -Raw -Encoding UTF8 | ConvertFrom-Json).pid -ne $parent.Id } 'Old version was not restarted'
        $restored = Get-Content $oldMarker -Raw -Encoding UTF8 | ConvertFrom-Json
        Assert (Get-Process -Id $restored.pid -ErrorAction SilentlyContinue) 'Restored version is not running'
        Assert ($restored.databaseValue -eq '更新后保留的用户数据') 'Rollback changed database data'
      } elseif ($mode -eq 'tampered') {
        Assert ($result.state -eq 'failed') 'Tampered staged file was accepted'
        Assert (!$parent.HasExited) 'Validation failure closed the running app'
        Assert (!(Test-Path (Join-Path $transaction 'commit'))) 'Validation failure committed the update'
      } else {
        Assert ($result.state -eq 'cancelled') 'Uncommitted exit applied the update'
        Assert $parent.HasExited 'The uncommitted fixture did not exit'
        Assert (!(Test-Path $newMarker)) 'Uncommitted exit launched the new version'
      }
      if ($mode -ne 'normal') {
        Assert ((Get-FileHash (Join-Path $install 'refuge_next.exe') -Algorithm SHA256).Hash -eq $before) "${mode}: original app changed"
        Assert (Test-Path (Join-Path $install 'obsolete.dll')) "${mode}: original DLL was lost"
      }
      $results += @{ mode = $mode; state = $result.state; oldPid = $parent.Id; newProcess = $updated; restoredProcess = $restored; message = $result.message }
      Write-Host "PASS: $mode ($($result.state))"
    } finally {
      Stop-Fixture $parent.Id $install
      foreach ($marker in @("started-$oldBuild.json", "started-$newBuild.json")) {
        $path = Join-Path $support $marker
        if (Test-Path $path) { Stop-Fixture (Get-Content $path -Raw -Encoding UTF8 | ConvertFrom-Json).pid $install }
      }
    }
  }
  Write-Json (Join-Path $root 'results.json') @{ version = $VersionName; oldBuild = $oldBuild; newBuild = $newBuild; results = $results }
} finally {
  Pop-Location
}
# These builds intentionally use a fixture entry point. Build the normal main
# entry point again before delivering a Release package.
