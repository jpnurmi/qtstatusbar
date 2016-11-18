TEMPLATE = app
TARGET = statusbar
QT += qml quick quickcontrols2
android: QT += androidextras
CONFIG += c++11

HEADERS += \
    statusbar.h

SOURCES += \
    main.cpp \
    statusbar.cpp

RESOURCES += \
    statusbar.qrc
