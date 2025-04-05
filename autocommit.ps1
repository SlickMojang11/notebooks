# === CONFIG ===
$remoteUrl = "https://github.com/ubsr-official/notebooks.git"  # CHANGE THIS (IF REQUIRED)
$interval = 60  # seconds between commits

# === SETUP ===
git branch -M main
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    git remote set-url origin $remoteUrl
} else {
    git remote add origin $remoteUrl
}

Write-Host "Auto-committer started. Watching for changes every $interval seconds..."
Write-Host "Remote: $remoteUrl"
Write-Host "Started at: $(Get-Date -Format 'HH:mm:ss')"
Write-Host "`nPress Ctrl+C to stop anytime.`n"

# === LOOP ===
while ($true) {
    $hasChanges = git status --porcelain

    if ($hasChanges) {
        git add .
        $commitMessage = "Auto-commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        git commit -m "$commitMessage"
        git push -u origin main
        Write-Host "Changes pushed at $(Get-Date -Format 'HH:mm:ss')"
    } else {
        Write-Host "No changes at $(Get-Date -Format 'HH:mm:ss')"
    }

    Start-Sleep -Seconds $interval
}
