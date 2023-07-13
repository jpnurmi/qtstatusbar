TEMPLATE = app
TARGET = statusbar
QT += qml quick quickcontrols2

include(../QStatusBarLib/statusbar.pri)
INCLUDEPATH += ../QStatusBarLib/include

SOURCES += \
    main.cpp

RESOURCES += \
    statusbar.qrc
