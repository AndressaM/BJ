#include "judge.h"
#include "game.h"
#include <QDebug>
#include <iostream>

using namespace std;

Game::Game() {
//    srand(time(NULL));
    set_comp(new Player());
}

Game::Game(Player * you) {
//    srand(time(NULL));
    set_you(you);
    set_comp(new Player());
    set_loses(0);
    set_wins(0);
}

void Game::buildDeck() {
    QVector<Card *> cards;
    for (int i = 1; i < 14; ++i)
        for (int j = 0; j < 4; ++j)
            cards << new Card(i,j);
    for (int var = 0; var < 1000; ++var)
        swap(cards[rand() % 52], cards[rand() % 52]);

    foreach (Card * c, cards)
        deck << c;
}

void Game::go() {
    do {
        turn();
    } while(!get_stopComp() || !get_stopYou());
    this->end();
}

void Game::turn() {
    if(judge.chance(m_comp->get_hand()) >= 0.4) {
        m_comp->get_hand()->append(deck.pop());
    }
    else set_stopComp(true);
    m_comp->printHand();
}

void Game::start() {
    buildDeck();
    m_comp->get_hand()->clear();
    m_you->get_hand()->clear();
    m_comp->get_hand()->append(deck.pop());
    m_you->get_hand()->append(deck.pop());
    m_comp->get_hand()->append(deck.pop());
    m_you->get_hand()->append(deck.pop());
    set_stopComp(false);
    set_stopYou(false);
    emit youChanged(m_you);
    emit compChanged(m_comp);
}

void Game::push() {
    m_you->get_hand()->append(deck.pop());
}

void Game::stop() {
    set_stopYou(true);
}

void Game::load() {
    set_scoreComp(m_comp->score());
    set_scoreYou(m_you->score());
    if(get_scoreComp() == get_scoreYou()) set_win("Empatados");
    else if(get_scoreComp() > 21 && get_scoreYou() > 21){
        if(get_scoreComp() < get_scoreYou()){
            set_win("Voce Perdeu!!");
            m_loses++;
        }
        else {
            set_win("Voce ganhou!!");
            m_wins++;
        }
    } else {
        if(get_scoreComp() > get_scoreYou() && get_scoreComp() <= 21){
            set_win("Voce Perdeu!!");
            m_loses++;
        }
        else {
            if(get_scoreYou() <= 21) {
                set_win("Voce ganhou!!");
                m_wins++;
            }
            else {
                set_win("Voce Perdeu!!");
                m_loses++;
            }
        }
    }
    emit winsChanged(m_wins);
    emit losesChanged(m_loses);
}

void Game::end(){
    if(m_comp->score()> m_you->score()) qDebug()<<"Computador e o vencendor!";
    else if(m_you->score() <= 21) qDebug()<<"Voce e o vencendor";
    else qDebug()<<"Computador e o vencendor!";
}
