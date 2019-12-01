# WatchDogSecurity
 A ClamAV frontend for Windows and Linux.

## Features / ToDo
 - [x] Scan files
 - [x] Scan folders
 - [ ] "Simple scan", "Complete scan", "Scan drive"
 - [ ] Rootkit scanner ?
 - [ ] ClamAV Daemon
 - [ ] Firewall

## Building
### Manual
 - Build WatchDogSecurity and uiscan
 - Create .qm files by entering "lrelease \*.ts" or use Qt Creator
 - Copy both binaries into the same directory
 - Copy .qm files into a subdirectory "translations"
 - Windows: Deploy application by entering "windeployqt uiscan.exe" and "windeployqt WatchDogSecurity.exe"