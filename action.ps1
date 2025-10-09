param(
    [Parameter(Mandatory = $true)]
    [string]$RepoOwner,
    
    [Parameter(Mandatory = $true)]
    [string]$RepoName,
    
    [Parameter(Mandatory = $false)]
    [int]$Limit = 20
)

# Set error action preference to stop on errors
$ErrorActionPreference = "Stop"

try {
    Write-Host "🔍 Finding latest prerelease version for $RepoOwner/$RepoName..."
    
    # Validate inputs
    if ([string]::IsNullOrWhiteSpace($RepoOwner)) {
        throw "Repository owner cannot be empty"
    }
    
    if ([string]::IsNullOrWhiteSpace($RepoName)) {
        throw "Repository name cannot be empty"
    }
    
    if ($Limit -le 0) {
        throw "Limit must be a positive integer"
    }
    
    $repo = "$RepoOwner/$RepoName"
    Write-Host "📋 Checking last $Limit releases..."
    
    # Check if gh CLI is available
    if (-not (Get-Command "gh" -ErrorAction SilentlyContinue)) {
        throw "GitHub CLI (gh) is not available. Please ensure it's installed and in PATH."
    }
    
    # Get releases and find the first prerelease
    $releases = gh release list --repo $repo --limit $Limit 2>&1
    
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to fetch releases: $releases"
    }
    
    $prereleaseLine = $releases | Select-String 'Pre-release' | Select-Object -First 1
    
    if (-not $prereleaseLine) {
        Write-Host "⚠️  No prerelease found in the last $Limit releases"
        $tag = ""
    } else {
        Write-Host "📝 Found prerelease line: $prereleaseLine"
        $parts = $prereleaseLine -split '\s+'
        $tag = $parts[-2]  # Tag is typically the second-to-last element
        Write-Host "✅ Latest prerelease version: $tag"
    }
    
    # Set the output
    Write-Host "🔧 Setting output: latest-prerelease=$tag"
    "latest-prerelease=$tag" | Out-File -FilePath $env:GITHUB_OUTPUT -Append -Encoding utf8
    
    Write-Host "✨ Action completed successfully!"
    
} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
