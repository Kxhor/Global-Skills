# Antigravity, Claude Code, OpenCode & VS Code Global Skills Installer for Windows
# Run: powershell -ExecutionPolicy Bypass -File .\install.ps1

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$homeDir = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Universal AI Global Skills Installer (Windows)" -ForegroundColor Cyan
Write-Host "  Surfaces: Antigravity, Claude Code, OpenCode, VS Code" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Source directory:    $scriptDir"
Write-Host "Target user profile: $homeDir"

# Target root directories across all AI platforms
$configPluginsDir           = Join-Path $homeDir ".gemini\config\plugins"
$configSkillsDir            = Join-Path $homeDir ".gemini\config\skills"
$cliSkillsDir               = Join-Path $homeDir ".gemini\antigravity-cli\skills"
$antigravityDesktopSkillsDir= Join-Path $homeDir ".gemini\antigravity\skills"
$agentsSkillsDir            = Join-Path $homeDir ".agents\skills"
$claudeSkillsDir            = Join-Path $homeDir ".claude\skills"
$opencodeConfigSkillsDir    = Join-Path $homeDir ".config\opencode\skills"
$opencodeSkillsDir          = Join-Path $homeDir ".opencode\skills"

# Create required directories
$allDirs = @(
    $configPluginsDir,
    $configSkillsDir,
    $cliSkillsDir,
    $antigravityDesktopSkillsDir,
    $agentsSkillsDir,
    $claudeSkillsDir,
    $opencodeConfigSkillsDir,
    $opencodeSkillsDir
)
foreach ($dir in $allDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

function Create-SafeJunction($linkPath, $targetPath) {
    if (-not (Test-Path $linkPath)) {
        New-Item -ItemType Junction -Path $linkPath -Target $targetPath | Out-Null
        return $true
    }
    return $false
}

$pluginsInstalled = 0
$skillsLinked = 0
$installedPlugins = @()
$excludedDirs = @(".git", ".github", "standalone-skills")

# 1. Install all plugins into ~/.gemini/config/plugins and link skills into all ecosystems
Get-ChildItem -Path $scriptDir -Directory | Where-Object { $_.Name -notin $excludedDirs } | ForEach-Object {
    $pluginName = $_.Name
    $pluginSource = $_.FullName
    $pluginTarget = Join-Path $configPluginsDir $pluginName
    $installedPlugins += $pluginName

    # Link plugin into Antigravity plugins directory
    if (-not (Test-Path $pluginTarget)) {
        Create-SafeJunction $pluginTarget $pluginSource | Out-Null
        Write-Host " [+] Installed plugin: $pluginName" -ForegroundColor Green
        $pluginsInstalled++
    } else {
        Write-Host " [=] Plugin registered: $pluginName" -ForegroundColor DarkGray
    }

    # Discover and link skills in plugin's skills/ directory
    $pluginSkills = Join-Path $pluginSource "skills"
    if (Test-Path $pluginSkills) {
        Get-ChildItem -Path $pluginSkills -Directory | ForEach-Object {
            $skillName = $_.Name
            $skillSource = $_.FullName

            Create-SafeJunction (Join-Path $configSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $cliSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $antigravityDesktopSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $agentsSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $claudeSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $opencodeConfigSkillsDir $skillName) $skillSource | Out-Null
            Create-SafeJunction (Join-Path $opencodeSkillsDir $skillName) $skillSource | Out-Null
            $skillsLinked++
        }
    }
}

# 2. Install standalone skills across all platforms
$standaloneDir = Join-Path $scriptDir "standalone-skills"
if (Test-Path $standaloneDir) {
    Get-ChildItem -Path $standaloneDir -Directory | ForEach-Object {
        $skillName = $_.Name
        $skillSource = $_.FullName

        Create-SafeJunction (Join-Path $configSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $cliSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $antigravityDesktopSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $agentsSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $claudeSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $opencodeConfigSkillsDir $skillName) $skillSource | Out-Null
        Create-SafeJunction (Join-Path $opencodeSkillsDir $skillName) $skillSource | Out-Null
        Write-Host " [+] Installed standalone skill: $skillName" -ForegroundColor Green
        $skillsLinked++
    }
}

# 3. Create high-utility alias junctions
$aliases = @{
    "addy-tdd"                      = Join-Path $scriptDir "agent-skills\skills\test-driven-development"
    "agent-tdd"                     = Join-Path $scriptDir "agent-skills\skills\test-driven-development"
    "test-driven-development-agent" = Join-Path $scriptDir "agent-skills\skills\test-driven-development"
    "ecc-design-system"             = Join-Path $scriptDir "ecc\skills\design-system"
}
foreach ($alias in $aliases.Keys) {
    $target = $aliases[$alias]
    if (Test-Path $target) {
        Create-SafeJunction (Join-Path $configSkillsDir $alias) $target | Out-Null
        Create-SafeJunction (Join-Path $cliSkillsDir $alias) $target | Out-Null
        Create-SafeJunction (Join-Path $agentsSkillsDir $alias) $target | Out-Null
        Create-SafeJunction (Join-Path $claudeSkillsDir $alias) $target | Out-Null
    }
}

# 4. Register and enable all plugins in Antigravity config.json
$configJsonPath = Join-Path $homeDir ".gemini\config\config.json"
if (Test-Path $configJsonPath) {
    try {
        $config = Get-Content $configJsonPath -Raw | ConvertFrom-Json
        if (-not $config.plugins) {
            $config | Add-Member -MemberType NoteProperty -Name "plugins" -Value ([PSCustomObject]@{})
        }
        foreach ($p in $installedPlugins) {
            if (-not $config.plugins.$p) {
                $config.plugins | Add-Member -MemberType NoteProperty -Name $p -Value ([PSCustomObject]@{ enabled = $true })
            } else {
                $config.plugins.$p.enabled = $true
            }
        }
        $config | ConvertTo-Json -Depth 10 | Set-Content $configJsonPath -Encoding UTF8
        Write-Host " [✔] Registered all plugins in ~/.gemini/config/config.json" -ForegroundColor Green
    } catch {
        Write-Host " [!] Notice: Could not automatically update config.json: $_" -ForegroundColor DarkGray
    }
}

# 5. Install Universal Proactive Skill Directive in ~/.claude/CLAUDE.md and ~/.agents/AGENTS.md
$sourceClaudeMd = Join-Path $scriptDir "CLAUDE.md"
$sourceAgentsMd = Join-Path $scriptDir "AGENTS.md"

if (Test-Path $sourceClaudeMd) {
    $targetClaudeMd = Join-Path $homeDir ".claude\CLAUDE.md"
    if (-not (Test-Path $targetClaudeMd)) {
        Copy-Item $sourceClaudeMd $targetClaudeMd -Force
        Write-Host " [✔] Installed universal proactive directive in ~/.claude/CLAUDE.md" -ForegroundColor Green
    }
}
if (Test-Path $sourceAgentsMd) {
    $targetAgentsMd = Join-Path $homeDir ".agents\AGENTS.md"
    if (-not (Test-Path $targetAgentsMd)) {
        Copy-Item $sourceAgentsMd $targetAgentsMd -Force
        Write-Host " [✔] Installed universal proactive directive in ~/.agents/AGENTS.md" -ForegroundColor Green
    }
}

Write-Host "`n----------------------------------------------------------" -ForegroundColor Cyan
Write-Host " Global Installation Complete!" -ForegroundColor Green
Write-Host " Total Plugins Installed:    $((Get-ChildItem -Path $configPluginsDir -Directory).Count)" -ForegroundColor White
Write-Host " Antigravity IDE Skills:     $((Get-ChildItem -Path $configSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " Antigravity CLI Skills:     $((Get-ChildItem -Path $cliSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " Universal (.agents) Skills: $((Get-ChildItem -Path $agentsSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " Claude Code Skills:         $((Get-ChildItem -Path $claudeSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host " OpenCode Skills:            $((Get-ChildItem -Path $opencodeConfigSkillsDir -Directory).Count)" -ForegroundColor White
Write-Host "----------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Restart your IDE (Antigravity / VS Code / Cursor) or CLI (Claude Code / OpenCode / agy) to begin using them immediately!" -ForegroundColor Yellow
