$baseDir = "D:\AI AGENT BUNGA\01_Projects\eternal-core-project"
$htmlPath = Join-Path $baseDir "index.html"
$html = Get-Content -Raw -Encoding UTF8 -Path $htmlPath

# Cari pola assets/...
$matches = [regex]::Matches($html, 'assets/[^"''\s,)]+')
$foundPaths = @()
foreach ($m in $matches) {
    $clean = $m.Value.Trim()
    $foundPaths += $clean
}

$unique = $foundPaths | Sort-Object -Unique
Write-Host "=== VERIFIKASI ASSET INDEX.HTML ==="
Write-Host "Total unique references: $($unique.Count)"

$missing = 0
$valid = 0

foreach ($rel in $unique) {
    $sysPath = $rel.Replace('/', '\')
    $targetPath = Join-Path $baseDir $sysPath
    if (Test-Path $targetPath) {
        Write-Host "[OK] $rel"
        $valid++
    } else {
        Write-Host "[404 NOT FOUND] $rel" -ForegroundColor Red
        $missing++
    }
}

Write-Host "----------------------------------"
Write-Host "Valid Assets   : $valid"
Write-Host "Missing Assets : $missing"

if ($missing -eq 0) {
    Write-Host "STATUS: MECHANICAL PROOF PASS (Exit Code 0)"
    exit 0
} else {
    Write-Host "STATUS: FAILED MISSING ASSETS"
    exit 1
}
