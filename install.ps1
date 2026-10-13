# Antigravity Global Skills Installer for Windows
# Run: powershell -ExecutionPolicy Bypass -File .\install.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$homeDir = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Antigravity Global Skills Installer (Windows)" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Source directory: $scriptDir"
Write-Host "Target user profile: $homeDir"

# Target directories
$configPluginsDir = Join-Path $homeDir ".gemini\config\plugins"
$configSkillsDir  = Join-Path $homeDir ".gemini\config\skills"
$cliSkillsDir     = Join-Path $homeDir ".gemini\antigravity-cli\skills"
$agentsSkillsDir  = Join-Path $homeDir ".agents\skills"

# Create required directories
foreach ($dir in @($configPluginsDir, $configSkillsDir, $cliSkillsDir, $agentsSkillsDir)) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$pluginsInstalled = 0
$cliSkillsLinked = 0

# 1. Install all plugins into ~/.gemini/config/plugins and link skills into CLI / Universal
$excludedDirs = @(".git", ".github", "standalone-skills")

Get-ChildItem -Path $scriptDir -Directory | Where-Object { $_.Name -notin $excludedDirs } | ForEach-Object {
    $pluginName = $_.Name
    $pluginSource = $_.FullName
    $pluginTarget = Join-Path $configPluginsDir $pluginName

    # Link plugin to ~/.gemini/config/plugins
    if (-not (Test-Path $pluginTarget)) {
        New-Item -ItemType Junction -Path $pluginTarget -Target $pluginSource | Out-Null
        Write-Host " [+] Installed plugin: $pluginName" -ForegroundColor Green
        $pluginsInstalled++
    } else {
        Write-Host " [=] Plugin already registered: $pluginName" -ForegroundColor Yellow
    }

    # Discover skills in plugin's skills/ directory
    $pluginSkills = Join-Path $pluginSource "skills"
    if (Test-Path $pluginSkills) {
        Get-ChildItem -Path $pluginSkills -Directory | ForEach-Object {
            $skillName = $_.Name
            $skillSource = $_.FullName

            # Link into CLI skills folder
            $cliTarget = Join-Path $cliSkillsDir $skillName
            if (-not (Test-Path $cliTarget)) {
                New-Item -ItemType Junction -Path $cliTarget -Target $skillSource | Out-Null
                $cliSkillsLinked++
            }

            # Link into universal agents folder
            $agentsTarget = Join-Path $agentsSkillsDir $skillName
            if (-not (Test-Path $agentsTarget)) {
                New-Item -ItemType Junction -Path $agentsTarget -Target $skillSource | Out-Null
            }
        }
    }
}

# 2. Install standalone skills into ~/.gemini/config/skills, CLI, and Universal
$standaloneDir = Join-Path $scriptDir "standalone-skills"
if (Test-Path $standaloneDir) {
    Get-ChildItem -Path $standaloneDir -Directory | ForEach-Object {
        $skillName = $_.Name
        $skillSource = $_.FullName

        # IDE standalone root
        $configTarget = Join-Path $configSkillsDir $skillName
        if (-not (Test-Path $configTarget)) {
            New-Item -ItemType Junction -Path $configTarget -Target $skillSource | Out-Null
            Write-Host " [+] Installed standalone skill: $skillName" -ForegroundColor Green
        }

        # CLI root
        $cliTarget = Join-Path $cliSkillsDir $skillName
        if (-not (Test-Path $cliTarget)) {
            New-Item -ItemType Junction -Path $cliTarget -Target $skillSource | Out-Null
            $cliSkillsLinked++
        }

        # Universal root
        $agentsTarget = Join-Path $agentsSkillsDir $skillName
        if (-not (Test-Path $agentsTarget)) {
            New-Item -ItemType Junction -Path $agentsTarget -Target $skillSource | Out-Null
        }
    }
}

Write-Host "`n----------------------------------------------------------" -ForegroundColor Cyan
Write-Host " Installation Complete!" -ForegroundColor Green
Write-Host " Plugins in IDE/2.0:  $((Get-ChildItem -Path $configPluginsDir -Directory).Count)" -ForegroundColor White
Write-Host " Standalone Skills:   $((Get-ChildItem -Path $configSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " Total Skills in CLI: $((Get-ChildItem -Path $cliSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " Universal Skills:    $((Get-ChildItem -Path $agentsSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host "----------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Restart Antigravity IDE / 2.0 or launch 'agy' CLI to use them immediately!" -ForegroundColor Yellow
