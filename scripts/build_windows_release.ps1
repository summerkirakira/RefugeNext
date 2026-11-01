[CmdletBinding()]
param([string]$Flutter = 'flutter.bat', [string]$OutputDirectory = 'build/desktop-dist')
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
Push-Location $repo
try {
  $version = [regex]::Match((Get-Content pubspec.yaml -Raw), '(?m)^version:\s*(\d+\.\d+\.\d+)\+(\d+)\s*$')
  if (!$version.Success) { throw 'Invalid pubspec version' }
  $name = $version.Groups[1].Value; $code = [int]$version.Groups[2].Value
  $previousPreference = $ErrorActionPreference
  try {
    $ErrorActionPreference = 'Continue'
    & $Flutter build windows --release "--build-name=$name" "--build-number=$code"
    $buildExit = $LASTEXITCODE
  } finally { $ErrorActionPreference = $previousPreference }
  if ($buildExit -ne 0) { throw 'Windows build failed' }
  $bundle = 'build/windows/x64/runner/Release'
  $actual = (Get-Item "$bundle/refuge_next.exe").VersionInfo.ProductVersion
  if ($actual -ne "$name+$code") { throw "Executable version mismatch: $actual" }
  if (!(Test-Path "$bundle/refuge_updater.exe")) { throw 'Missing detached updater' }
  $meta = @{product='refuge_next'; platform='windows'; architecture='x64'; version=$name; buildNumber=$code}
  [IO.File]::WriteAllText((Join-Path $repo "$bundle/refuge-release.json"), ($meta | ConvertTo-Json), [Text.UTF8Encoding]::new($false))
  New-Item -ItemType Directory $OutputDirectory -Force | Out-Null
  $zip = Join-Path $OutputDirectory "refuge-$name-$code-windows-x64.zip"
  if (Test-Path $zip) { throw 'Output already exists; choose a fresh output directory' }
  Compress-Archive -Path "$bundle/*" -DestinationPath $zip
  Get-Item $zip | Select-Object FullName,Length
  Get-FileHash $zip -Algorithm SHA256
} finally { Pop-Location }
