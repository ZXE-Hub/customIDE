# cmake_minimum_required(VERSION 3.16)

# project(customIde VERSION 0.1 LANGUAGES CXX)

# set(CMAKE_CXX_STANDARD_REQUIRED ON)

# find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

# qt_standard_project_setup()

# qt_add_executable(appcustomIde
#     main.cpp
# )

# qt_add_qml_module(customIdeApp
#     URI customIde
#     VERSION 1.0
#     QML_FILES
#         Main.qml
# )

# # Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# # If you are developing for iOS or macOS you should consider setting an
# # explicit, fixed bundle identifier manually though.
# set_target_properties(appcustomIde PROPERTIES
# #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcustomIde
#     MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
#     MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
#     MACOSX_BUNDLE TRUE
#     WIN32_EXECUTABLE TRUE
# )

# target_link_libraries(appcustomIde
#     PRIVATE Qt6::Quick
# )

# include(GNUInstallDirs)
# install(TARGETS appcustomIde
#     BUNDLE DESTINATION .
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
# )








cmake_minimum_required(VERSION 3.5)

project(customIde VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets LinguistTools Qml QuickWidgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets LinguistTools Qml QuickWidgets)

# Translation files
set(TS_FILES
    translations/customIde_en.ts
)

# Resource files
set(RES_FILES
    resources/icons.qrc
)

# Source files
set(PROJECT_SOURCES
    src/main.cpp
    ${RES_FILES}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(customIdeApp
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )

    qt_add_qml_module(customIdeApp
        URI customIde
        VERSION 1.0
        QML_FILES
            Main.qml
            SOURCES include/config.h
    )

    # Add translation processing for Qt6
    qt_add_lupdate(customIdeApp
        TS_FILES ${TS_FILES}
    )

    qt_add_lrelease(customIdeApp
        TS_FILES ${TS_FILES}
    )
else()
    if(ANDROID)
        add_library(customIde SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(customIde
            ${PROJECT_SOURCES}
        )
    endif()

    # Add translation processing for Qt5
    qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
endif()

# Link libraries
target_link_libraries(customIdeApp PRIVATE
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Qml
    Qt${QT_VERSION_MAJOR}::QuickWidgets
)

# Set properties for macOS and Windows
set_target_properties(customIdeApp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE FALSE
    WIN32_EXECUTABLE TRUE
)

# Finalize for Qt6
if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(customIdeApp)
endif()
