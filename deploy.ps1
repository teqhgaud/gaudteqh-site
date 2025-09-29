# deploy.ps1 — initialize a git repo and push to GitHub (PowerShell)
# Usage: Open PowerShell in this folder and run: .\deploy.ps1 -RemoteUrl "https://github.com/youruser/yourrepo.git"
param(
  [Parameter(Mandatory=$true)]
  [string]$RemoteUrl,
  [string]$Branch = "main",
  [string]$CommitMessage = "chore: deploy site"
)

function Run-Git([string]$args){
  $cmd = "git $args"
  Write-Host "> $cmd"
  & git $args
  if($LASTEXITCODE -ne 0){
    Write-Error "Git command failed: $cmd"
    exit $LASTEXITCODE
  }
}

if(-not (Get-Command git -ErrorAction SilentlyContinue)){
  Write-Error "Git not found in PATH. Install Git and try again."
  exit 1
}

# Initialize repo if none
if(-not (Test-Path ".git")){
  Write-Host "Initializing new git repository..."
  Run-Git "init"
  Run-Git "branch -M $Branch"
}

# Add remote if missing
$remotes = git remote
if(-not ($remotes -split "\r?\n" | Where-Object { $_ -eq 'origin' })){
  Run-Git "remote add origin $RemoteUrl"
} else {
  Run-Git "remote set-url origin $RemoteUrl"
}

Run-Git "add -A"

Run-Git "commit -m \"$CommitMessage\""
Run-Git "push -u origin $Branch --force"

Write-Host "Pushed to $RemoteUrl#$Branch"
Write-Host "If GitHub Pages is enabled and the workflow is present the site will publish automatically."