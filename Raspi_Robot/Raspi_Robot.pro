QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        sender.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    CameraWindow.qml \
    images/axisarrow.png \
    images/back.png \
    images/background.png \
    images/btn.png \
    images/cameraoff.png \
    images/cameraon.png \
    images/capture.png \
    images/cloud.png \
    images/down.png \
    images/icons8-download-64 (1).png \
    images/img.jpg \
    images/left.png \
    images/load.png \
    images/log.txt \
    images/menu.png \
    images/nosignal.png \
    images/pause.png \
    images/preview.png \
    images/pythonfile.txt \
    images/recognized_text.txt \
    images/reset.png \
    images/reset1.png \
    images/right.png \
    images/run.png \
    images/save.png \
    images/signal.png \
    images/speedarrow.png \
    images/speedometerwarning.png \
    images/speedwarning.png \
    images/tickmark.svg \
    images/tp.txt \
    images/up.png \
    images/usb.png \
    images/voice.png \
    images/warning.png

HEADERS += \
    sender.h
