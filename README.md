# WatchDogSecurity
 A ClamAV frontend for Windows and Linux.

## Features / ToDo
 - [x] Scan files
 - [x] Scan folders
 - [ ] "Simple scan", "Complete scan", "Scan drive"
 - [ ] Rootkit scanner ?
 - [ ] Scheduler
 - [ ] Firewall
 - [ ] Firewall/Virus status information (home page)
 - [ ] Scan history / Quarantine
 - [ ] Updater (ClamAV, WatchDogSecurity)

## Screenshots
#### WatchDogSecurity - Home page (CSD)
![WatchDogSecurity Center - Home](/images/wds01.png)
#### WatchDogSecurity - Antivirus page (Native window decoration)
![WatchDogSecurity Center - AV](/images/wds02.png)
#### WatchDogSecurity - uiscan
![WatchDogSecurity - uiscan](/images/uiscan01.png)

## Building
### Manual
 - Build WatchDogSecurity and uiscan
 - Create .qm files by entering "lrelease \*.ts" or use Qt Creator
 - Copy both binaries into the same directory
 - Copy .qm files into a subdirectory "translations"
 - Windows: Deploy application by entering "windeployqt uiscan.exe WatchDogSecurity.exe --no-patchqt"