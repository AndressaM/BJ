#ifndef JUDGE_H
#define JUDGE_H

#include "card.h"
#include "./assets/cpp/qqmlobjectlistmodel.h"

#include <QObject>

class Judge : public QObject {
    Q_OBJECT
public:
    Judge();
    double chance(QQmlObjectListModel<Card> *hand);
    int trueValue(int value);
};

#endif // JUDGE_H
