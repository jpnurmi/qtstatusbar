TEMPLATE = app
TARGET = statusbar
QT += qml quick quickcontrols2

include(../src/statusbar.pri)

SOURCES += \
    main.cpp

RESOURCES += \
    statusbar.qrc
