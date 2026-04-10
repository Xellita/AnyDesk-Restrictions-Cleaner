# AnyDesk Restrictions Cleaner

[English](#english) | [Русский](#русский)

---

## English

A small script to reset the restrictions on the free version of AnyDesk.

### Key Features
   - Stops all active `AnyDesk.exe` processes.
   - Delete all data from `%ProgramData%/AnyDesk` and `%AppData%/AnyDesk` (except `user.conf`) 

### Usage Instructions
1. Download the latest version from the **Releases** section.
2. Run the executable as Administrator.

### How to build
```powershell
ps2exe -inputFile ".\AnyDesk Restrictions Cleaner.ps1" -outputFile ".\AnyDesk Restrictions Cleaner.exe" -icon ".\icon.ico" -requireAdmin
```

### Technical Details:
- Runtime: PowerShell 5.1+.
- Build Method: Executable built using PS2EXE.
- Localization: Console interface automatically switches between RU/EN based on OS language.
---

## Русский

Небольшой скрипт для сброса ограничений бесплатной версии AnyDesk.

### Основной функционал
   - Остановка всех активных процессов `AustDesk.exe`.
   - Удаление всех данных в `%ProgramData%/AnyDesk` и `%AppData%/AnyDesk` (кроме `user.conf`)

### Инструкция по эксплуатации
1. Перейдите в раздел **Releases** и скачайте актуальную версию инсталлятора.
2. Запустите исполняемый файл от имени Администратора.

### Как собрать
```powershell
ps2exe -inputFile ".\AnyDesk Restrictions Cleaner.ps1" -outputFile ".\AnyDesk Restrictions Cleaner.exe" -icon ".\icon.ico" -requireAdmin
```

### Технические сведения 
- Среда исполнения: PowerShell 5.1+.
- Метод сборки: Исполняемый файл собран с помощью PS2EXE.
- Локализация: Интерфейс консоли автоматически переключается между русским и английским языками в зависимости от языка ОС.
---
