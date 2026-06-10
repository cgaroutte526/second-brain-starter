# load-context.ps1 — SessionStart hook for Windows (Second Brain starter).
# Plain-text stdout becomes session context. Always exits 0 so a failure never blocks the session.
$ErrorActionPreference = 'SilentlyContinue'

# Resolve the vault root: prefer Claude's project dir, else the script's parent folder.
if ($env:CLAUDE_PROJECT_DIR) {
    $vault = $env:CLAUDE_PROJECT_DIR
} else {
    $vault = Split-Path -Parent $PSScriptRoot
}
Set-Location -LiteralPath $vault

Write-Output "===== SECOND BRAIN - SESSION CONTEXT ====="
Write-Output ""

Write-Output "===== AREAS INDEX ====="
if (Test-Path "areas/_index.md") {
    Get-Content -LiteralPath "areas/_index.md"
} else {
    Write-Output "(no areas/_index.md yet)"
}
Write-Output ""

Write-Output "===== RECENT DAILY LOGS (last 3) ====="
$logs = Get-ChildItem -Path "daily-logs" -Filter "*.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match '^\d{4}-\d{2}-\d{2}\.md$' } |
    Sort-Object Name | Select-Object -Last 3
if (-not $logs) {
    Write-Output "(no daily logs yet)"
} else {
    foreach ($log in $logs) {
        Write-Output "--- $($log.Name) ---"
        Get-Content -LiteralPath $log.FullName
        Write-Output ""
    }
}
Write-Output ""

Write-Output "===== ACTIVE FOCUS PROJECTS ====="
$active = Get-ChildItem -Path "areas" -Recurse -Filter "*.md" -ErrorAction SilentlyContinue |
    Where-Object { (Get-Content -LiteralPath $_.FullName -Raw) -match '(?i)active focus:(\*\*)?\s*yes' }
if (-not $active) {
    Write-Output "(no projects flagged Active focus: yes)"
} else {
    foreach ($f in $active) {
        Write-Output "--- $($f.FullName) ---"
        Get-Content -LiteralPath $f.FullName
        Write-Output ""
    }
}
Write-Output ""
Write-Output "===== END SESSION CONTEXT ====="
exit 0
