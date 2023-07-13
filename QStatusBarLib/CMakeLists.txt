cmake_minimum_required( VERSION 3.1 )
project( QStatusBarLib LANGUAGES CXX )
set( QStatusBarLib "QStatusBarLib" CACHE INTERNAL "QStatusBarLib" )

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(
    STATUSBAR_COMMON_SOURCES
    include/QStatusBarLib/statusbar.h
    src/statusbar.cpp
)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Quick Core Gui)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick Core Gui )

# prevent error "You must build your code with position independent code if Qt was built with..
if (Qt5_POSITION_INDEPENDENT_CODE)
  SET(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

if (ANDROID)
    set(
        STATUSBAR_PLATFORM_SOURCES
        src/statusbar_android.cpp
    )
elseif ( CMAKE_SYSTEM_NAME STREQUAL iOS )
    set( STATUSBAR_PLATFORM_SOURCES src/statusbar_ios.mm )
    set( STATUSBAR_PLATFORM_LIBS "-framework UIKit" )
else()
    set( STATUSBAR_PLATFORM_SOURCES src/statusbar_dummy.cpp )
endif()

include_directories(include/QStatusBarLib)

add_library(
    ${PROJECT_NAME} OBJECT
    ${STATUSBAR_COMMON_SOURCES}
    ${STATUSBAR_PLATFORM_SOURCES}
)

target_link_libraries(
    ${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
    ${STATUSBAR_PLATFORM_LIBS}
)

target_include_directories(
    ${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
    $<TARGET_PROPERTY:Qt${QT_VERSION_MAJOR}::Core,INTERFACE_INCLUDE_DIRECTORIES>
    $<TARGET_PROPERTY:Qt${QT_VERSION_MAJOR}::Gui,INTERFACE_INCLUDE_DIRECTORIES>
)
