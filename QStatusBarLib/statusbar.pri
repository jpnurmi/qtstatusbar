CONFIG += c++11
INCLUDEPATH += $$PWD/include/QStatusBarLib

HEADERS += \
    $$INCLUDEPATH/statusbar.h

SOURCES += \
    $$PWD/src/statusbar.cpp

android {
    QT += androidextras

    SOURCES += \
        $$PWD/src/statusbar_android.cpp
} else:ios {
    LIBS += -framework UIKit

    OBJECTIVE_SOURCES += \
        $$PWD/src/statusbar_ios.mm
} else {
    SOURCES += \
        $$PWD/src/statusbar_dummy.cpp
}
