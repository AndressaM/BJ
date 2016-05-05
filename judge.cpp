#include "judge.h"
#include <QVector>
#include <QDebug>

Judge::Judge(){}

double Judge::chance(QQmlObjectListModel<Card> *hand) {
    QVector<int> cards(14,4);
    double sum = 0;

    for (int i = 0; i < hand->size(); ++i) {
        sum += trueValue(hand->at(i)->get_value());
        --cards[hand->at(i)->get_value()];
    }
    if(sum <= 10) return 1.0;
    double goodCard = 0;
    for (int i = 1; i <= (21 - sum); ++i)
        goodCard += cards[i];
    qDebug() << (goodCard)/(52.0 - hand->size());
    return (goodCard)/(52.0 - hand->size());
}

int Judge::trueValue(int value) {
    if(value >= 10) return 10;
    return value;
}
