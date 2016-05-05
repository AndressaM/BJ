#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "judge.h"
#include "game.h"
#include <QDebug>

int main(int argc, char *argv[]) {
        QGuiApplication app(argc, argv);
        QQmlApplicationEngine engine;
        Game game(new Player());
        QQmlContext *ctx = engine.rootContext();
        ctx->setContextProperty("_game", &game);
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
        return app.exec();
}
