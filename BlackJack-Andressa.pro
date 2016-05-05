TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    card.cpp \
    game.cpp \
    player.cpp \
    data.cpp \
    assets/cpp/qqmlobjectlistmodel.cpp \
    judge.cpp

RESOURCES += qml.qrc \
    source.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    card.h \
    game.h \
    player.h \
    data.h \
    assets/cpp/qqmlobjectlistmodel.h \
    judge.h
