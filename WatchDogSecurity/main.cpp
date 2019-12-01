#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QDebug>
#include <antivirus.h>

int main(int argc, char *argv[])
{
    //Antivirus *myAV = new Antivirus();
    //myAV->updateClam();

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setOrganizationName("DavidoTek");
    app.setOrganizationDomain("davidotek.net");

    app.setWindowIcon(QIcon(":/favicon.ico"));

    qmlRegisterType<Antivirus>("wds.antivirus", 1, 0, "Antivirus");

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
