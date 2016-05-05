#ifndef GAME_H
#define GAME_H

#include <QObject>
#include <QStack>
#include <QVector>
#include "card.h"
#include "player.h"
#include "judge.h"

class Game : public QObject {
    Q_OBJECT
    QStack<Card *> deck;
    Judge judge;
    QML_WRITABLE_PROPERTY(Player *, comp)
    QML_WRITABLE_PROPERTY(Player *, you)
    QML_WRITABLE_PROPERTY(bool, stopComp)
    QML_WRITABLE_PROPERTY(bool, stopYou)
    QML_WRITABLE_PROPERTY(int, scoreComp)
    QML_WRITABLE_PROPERTY(int, scoreYou)
    QML_WRITABLE_PROPERTY(QString, win)
    QML_WRITABLE_PROPERTY(int, wins)
    QML_WRITABLE_PROPERTY(int, loses)
public:
    Game();
    Game(Player * you);
    void buildDeck();
    Q_INVOKABLE void go();
    Q_INVOKABLE void turn();
    Q_INVOKABLE void start();
    Q_INVOKABLE void push();
    Q_INVOKABLE void stop();
    Q_INVOKABLE void load();
    void end();

};

#endif // GAME_H
