#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include "./assets/cpp/qqmlhelpers.h"
#include "./assets/cpp/qqmlobjectlistmodel.h"
#include "card.h"

class Player : public QObject {
    Q_OBJECT
    QML_WRITABLE_PROPERTY(QString, name)
    QML_WRITABLE_PROPERTY(int, wins)
    QML_WRITABLE_PROPERTY(int, games)
    QML_WRITABLE_PROPERTY(int, cash)
    QML_OBJMODEL_PROPERTY(Card, hand)

public:
    Player();
    Player(QString name);
    Player(QJsonObject json);
    void printHand();
    Q_INVOKABLE int score();

};

#endif // PLAYER_H
