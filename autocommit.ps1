# === CONFIG ===
$remoteUrl = "https://github.com/ubsr-official/notebooks.git"  # CHANGE THIS (IF REQUIRED)
$interval = 10  # seconds between commits
$branch = "main"  # branch to work with

# === SETUP ===
git branch -M $branch
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    git remote set-url origin $remoteUrl
} else {
    git remote add origin $remoteUrl
}

Write-Host "Auto-committer started. Watching for changes every $interval seconds..."
Write-Host "Remote: $remoteUrl"
Write-Host "Branch: $branch"
Write-Host "Started at: $(Get-Date -Format 'HH:mm:ss')"
Write-Host "`nPress Ctrl+C to stop anytime.`n"

# === HELPER FUNCTIONS ===
function Sync-Repository {
    # Pull latest changes first
    Write-Host "Pulling latest changes..." -ForegroundColor Cyan
    git pull origin $branch --quiet
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Pull failed. Attempting to stash, pull, then pop..." -ForegroundColor Yellow
        git stash --quiet
        git pull origin $branch --quiet
        git stash pop --quiet
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "WARNING: Merge conflicts detected. Please resolve manually." -ForegroundColor Red
            return $false
        }
    }
    
    # Check for changes after pull
    $hasChanges = git status --porcelain
    if ($hasChanges) {
        # Stage changes
        git add .
        
        # Commit with timestamp
        $commitMessage = "Auto-commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        git commit -m "$commitMessage" --quiet
        
        # Push changes
        git push -u origin $branch --quiet
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Changes pushed successfully at $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Green
        } else {
            Write-Host "Push failed. Will retry on next cycle." -ForegroundColor Red
            return $false
        }
    } else {
        Write-Host "No local changes to commit at $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
    }
    
    return $true
}

# === MAIN LOOP ===
while ($true) {
    try {
        # Check if we're in a git repository
        git rev-parse --is-inside-work-tree --quiet
        if ($LASTEXITCODE -ne 0) {
            Write-Host "ERROR: Not in a git repository. Exiting." -ForegroundColor Red
            exit 1
        }
        
        # Sync repository (pull, commit if needed, push)
        Sync-Repository | Out-Null
    }
    catch {
        Write-Host "ERROR: $_" -ForegroundColor Red
    }
    
    # Wait for next cycle
    Start-Sleep -Seconds $interval
}