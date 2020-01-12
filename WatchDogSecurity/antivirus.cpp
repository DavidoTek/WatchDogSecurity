#include "antivirus.h"
#include <QDebug>

Antivirus::Antivirus(QObject *parent) : QObject (parent)
{
    platform = QSysInfo::productType();

    clamProcess = new QProcess();
}

// checkVersion will check the version of ClamAV/Database/WDS - TESTED
QString Antivirus::checkVersion(int i)
{
    QString output;
    if ( i < 2 ) {    // i < 2 : Check clamav / database version
        QString clamCmd = clamPath + "clamscan --version";
        clamProcess->start(clamCmd);
        clamProcess->waitForFinished();
        clamProcess->waitForReadyRead();
        output = clamProcess->readAll().split(' ')[1];  // Returns "CLAMAV X.X.X" -> "X.X.X" - "\r\n" or "CLAMAV X.X.X/XXXXX"
        if (i + 1 > output.split('/').length()) {   // Check if returns database version
            output = "?";
        } else {
            output = output.split('/')[i];
        }
        clamProcess->close();
    } else if ( i == 2 ) {  // i == 2 : Check curretn WDS version
        output = APP_VERSION;
    } else if ( i == 3 ) {  // i == 3 : Check newest WDS version (ONLINE)
        // https://github.com/DavidoTek/WatchDogSecurity/raw/master/LATEST (Text file. Contains "X.X.X.X")
        /*QNetworkAccessManager *nam = new QNetworkAccessManager(this);

        QNetworkReply *reply = nam->get(QNetworkRequest(QUrl("https://github.com/DavidoTek/WatchDogSecurity/raw/master/LATEST")));

        QEventLoop eventLoop;   // ASYNC... problem if there is not internet connection etc.
        connect(nam, &QNetworkAccessManager::finished, &eventLoop, SLOT(quit()));
        eventLoop.exec();*/


    } else if ( i == 4 ) {  // i == 4 : Check newest ClamAV version (ONLINE)
        //
    }

    return output;
}

// parseVersionString will parse a 3 or 4-part version string(eg. "12.34.56" / "1.2.3.4") to an int array - TESTED
int *Antivirus::parseVersionString(QString ver) {
    QStringList vers = ver.split('.');
    static int a[4];
    for (int i = 0; i < vers.length(); i++) {
        a[i] = vers[i].toInt();
    }
    return a;
}

// parsePath will parse the given file path to an format that clamav will accept. file:///C:/bla/bla.txt -> C:\\bla\\bla.txt
QString Antivirus::parsePath(QString p)
{
    p = p.remove("file:");
    if (platform == "windows") {
        p = p.remove("///");
        p = p.replace('/' , '\\');
    } else {
        p = p.remove("//");
    }
    return p;
}

// updateClam will manually update ClamAV - NOT TESTED
void Antivirus::updateClam() {
    QString clamCmd;
    clamCmd = clamPath + "freshclam";

    clamProcess->startDetached(clamCmd);
}

// scanFixed will either do a simple scan(type=0) or a full scan(type=1)
void Antivirus::scanFixed(int type)
{
    switch(type) {
    default:
    case 0:
        scanFiles(parsePath(QStandardPaths::writableLocation(QStandardPaths::HomeLocation)));   // scan home directory
        break;
    case 1:
        if (platform == "windows") {
            scanFiles("C:\\");
        } else {
            scanFiles("/");
        }
        break;
    }
}

// scanFiles will scan all given files - NOT TESTED
void Antivirus::scanFiles(QString f)
{
    QStringList files = f.split(",file:");
    QStringList clamFiles;
    for (QString file : files) {
        clamFiles.append(file);
    }

    QProcess clamscanProcess;
    clamscanProcess.startDetached("uiscan", clamFiles);
}

// scanFolder will scan the given folder (also used for scanning drives(eg. "C:\" or "/media/usb1/")) - NOT TESTED
void Antivirus::scanFolder(QString directory)
{
    QProcess clamscanProcess;
    clamscanProcess.startDetached("uiscan", {directory});
}

// scheduled scanning - NOT IMPLEMENTED
void Antivirus::startScheduler(bool state)
{

}
