#include "player.h"

Player::Player() {
    m_hand = new QQmlObjectListModel<Card>();
}

void Player::printHand() {
    QString show = "";
    for (int i = 0; i < m_hand->size(); ++i)
        show += m_hand->at(i)->get();
    qDebug() << show;
}

int Player::score() {
    int score = 0;
    for (int i = 0; i < m_hand->size(); ++i) {
        if(m_hand->at(i)->get_value() >= 10)
            score += 10;
        else score += m_hand->at(i)->get_value();
    }
    return score;
}
