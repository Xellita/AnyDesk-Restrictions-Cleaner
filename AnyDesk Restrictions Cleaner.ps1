# --- LOCALIZATION ---
$UI = @{
    RU = @{
        Closing   = "Завершение работы AnyDesk..."
        Backup    = "Сохранение user.conf..."
        Cleaning  = "Очистка данных..."
        Restore   = "Восстановление конфигурации..."
        Done      = "Готово! Счетчик сброшен."
    }
    EN = @{
        Closing   = "Closing AnyDesk..."
        Backup    = "Saving user.conf..."
        Cleaning  = "Cleaning data..."
        Restore   = "Restoring configuration..."
        Done      = "Done! Reset successful."
    }
}

# ru/en win detection
$Lang = if ((Get-Culture).Name -match "ru") { $UI.RU } else { $UI.EN }

# fix for smb and launch with admin permissions
if ($PSScriptRoot -like "\\*") { Set-Location "$env:TEMP" }
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File "$PSCommandPath"" -Verb RunAs
    exit
}

# closing anydesk
Write-Host $Lang.Closing -ForegroundColor Cyan
$processes = Get-Process -Name "AnyDesk" -ErrorAction SilentlyContinue
if ($processes) {
    Stop-Process -Name "AnyDesk" -Force
    Start-Sleep -Seconds 2
}

# pathes
$programDataPath = "$env:ProgramData\AnyDesk"
$appDataPath = "$env:AppData\AnyDesk"
$tempBackup = "$env:TEMP\user.conf.bak"

# cleaning appdata with saving user.conf
if (Test-Path $appDataPath) {
    $userConf = Join-Path $appDataPath "user.conf"
    
    if (Test-Path $userConf) {
        Write-Host $Lang.Backup -ForegroundColor Yellow
        Copy-Item -Path $userConf -Destination $tempBackup -Force
    }

    Write-Host "$($Lang.Cleaning) (AppData)" -ForegroundColor Yellow
    Remove-Item -Path $appDataPath -Recurse -Force
    
    New-Item -ItemType Directory -Path $appDataPath -Force | Out-Null
    if (Test-Path $tempBackup) {
        Move-Item -Path $tempBackup -Destination $userConf -Force
        Write-Host $Lang.Restore -ForegroundColor Green
    }
}

# cleaning programdata
if (Test-Path $programDataPath) {
    Write-Host "$($Lang.Cleaning) (ProgramData)" -ForegroundColor Yellow
    Remove-Item -Path $programDataPath -Recurse -Force
}

Write-Host $Lang.Done -ForegroundColor Green
Start-Sleep -Seconds 3
