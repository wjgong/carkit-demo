#include <QApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QTranslator qtTranslator;
    qtTranslator.load("carkit_" + QLocale::system().name(), ":/i18n/");
    app.installTranslator(&qtTranslator);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
