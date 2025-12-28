$port = 8080
$serverHost = "localhost"

Write-Host "Starting local server..." -ForegroundColor Green
Write-Host "URL: http://${serverHost}:${port}" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

if (Get-Command python -ErrorAction SilentlyContinue) {
    python -m http.server $port
} elseif (Get-Command python3 -ErrorAction SilentlyContinue) {
    python3 -m http.server $port
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
    py -m http.server $port
} else {
    Write-Host "Error: Python not found" -ForegroundColor Red
    Write-Host "Install Python or use: npx http-server -p $port" -ForegroundColor Yellow
    pause
    exit 1
}
