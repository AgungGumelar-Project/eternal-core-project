$jsonPath = "D:\AI AGENT BUNGA\01_Projects\eternal-core-project\vercel.json"
try {
    $content = Get-Content -Raw -Path $jsonPath
    $data = ConvertFrom-Json $content
    Write-Host "=== VERIFIKASI VERCEL.JSON ==="
    Write-Host "Version: $($data.version)"
    Write-Host "cleanUrls: $($data.cleanUrls)"
    Write-Host "trailingSlash: $($data.trailingSlash)"
    Write-Host "Headers defined: $($data.headers.Count)"
    Write-Host "STATUS: VERCEL.JSON SYNTAX VALID (Exit Code 0)"
    exit 0
} catch {
    Write-Host "ERROR: $($_.Exception.Message)"
    exit 1
}
