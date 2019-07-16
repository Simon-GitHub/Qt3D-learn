QT += quick quickcontrols2
CONFIG += c++11
DESTDIR = $$absolute_path($$PWD/bin)

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    src/main.cpp
CONFIG(debug, debug|release){
    OTHER_FILES += $$files(qml/*.qml, true) \
    $$files(qml/*.png, true) \
    $$files(qml/*.jpg, true)
} else {
    RESOURCES += qml.qrc
}
android{
    RESOURCES *= qml.qrc
}

OTHER_FILES += \
    README.md \
    .clang-format \
    .travis.yml \
    appveyor.yml \
    LICENSE \

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    qml/Config.qml \
    qml/Example/DefaultScene.qml

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
