while ($true) {
    # Navigate to the Git repo
    Set-Location -Path "X:/NoteBook-X"

    # Check for changes
    $changes = git status --porcelain

    if ($changes) {
        # Stage all changes
        git add .

        # Commit with timestamp
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        git commit -m "Auto-commit at $timestamp"

        # Push changes
        git push origin main

        Write-Host "Changes committed and pushed at $timestamp"
    } else {
        Write-Host "No changes detected"
    }

    # Wait 60 seconds before checking again
    Start-Sleep -Seconds 10
}
