# Auto-update script for openai-agents-python
# Runs git pull and logs the result

$logFile = "D:\AI_Projects\openai-agents-study\.scripts\update.log"
$repoPath = "D:\AI_Projects\openai-agents-study"

Set-Location $repoPath

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $logFile -Value "
=== $timestamp ==="

try {
    $result = git pull origin main 2>&1
    Add-Content -Path $logFile -Value $result
    Add-Content -Path $logFile -Value "SUCCESS"
} catch {
    Add-Content -Path $logFile -Value "ERROR: $_"
}
