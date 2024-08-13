import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.12

Window {
    id:mainrect
    visible: true
    width: 600
    height: 450
    TabView {
        id: frame
        height: mainrect.height
        width:mainrect.width
        anchors.margins: 4
        Tab { title: "ControlPanel"
            NotificationManager{
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.bottom:parent.bottom
            }
        }
        Tab { title: "TeachPanel"
            Notification{
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top:parent.top
                anchors.bottom:parent.bottom
            }
        }
        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "black" :"lightsteelblue"
                implicitWidth: mainrect.width*0.50
                implicitHeight: mainrect.height*0.08
                radius: 2
                Text {
                    id: tabtext
                    anchors.centerIn: parent
                    text: styleData.title
                    font.bold:true
                    color: styleData.selected ? "#00FFFF" : "white"
                    font.pointSize: 15
                }
            }
            frame: Rectangle { color: "black"
            }
        }
    }
}

