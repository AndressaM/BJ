#include "card.h"

Card::Card() {}

Card::Card(int value, int naipes) {
    set_value(value);
    set_naipes(naipes);
}

QString Card::get() {
    return '[' + QString::number(get_value()) + ']';
}
