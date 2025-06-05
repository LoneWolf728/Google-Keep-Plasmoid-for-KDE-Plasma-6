cmake_minimum_required(VERSION 3.16)
project(googlekeepwidget VERSION 1.0.0)

set(QT_MIN_VERSION "6.4.0")
set(KF_MIN_VERSION "6.0.0")

find_package(ECM ${KF_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

# Required components
find_package(Qt6 ${QT_MIN_VERSION} REQUIRED COMPONENTS 
    Core 
    Gui 
    Quick
)

# Required KF6 components for Plasma 6
find_package(KF6 ${KF_MIN_VERSION} REQUIRED COMPONENTS
    Package
    CoreAddons
    Plasma
)

# Make PlasmaQuick optional since it might not be available in all distributions
find_package(KF6PlasmaQuick ${KF_MIN_VERSION} QUIET)
if(KF6PlasmaQuick_FOUND)
    message(STATUS "Found KF6PlasmaQuick")
else()
    message(STATUS "KF6PlasmaQuick not found - proceeding without it")
endif()

# Optional WebEngine component
find_package(Qt6WebEngine ${QT_MIN_VERSION} QUIET)
if(Qt6WebEngine_FOUND)
    add_definitions(-DHAVE_QTWEBENGINE)
    message(STATUS "Building with Qt WebEngine support")
else()
    message(STATUS "Qt WebEngine not found, building simplified version")
endif()

# Install the plasmoid
plasma_install_package(package org.kde.plasma.googlekeep)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)