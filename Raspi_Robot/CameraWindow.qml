import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.4
Window{
    id:windows
    visible: true
    width: 950
    height: 520
    property var shared;
    title: qsTr("RobotView")

    Rectangle {
        id: cameraUI
        color: "black"
        state: "PhotoCapture"
        height:windows.height
        width:windows.width
        Camera {
            id: camera
            captureMode: Camera.CaptureStillImage
            videoRecorder {
                resolution: "640x480"
                frameRate: 30
            }
        }

        Image {

            id:cameraicn
            source:"file:///C:/Users/Administrator/Desktop/Qt_controls_Unity/images/capture.png"
            anchors.right: cameraUI.right
            anchors.rightMargin: 25
            anchors.top: cameraUI.top
            anchors.topMargin: 40
            height:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
            width:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
            visible: camera.imageCapture.ready
            MouseArea {
                anchors.fill: parent
                onClicked: camera.imageCapture.captureToLocation("C:/Users/Administrator/Desktop/Qt_controls_Unity/images/img.jpg")
            }
        }


        Image {

            id:usb
            source:"file:///C:/Users/Administrator/Desktop/Qt_controls_Unity/images/usb.png"
            anchors.right: cameraUI.right
            anchors.rightMargin: 25
            anchors.top: cameraicn.bottom
            anchors.topMargin: 10
            height:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
            width:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
            visible: camera.imageCapture.ready
            MouseArea {
                anchors.fill: parent
                onClicked:
                    camera.deviceId=QtMultimedia.availableCameras[1].deviceId
            }
        }

//        Button {
//            id: usb
//            text: "USB"
//            anchors.right: cameraUI.right
//            anchors.rightMargin: 25
//            anchors.top: capture.bottom
//            anchors.topMargin: 10
//            visible: camera.imageCapture.ready
//            onClicked: {

//              camera.deviceId=QtMultimedia.availableCameras[1].deviceId
//            }
//        }
        VideoOutput {
            id: viewfinder
            visible: cameraUI.state == "PhotoCapture" || cameraUI.state == "VideoCapture"
            anchors.left: cameraUI.left
            anchors.leftMargin: 50
            anchors.top: cameraUI.top
            anchors.topMargin: -35
            width: 750
            height: 600
            source: camera
            autoOrientation: true
        }
    }

}

