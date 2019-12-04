#ifndef ANTIVIRUS_H
#define ANTIVIRUS_H
#include <QString>
#include <QProcess>
#include <QSysInfo>
#include <QStandardPaths>

#include <QNetworkAccessManager>
#include <QEventLoop>

class Antivirus : public QObject
{
    Q_OBJECT
private:
    QProcess *clamProcess;
    QString clamPath = "";
    QString platform;
    QString parsePath(QString p);
    int version[3] = {0,0,0};

public:
    explicit Antivirus(QObject *parent = nullptr);
    Q_INVOKABLE QString checkVersion(int i = 0);
    int *parseVersionString(QString v);
    Q_INVOKABLE void updateClam();
    Q_INVOKABLE void scanFixed(int type);
    Q_INVOKABLE void scanFiles(QString files);
    Q_INVOKABLE void scanFolder(QString folder);
    Q_INVOKABLE void startScheduler(bool state);
};

#endif // ANTIVIRUS_H
