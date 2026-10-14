param([Parameter(Mandatory=$true)][string]$TargetPath)
$ErrorActionPreference = 'Stop'
$SourceRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
New-Item -ItemType Directory -Force -Path $TargetPath | Out-Null
$TargetRoot = (Resolve-Path $TargetPath).Path
$SourceSkills = Join-Path $SourceRoot '.agents\skills'
$TargetSkills = Join-Path $TargetRoot '.agents\skills'
New-Item -ItemType Directory -Force -Path $TargetSkills | Out-Null
foreach ($Skill in Get-ChildItem $SourceSkills -Directory) {
  $Destination = Join-Path $TargetSkills $Skill.Name
  if (Test-Path $Destination) { Write-Host "SKIP existing skill: $($Skill.Name)"; continue }
  Copy-Item -LiteralPath $Skill.FullName -Destination $Destination -Recurse
  Write-Host "Installed skill: $($Skill.Name)"
}
$AgentInstructions = Join-Path $TargetRoot 'AGENTS.md'
if (!(Test-Path $AgentInstructions)) {
  Copy-Item (Join-Path $SourceRoot 'AGENTS.team.example.md') $AgentInstructions
  Write-Host 'Created AGENTS.md'
} else {
  $Suggested = Join-Path $TargetRoot 'AGENTS.team.example.md'
  if (!(Test-Path $Suggested)) { Copy-Item (Join-Path $SourceRoot 'AGENTS.team.example.md') $Suggested }
  Write-Host 'Existing AGENTS.md preserved. Review AGENTS.team.example.md to merge team instructions.'
}
$Docs = Join-Path $TargetRoot 'docs\product'
New-Item -ItemType Directory -Force -Path $Docs | Out-Null
foreach ($File in Get-ChildItem (Join-Path $SourceRoot 'templates') -File) {
  $Destination = Join-Path $Docs $File.Name
  if (!(Test-Path $Destination)) { Copy-Item $File.FullName $Destination }
}
Write-Host "Done. Open $TargetRoot in VS Code and ask Codex: Use `$build-app to guide my product."
