# TeX Live on Windows. MiKTeX does not ship tlmgr; see README.
$ErrorActionPreference = 'Continue'
Set-Location (Join-Path $PSScriptRoot '..')

if (-not (Get-Command tlmgr -ErrorAction SilentlyContinue)) {
  Write-Error "tlmgr not on PATH. Install TeX Live and run this from a TeX Live terminal. MiKTeX: skip this script and run latexmk -pdf resume.tex"
  exit 1
}

tlmgr init-usertree 2>$null | Out-Null

$pkgs = Get-Content -LiteralPath 'texlive-packages.txt' |
  ForEach-Object { $_.Trim() } |
  Where-Object { $_ -and ($_ -notmatch '^\s*#') -and $_ -ne 'sourcesans' -and $_ -ne 'sourcesanspro' }

& tlmgr --usermode install @pkgs
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& tlmgr --usermode install sourcesans
if ($LASTEXITCODE -ne 0) {
  Write-Host "sourcesans is not in this TeX Live; installing sourcesanspro"
  & tlmgr --usermode install sourcesanspro
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
