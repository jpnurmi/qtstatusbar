cmake_minimum_required(VERSION 3.16)

project(QStatusBarExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package( QT NAMES Qt6 Qt5      REQUIRED COMPONENTS Quick Core Gui QuickControls2 )
find_package( Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick Core Gui QuickControls2 )

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../QStatusBarLib/include)

qt_add_executable(
    ${PROJECT_NAME}
    main.cpp
    statusbar.qrc
)


set_target_properties(
    ${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(
    ${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::QuickControls2
    ${QStatusBarLib}
)

install(
    TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
