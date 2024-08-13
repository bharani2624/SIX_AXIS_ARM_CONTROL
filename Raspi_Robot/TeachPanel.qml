import QtQuick 2.0
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.3
import QtQuick.Controls 1.3

Rectangle{
    id:mainrect
    height:200
    width: 300
    color:"black"
    property variant win;
    property int camflag: 0
    property int startstop: 1
    Rectangle{
        id:toprect
        height:mainrect.height/2+5
        width:mainrect.width
        color: "transparent"
        border.color: "white"
        anchors.top: mainrect.top
        anchors.topMargin: 5
        anchors.left: mainrect.left
        radius:5

        Image {
            id:camera
            source:camflag? "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/cameraon.png":"file:///D:/Raspi_Robot/Raspi_Robot/images/cameraoff.png"
            anchors.top: toprect.top
            anchors.topMargin: 7
            anchors.right:toprect.right
            anchors.rightMargin: 10
            height:(mainrect.height*0.06 + mainrect.width *0.08)/2
            width:(mainrect.height*0.06 + mainrect.width *0.08)/2
            MouseArea {
                anchors.fill: parent
                onPressed: {


                }
                onReleased: {

                }
            }
        }
        Rectangle{
            id:joystick
            height:150
            width:150
            color:"transparent"
            anchors.top: toprect.top
            anchors.topMargin: 30
            anchors.bottom:toprect.bottom
            anchors.bottomMargin: 70
            anchors.left: toprect.left
            anchors.right: toprect.right
            anchors.leftMargin: toprect.width*0.5
            anchors.rightMargin: 150
            RectangularGlow{
                id: uprectglow
                anchors.fill: up
                glowRadius: 3
                spread: 0.5
                color: "white"
                cornerRadius: 30
            }
            Rectangle {
                id: up
                width: joystick.width*0.3
                height: joystick.height*0.26
                color: "black"
                border.color: "white"
                radius: 30
                anchors.top: joystick.top
                anchors.topMargin: (joystick.width*0.3+joystick.height*0.26)/6
                anchors.left: joystick.left
                anchors.leftMargin: 120
                Image{
                    id:gameup
                    source:"file:///D:/Raspi_Robot/Raspi_Robot/images/up.png"
                    height:(up.height+up.width)/2.5
                    width:(up.height+up.width)/2.5
                    smooth: true
                    anchors.centerIn: up
                }
                Glow{
                    id:upglow
                    anchors.fill: gameup
                    radius: 7
                    samples: 17
                    color: "#F70D1A"
                    source: gameup
                    spread: 0.5
                }
                MouseArea{
                    anchors.fill:gameup
                    onPressed: {
                    send.sendData("2|Forward|"+"3")
                        upglow.radius=10
                        uprectglow.glowRadius=5


                    }
                    onReleased : {
                        upglow.radius=7
                        uprectglow.glowRadius=3

                    }
                }
            }


            RectangularGlow{
                id: downrectglow
                anchors.fill: down
                glowRadius: 3
                spread: 0.5
                color: "white"
                cornerRadius: 30
            }
            Rectangle{
                id:down
                width: joystick.width*0.3
                height: joystick.height*0.26
                color:"black"
                border.color: "white"
                radius:30
                anchors.top:left.bottom
                anchors.left: up.left

                Image{
                    id:gamedown
                    source:"file:///D:/Raspi_Robot/Raspi_Robot/images/down.png"
                    height:(down.height+down.width)/2.5
                    width:(down.height+down.width)/2.5
                    smooth: true
                    anchors.centerIn: down
                }
                Glow{
                    id:downglow
                    anchors.fill: gamedown
                    radius: 7
                    samples: 17
                    color: "red"
                    source: gamedown
                    spread: 0.5
                }
                MouseArea{
                    anchors.fill:gamedown
                    onPressed: {
                        downglow.radius=10
                        downrectglow.glowRadius=5
                          send.sendData("2|Backward|"+"3")
                    }
                    onReleased : {
                        downglow.radius=7
                        downrectglow.glowRadius=3
                    }
                }

            }
            RectangularGlow{
                id: leftrectglow
                anchors.fill: left
                glowRadius: 3
                spread: 0.5
                color: "white"
                cornerRadius: 30
            }
            Rectangle{
                id:left
                width: joystick.width*0.3
                height: joystick.height*0.26
                color:"black"
                border.color: "white"
                radius:30
                anchors.top:up.bottom
                anchors.right: up.left

                Image{
                    id:gameleft
                    source:"file:///D:/Raspi_Robot/Raspi_Robot/images/left.png"
                    height:(left.height+left.width)/2.5
                    width:(left.height+left.width)/2.5
                    smooth: true
                    anchors.centerIn: left
                }
                Glow{
                    id:leftglow
                    anchors.fill: gameleft
                    radius: 7
                    samples: 17
                    color: "red"
                    source: gameleft
                    spread: 0.5
                }
                MouseArea{
                    anchors.fill:gameleft
                    onPressed: {
                        leftglow.radius=10
                        leftrectglow.glowRadius=5
                    }
                    onReleased : {
                        leftglow.radius=7
                        leftrectglow.glowRadius=3
                    }
                }
            }

            RectangularGlow{
                id: rightrectglow
                anchors.fill: right
                glowRadius: 3
                spread: 0.5
                color: "white"
                cornerRadius: 30
            }
            Rectangle{
                id:right
                width: joystick.width*0.3
                height: joystick.height*0.26
                color:"black"
                border.color: "white"
                radius:30
                anchors.top:up.bottom
                anchors.left: up.right
                Image{
                    id:gameright
                    source:"file:///D:/Raspi_Robot/Raspi_Robot/images/right.png"
                    height:(right.height+right.width)/2.5
                    width:(right.height+right.width)/2.5
                    smooth: true
                    anchors.centerIn: right
                }
                Glow{
                    id:rightglow
                    anchors.fill: gameright
                    radius: 7
                    samples: 17
                    color: "red"
                    source: gameright
                    spread: 0.5
                }
                MouseArea{
                    anchors.fill:gameright
                    onPressed: {
                        rightglow.radius=10
                        rightrectglow.glowRadius=5
                    }
                    onReleased : {
                        rightglow.radius=7
                        rightrectglow.glowRadius=3
                    }
                }
            }
        }
        Rectangle{
            id:tumblerforAction
            height:(toprect.height *0.2+toprect.width*0.2)/1
            width:(toprect.height*0.2+toprect.width*0.2)/1
            color:"transparent"
            anchors.left:toprect.left
            anchors.leftMargin: 40
            anchors.top: toprect.top
            anchors.topMargin: 70
            anchors.bottom: toprect.bottom
            anchors.bottomMargin: 130
            anchors.right: joystick.left
            anchors.rightMargin: 180
            Tumbler {
                id: controlforAction
                model: ["ColorSorting", "Facefollow","Recognition","Fruits&Vegetables","GarbageSorting"]
                anchors.top:tumblerforAction.top
                anchors.topMargin: 10
                anchors.right:tumblerforAction.right
                anchors.left: tumblerforAction.left
                anchors.bottom: tumblerforAction.bottom
                onCurrentIndexChanged:{

                }
                delegate: Text {
                    text: modelData
                    font.pointSize: (toprect.height*0.06 + toprect.width*0.10)/8
                    color:"white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (controlforAction.visibleItemCount / 2)
                }

                Rectangle {
                    anchors.horizontalCenter: controlforAction.horizontalCenter
                    y: controlforAction.height * 0.4
                    width: 60
                    height: 2
                    color: controlforAction.moving?"#FF4545":"#00FF00"
                }

                Rectangle {
                    anchors.horizontalCenter: controlforAction.horizontalCenter
                    y: controlforAction.height * 0.6
                    width: 60
                    height: 2
                    color:controlforAction.moving?"#FF4545":"#00FF00"
                }
            }
        }
        RectangularGlow {
            id: pickeffect
            anchors.fill: pick
            glowRadius: 3
            spread: 0.5
            color: "white"
            cornerRadius: 30

        }
        Rectangle {
            id: pick
            color: "black"
            anchors.left: toprect.left
            anchors.leftMargin: 150
            border.color:"white"
            anchors.top:tumblerforAction.bottom
            anchors.topMargin: toprect.height*0.10
            width: toprect.width*0.14
            height: toprect.height*0.11
            radius: 25
            Text{
                id:picktext
                text:"Pick"
                anchors.centerIn: parent
                color:"white"
                font.pointSize: (toprect.height*0.06 + toprect.width*0.10)/9
            }
            MouseArea {
                anchors.fill:pick
                onClicked: {
                    picktext.text="Release"
                    picktext.color="#F67280"
                    pickeffect.color="#FF4545"
                    pick.border.color="#FF4545"

                }


                onPressed: {
                    pickeffect.glowRadius= 10

                }
                onReleased: {

                    pickeffect.glowRadius=5

                }

                onDoubleClicked: {
                    pick.border.color ="white"
                    picktext.text="Pick"
                    picktext.color="light gray"
                    pickeffect.color="white"

                }
            }

        }
        Rectangle{
            id:tumbler
            height:(toprect.height *0.2+toprect.width*0.2)/1
            width:(toprect.height*0.2+toprect.width*0.2)/1
            color:"transparent"
            anchors.left:toprect.left
            anchors.leftMargin: 200
            anchors.top: toprect.top
            anchors.topMargin: 70
            anchors.bottom: toprect.bottom
            anchors.bottomMargin: 130
            anchors.right: joystick.left
            anchors.rightMargin: 10
            Tumbler {
                id: control
                model: ["Position","Base", "Shoulder","Elbow","Wrist","Finger","Tip"]
                anchors.top:tumbler.top
                anchors.topMargin: 10
                anchors.right:tumbler.right
                anchors.left: tumbler.left
                anchors.bottom: tumbler.bottom
                onCurrentIndexChanged:{

                    if(control.model[control.currentIndex] === "Base" || control.model[control.currentIndex] === "Tip" || control.model[control.currentIndex] === "Wrist"){
                        up.visible = false
                        down.visible = false
                        left.visible =true
                        right.visible = true
                        uprectglow.visible =false
                        downrectglow.visible =false
                        leftrectglow.visible =true
                        rightrectglow.visible =true
                    }
                    else if(control.model[control.currentIndex] === "Position"){
                        up.visible = true
                        down.visible = true
                        left.visible =true
                        right.visible = true
                        uprectglow.visible =true
                        downrectglow.visible =true
                        leftrectglow.visible =true
                        rightrectglow.visible =true
                    }
                    else if(control.model[control.currentIndex] === "Shoulder" || control.model[control.currentIndex] === "Elbow" || control.model[control.currentIndex] === "Finger"){
                        up.visible = true
                        down.visible = true
                        left.visible =false
                        right.visible = false
                        uprectglow.visible =true
                        downrectglow.visible =true
                        leftrectglow.visible =false
                        rightrectglow.visible =false
                    }
                }
                delegate: Text {
                    text: modelData
                    font.pointSize: (toprect.height*0.06 + toprect.width*0.10)/8
                    color:"white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2)
                }

                Rectangle {
                    anchors.horizontalCenter: control.horizontalCenter
                    y: control.height * 0.4
                    width: 60
                    height: 2
                    color: control.moving?"#FF4545":"#00FF00"
                }

                Rectangle {
                    anchors.horizontalCenter: control.horizontalCenter
                    y: control.height * 0.6
                    width: 60
                    height: 2
                    color:control.moving?"#FF4545":"#00FF00"
                }

            }
        }

    }

    Rectangle{
        id:bottomrect
        height:mainrect.height/2.1
        width:mainrect.width
        color: "transparent"
        border.color: "white"
        anchors.bottom: mainrect.bottom
        anchors.bottomMargin: 5
        anchors.left: mainrect.left
        radius:5
        MouseArea{
            anchors.fill: bottomrect
            onClicked: {
                contextMenu.visible =false
            }
        }
        Rectangle {
            id: contextMenu
            width: bottomrect.width*0.09
            height: bottomrect.height*0.09
            color:"black"
            border.color:"white"
            anchors.top: menu.top
            anchors.bottom: menu.bottom
            anchors.right:menu.left
            anchors.leftMargin: -10
            visible: false

            Rectangle{
                id:menu1
                height:contextMenu.height/2
                width:contextMenu.width
                anchors.top : contextMenu.top
                color:"transparent"
                border.color:"white"
                anchors.left: contextMenu.left
                anchors.right:contextMenu.right
                Text {
                    id: menu1text
                    text: qsTr("Guide")
                    anchors.centerIn: menu1
                    color:"white"
                }
                MouseArea{
                    anchors.fill:menu1
                    hoverEnabled:true
                    onEntered: {
                        menu1.color="#3c8edb"
                        menu1text.color="black"
                    }
                    onExited: {
                        menu1.color="black"
                        menu1text.color="white"
                    }
                    onClicked: {
                        console.log("Guide")
                        var windows= Qt.createComponent("GuideWindow.qml")
                        win = windows.createObject(menu1)
                        win.show()
                        contextMenu.visible =false
                    }
                }
            }

            Rectangle{
                id:menu2
                height:contextMenu.height/2
                width:contextMenu.width
                anchors.top : menu1.bottom
                color:"transparent"
                border.color:"white"
                anchors.left: contextMenu.left
                anchors.right:contextMenu.right
                Text {
                    id: menu2text
                    text: qsTr("ResetCmd")
                    anchors.centerIn: menu2
                    color:"white"
                }
                MouseArea{
                    anchors.fill:menu2
                    hoverEnabled:true
                    onEntered: {
                        menu2.color="#3c8edb"
                        menu2text.color="black"
                    }
                    onExited: {
                        menu2.color="black"
                        menu2text.color="white"
                    }
                    onClicked: {
                        console.log("Reset")
                        contextMenu.visible =false
                    }
                }
            }
        }
        Image{
            id:menu
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/menu.png"
            anchors.top: bottomrect.top
            anchors.topMargin: 7
            anchors.right:bottomrect.right
            anchors.rightMargin: 2
            height:(mainrect.height*0.06 + mainrect.width *0.08)/3
            width:(mainrect.height*0.06 + mainrect.width *0.08)/3
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    contextMenu.visible=true
                }
            }
        }
        Rectangle{
            id:tabrect
            height:420
            width:300
            color:"transparent"
            anchors.top: bottomrect.top
            anchors.topMargin: 15
            anchors.left: bottomrect.left
            anchors.leftMargin: 10
            anchors.right: bottomrect.right
            anchors.rightMargin: 300
            anchors.bottom: bottomrect.bottom
            anchors.bottomMargin: 10
            TableView {
                id:tableview
                anchors.top: tabrect.top
                anchors.bottom: tabrect.bottom
                anchors.bottomMargin: 10
                anchors.right: tabrect.right
                anchors.left: tabrect.left
                width: 600
                height: 420
                TableViewColumn{ role: "axisname"  ; title: "Axis" ; width: tableview.width/4 ;resizable: true ; movable: true }
                TableViewColumn{ role: "x" ; title: "X" ; width: tableview.width/4 ;resizable: true ; movable: true }
                TableViewColumn{ role: "y" ; title: "Y" ; width: tableview.width/4 ;resizable: true ; movable: true }
                TableViewColumn{ role: "z" ; title: "Z" ; width: tableview.width/4 ; resizable: true ; movable: true  }
                model: ListModel{
                    id: tV

                }

                alternatingRowColors: true
                backgroundVisible: true
                headerVisible: true
                itemDelegate: Item {
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        elide: styleData.elideMode
                        text: styleData.value
                        font.pointSize: (bottomrect.height*0.06 + bottomrect.width*0.10)/12
                    } // text
                } // Item

                onDoubleClicked: {
                    tV.remove(tableview.currentIndex);
                }
            }// TableView
        }
        Image{
            id:archive
            height:(mainrect.height*0.06 + mainrect.width *0.08)/5
            width:(mainrect.height*0.06 + mainrect.width *0.08)/5
            anchors.left: tabrect.right
            anchors.leftMargin: 5
            anchors.top:tabrect.top
            source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/cloud.png"
            MouseArea{
                anchors.fill:archive
                onClicked: {

                }
            }
        }
        RectangularGlow {
            id: loadeffect
            anchors.fill: load
            glowRadius: 5
            spread: 0.5
            color: "#FF4545"
            cornerRadius: 25
        }
        Rectangle {
            id: load
            color: "black"
            anchors.right: bottomrect.right
            anchors.rightMargin: 80
            anchors.top:bottomrect.top
            anchors.topMargin: bottomrect.height*0.14
            width: bottomrect.width*0.18
            height: bottomrect.height*0.11
            radius: 25
            Text{
                id:loadtext
                text:"Load"
                anchors.right: load.right
                anchors.rightMargin:load.width/3.3
                anchors.top: load.top
                anchors.topMargin: load.height/4.2
                color:"#FF4545"
                font.pointSize: (bottomrect.height*0.06 + bottomrect.width*0.10)/9
            }
            Image{
                id:loaded
                height:(mainrect.height*0.06 + mainrect.width *0.08)/5.5
                width:(mainrect.height*0.06 + mainrect.width *0.08)/5.5
                anchors.right: loadtext.left
                anchors.rightMargin: 5
                anchors.top:load.top
                anchors.topMargin: 12
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/load.png"

            }
            MouseArea {
                anchors.fill: load
                onClicked: {

                }
                onPressed: {

                    loadeffect.glowRadius= 10
                }
                onReleased: {
                    loadeffect.glowRadius=5

                }
            }
        }
        RectangularGlow {
            id: saveeffect
            anchors.fill: save
            glowRadius: 5
            spread: 0.5
            color   : "#86C232"
            cornerRadius: 25
        }
        Rectangle {
            id: save
            color: "black"
            anchors.right: bottomrect.right
            anchors.rightMargin: 80
            anchors.top:load.bottom
            anchors.topMargin: bottomrect.height*0.10
            width: bottomrect.width*0.18
            height: bottomrect.height*0.11
            radius: 25
            Text{
                id:savetext
                text:"Save"
                anchors.right: save.right
                anchors.rightMargin:save.width/3.3
                anchors.top: save.top
                anchors.topMargin: save.height/4.2
                color:"#86C232"
                font.pointSize: (bottomrect.height*0.06 + bottomrect.width*0.10)/9
            }
            Image{
                id:saved
                height:(mainrect.height*0.06 + mainrect.width *0.08)/5.5
                width:(mainrect.height*0.06 + mainrect.width *0.08)/5.5
                anchors.right: savetext.left
                anchors.rightMargin: 5
                anchors.top:save.top
                anchors.topMargin:12
                source: "file:///D:/Raspi_Robot/Raspi_Robot/images/load.png"
            }
            MouseArea {
                anchors.fill: save

                onClicked: {

                }
                onPressed: {
                    saveeffect.glowRadius= 10
                }
                onReleased: {
                    saveeffect.glowRadius=5
                }
            }
        }

        RectangularGlow {
            id: previeweffect
            anchors.fill: preview
            glowRadius: 5
            spread: 0.5
            color   : "#9AFEFF"
            cornerRadius: 25
        }
        Rectangle {
            id: preview
            color: "black"
            anchors.right: bottomrect.right
            anchors.rightMargin: 80
            anchors.top:save.bottom
            anchors.topMargin: bottomrect.height*0.10
            width: bottomrect.width*0.18
            height: bottomrect.height*0.11
            radius: 25
            Text{
                id:previewtext
                text:"Preview"
                anchors.right: preview.right
                anchors.rightMargin:preview.width/4
                anchors.top: preview.top
                anchors.topMargin: preview.height/4.5
                color:"#9AFEFF"
                font.pointSize: (bottomrect.height*0.06 + bottomrect.width*0.10)/9
            }
            Image{
                id:pre
                height:(mainrect.height*0.06 + mainrect.width *0.08)/6
                width:(mainrect.height*0.06 + mainrect.width *0.08)/6
                anchors.right: previewtext.left
                anchors.rightMargin: 5
                anchors.top:preview.top
                anchors.topMargin:14
                source: "file:///D:/Raspi_Robot/Raspi_Robot/images/preview.png"
            }
            MouseArea {
                anchors.fill: preview

                onPressed: {

                    previeweffect.glowRadius = 10;
                }
                onReleased: {
                    previeweffect.glowRadius=5

                }
            }
        }
        //        RectangularGlow {
        //            id: cameraeffect
        //            anchors.fill: camera
        //            glowRadius: 5
        //            spread: 0.5
        //            color   : "#9AFEFF"
        //            cornerRadius: 25
        //        }
        //        Rectangle {
        //            id: camera
        //            color: "black"
        //            anchors.right: bottomrect.right
        //            anchors.rightMargin: 80
        //            anchors.top:preview.bottom
        //            anchors.topMargin: bottomrect.height*0.10
        //            width: bottomrect.width*0.17
        //            height: bottomrect.height*0.09
        //            radius: 25
        //            Text{
        //                id:cameratext
        //                text:"Camera"
        //                anchors.centerIn: camera
        //                color:"#9AFEFF"
        //                font.pointSize:(bottomrect.height*0.06 + bottomrect.width*0.10)/9
        //            }
        //            MouseArea {
        //                anchors.fill: camera
        //                onClicked: {
        //                    var component = Qt.createComponent("Cam.qml");
        //                    win = component.createObject(camera);
        //                    win.show();
        //                }
        //                onPressed: {
        //                    cameraeffect.glowRadius= 10
        //                }
        //                onReleased: {
        //                    cameraeffect.glowRadius=5
        //                }
        //            }
        //        }
        RectangularGlow {
            id: reseteffect
            anchors.fill: reset
            glowRadius: 5
            spread: 0.5
            color: "#fba609"
            cornerRadius: 25
        }
        Rectangle {
            id: reset
            color: "black"
            anchors.right: bottomrect.right
            anchors.rightMargin: 80
            anchors.top:preview.bottom
            anchors.topMargin: bottomrect.height*0.10
            width: bottomrect.width*0.18
            height: bottomrect.height*0.11
            radius: 25
            Text{
                id:resettext
                text:"Reset"
                anchors.right: reset.right
                anchors.rightMargin:reset.width/3.3
                anchors.top: reset.top
                anchors.topMargin: reset.height/4.2
                color:"#fba609"
                font.pointSize: (bottomrect.height*0.06 + bottomrect.width*0.10)/9
            }


            Image{
                id:reseted
                height:(mainrect.height*0.06 + mainrect.width *0.08)/5
                width:(mainrect.height*0.06 + mainrect.width *0.08)/5
                anchors.right: resettext.left
                anchors.rightMargin: 5
                anchors.top:reset.top
                anchors.topMargin:12
                source: "file:///D:/Raspi_Robot/Raspi_Robot/images/reset1.png"
            }
            MouseArea {
                anchors.fill: reset
                onPressed:  {

                    reseteffect.glowRadius= 10
                    pick.border.color ="white"
                    picktext.text="Pick"
                    picktext.color="white"
                    pickeffect.color="white"
                }
                onReleased: {
                    reseteffect.glowRadius=5
                }
            }
        }
    }
}
