#ifndef CARD_H
#define CARD_H

#include <QObject>
#include "./assets/cpp/qqmlhelpers.h"

class Card : public QObject {
    Q_OBJECT
    QML_WRITABLE_PROPERTY(int, value)
    QML_WRITABLE_PROPERTY(int, naipes)
public:
    Card();
    Card(int value,int naipes);
    QString get();
};

#endif // CARD_H
