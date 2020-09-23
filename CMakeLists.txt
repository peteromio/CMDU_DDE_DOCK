# https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html
# https://cmake.org/cmake/help/latest/

cmake_minimum_required(VERSION 3.13)

set(PLUGIN_NAME "HTYCMDU")

project(${PLUGIN_NAME})

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

file(GLOB_RECURSE SRCS "*.h" "*.cpp")

find_package(Qt5Widgets REQUIRED)
find_package(DtkWidget REQUIRED)
find_package(PkgConfig REQUIRED)

pkg_check_modules(DdeDockInterface REQUIRED dde-dock)

add_definitions("${QT_DEFINITIONS} -DQT_PLUGIN")

add_library(${PLUGIN_NAME} SHARED ${SRCS} res.qrc)

set_target_properties(${PLUGIN_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ./)

target_include_directories(${PLUGIN_NAME} PUBLIC
    ${Qt5Widgets_INCLUDE_DIRS}
    ${DtkWidget_INCLUDE_DIRS}
    ${DdeDockInterface_INCLUDE_DIRS}
)

target_link_libraries(${PLUGIN_NAME} PRIVATE
    ${Qt5Widgets_LIBRARIES}
    ${DtkWidget_LIBRARIES}
    ${DdeDockInterface_LIBRARIES}
)

set(CMAKE_INSTALL_PREFIX "/usr")

set(PG_FILE_PATH /usr/lib/dde-dock/plugins/lib${PLUGIN_NAME}.so)

install(TARGETS ${PLUGIN_NAME} LIBRARY DESTINATION lib/dde-dock/plugins)



add_custom_target(uninstall
  COMMAND 
    ${CMAKE_COMMAND} -E remove ${PG_FILE_PATH}
  COMMENT
    "Removed ${PG_FILE_PATH}"
)