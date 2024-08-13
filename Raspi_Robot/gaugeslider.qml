import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.3
import QtQuick.Extras 1.4
import QtQuick.Window 2.12
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.3



Rectangle{
    id:mainrect
    color:"black"
    property string name;
    property variant win;
    property var st;
    property int camflag: 0
    property int startstop: 0
    function change(){
        if(startstop  == 0){
            popup.visible=true
            notification.text = "Please start before giving commands!"
            speedwarning.visible =true
            speedwarning.source = "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/warning.png"
            notification.color ="#FFD782"
            speedwarning.anchors.topMargin=0
            speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2.5
            speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2.5
            popup.anchors.leftMargin= (mainrect.width/2)
            popup.anchors.rightMargin= (mainrect.width/2)
        }
        else{
            popup.visible=true
            notification.text = "Please Set Speed before Command!"
            speedwarning.visible =true
            speedwarning.source = "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/speedometerwarning.png"
            notification.color ="light gray"
            speedwarning.anchors.topMargin=0
            speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2.5
            speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2.5
            popup.anchors.leftMargin= (mainrect.width/2)
            popup.anchors.rightMargin= (mainrect.width/2)
        }
    }


    Rectangle {
        id:popup
        anchors.top: mainrect.top
        anchors.topMargin: 60
        anchors.right: mainrect.right
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/2)
        anchors.rightMargin: (mainrect.width/2)
        width: (mainrect.height*0.33 + mainrect.width*0.33)/10
        height:(mainrect.height*0.33 + mainrect.width*0.33)/10
        color: "transparent"
        visible: false
        Text {
            id:notification
            anchors.centerIn: parent
            font.pixelSize: (mainrect.height*0.06 + mainrect.width*0.10)/6
        }
        Image {
            id: speedwarning
            anchors.top: popup.top
            anchors.topMargin:0
            anchors.right:notification.left
            anchors.rightMargin: 9
            visible: false
        }
        Timer {
            id: timer
            interval: 1500;
            running: false;
            repeat: false
            onTriggered: {
                popup.visible =false
                speedwarning.visible =false
            }
        }
        onVisibleChanged: {
            if(visible)
                timer.running = true;
        }
    }


    Image {
        id:wifi
        source: 1?"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/signal.png":"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/nosignal.png"
        anchors.top: mainrect.top
        anchors.topMargin: 7
        anchors.left:mainrect.left
        anchors.leftMargin: 10
        height:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
        width:(mainrect.height*0.06 + mainrect.width *0.08)/1.5
    }//WIFI CONNECCT
    Image {
        id:loadfile
        source:"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/f.png"
        anchors.top: mainrect.top
        anchors.topMargin:10
        anchors.right:voice.left
        anchors.rightMargin: 24
        height:(mainrect.height*0.06 + mainrect.width *0.08)/2.7
        width:(mainrect.height*0.06 + mainrect.width *0.08)/2.7
        MouseArea{
            anchors.fill: loadfile

            onPressed: {
                if(startstop){
                    fileDialog.visible = true

                }
                else{
                    change()
                }

            }
        }
    }//WIFI CONNECCT
    Loader{
        id:load
    }

    Image {
        id:voice
        source:"file:///D:/Raspi_Robot/Raspi_Robot/images/voice.png"
        anchors.top: mainrect.top
        anchors.topMargin:10
        anchors.right:camera.left
        anchors.rightMargin: 24
        height:(mainrect.height*0.06 + mainrect.width *0.08)/2.4
        width:(mainrect.height*0.06 + mainrect.width *0.08)/2.4
        MouseArea{
            anchors.fill: voice
            onClicked: {
                if(startstop){}
                //   unityWidgetClass.pyspeech()
                else{
                  change()
                }
            }
        }
    }
    Image {
        id:toggle
        source:"file:///D:/Raspi_Robot/Raspi_Robot/images/toggle.png"
        anchors.top: mainrect.top
        anchors.topMargin:10
        anchors.right:voice.left
        anchors.rightMargin: 24
        height:(mainrect.height*0.06 + mainrect.width *0.08)/2.4
        width:(mainrect.height*0.06 + mainrect.width *0.08)/2.4
        MouseArea{
            anchors.fill: toggle
            onClicked: {
                on1()


            }
        }
    }
    //WIFI CONNECCT

    Image {

        id:camera
        source:camflag? "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/cameraon.png":"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/cameraoff.png"
        anchors.top: mainrect.top
        anchors.topMargin: 7
        anchors.right:mainrect.right
        anchors.rightMargin: 10
        height:(mainrect.height*0.06 + mainrect.width *0.08)/2
        width:(mainrect.height*0.06 + mainrect.width *0.08)/2
        MouseArea {
            anchors.fill: parent
            onPressed: {
                if(startstop){
                    if( camflag == 0){
                        // unityWidgetClass.changeVal("fpsviewON|0");
                        camflag =1;
                        var component = Qt.createComponent("CameraWindow.qml");
                        win = component.createObject(camera);
                        win.show();
                    }
                    else{
                        //  unityWidgetClass.changeVal("fpsviewOFF|0");
                        camflag =0;
                    }
                }
                else{
                    change()
                }
            }
            onReleased: {
                if(camflag == 1){
                    // unityWidgetClass.stopSending();
                }
                if(camflag == 0){
                    // unityWidgetClass.stopSending();
                }
            }
        }
    }

    RectangularGlow {
        id: connecteffect
        anchors.fill: connect
        glowRadius: 5
        spread: 0.5
        color: "#00FF00"
        cornerRadius: 25
    }
    Rectangle {
        id: connect
        color: "black"
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.height*0.25 + mainrect. width*0.5)/8
        anchors.top:speedometer.bottom
        anchors.topMargin:(mainrect.height *2 + mainrect.width *2)/18
        width: mainrect.width*0.17
        height: mainrect.height*0.055
        radius: 25
        Text{
            id:connecttext
            text:"Pick"
            anchors.centerIn: connect
            color:"#99C68E"
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/11
        }
        MouseArea {
            anchors.fill: connect

            onClicked: {
                if(startstop){
                    connecttext.text="Release"
                    connecttext.color="#F67280"
                    connecteffect.color="#FF4545"
                }
                else{
                    change();
                }
            }
            onPressed: {
                if(startstop)
                    connecteffect.glowRadius= 10
                else{
                    change()
                }
            }
            onReleased: {
                if(startstop){
                    connecteffect.glowRadius=5
                }
                else{
                    change();
                }
            }
            onDoubleClicked: {
                if(startstop){
                    connecttext.text="Pick"
                    connecttext.color="#99C68E"
                    connecteffect.color="#00FF00"
                }
                else{
                    change();
                }
            }
        }
    }

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
        anchors.left: connect.right
        anchors.leftMargin: 35
        anchors.top:speedometer.bottom
        anchors.topMargin:(mainrect.height *2 + mainrect.width *2)/18
        width: mainrect.width*0.17
        height: mainrect.height*0.055
        radius: 25
        Text{
            id:resettext
            text:"Restore"
            anchors.centerIn: reset
            color:"#f2e9a5"
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/11
        }
        MouseArea {
            anchors.fill: reset
            onClicked: {
                camera.source='file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/cameraoff.png'
                popup.visible=true
                send.sendData("Reset")
                send.sendDataUnity("Reset")
                notification.text ="Restore Successfull"
                notification.color ="#19CC5D"
                speedwarning.visible =true
                speedwarning.anchors.topMargin=5
                speedwarning.source ="file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/reset.png"
                speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2.7
                speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2.7
                connecttext.text ="Pick"
                connecttext.color="#99C68E"
                connecteffect.color="#00FF00"
                starttext.text ="Start"
                startstop=1
                speedometer.value=0
                s1.value=0
                starttext.color ="#FFFFE0"
                starteffect.color="#FFFF33"

            }
            onPressed: {

                reseteffect.glowRadius= 10
            }
            onReleased: {

                reseteffect.glowRadius=5
            }
        }
    }
    RectangularGlow {
        id: starteffect
        anchors.fill: start
        glowRadius: 4
        spread: 0.5
        color: "#FFFF33"
        cornerRadius: 25
    }
    Rectangle {
        id: start
        color: "black"
        anchors.left: reset.right
        anchors.leftMargin: 35
        anchors.top:speedometer.bottom
        anchors.topMargin:(mainrect.height *2 + mainrect.width *2)/18
        width: mainrect.width*0.17
        height: mainrect.height*0.055
        radius: 25
        Text{
            id:starttext
            text:"Start"
            anchors.centerIn: start
            color:"#FFFFE0"
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/11
        }
        MouseArea {
            anchors.fill: start
            onClicked: {
                startstop = 1
                popup.visible = true
                notification.text ="Started"
                popup.visible=true
                notification.color ="#99C68E"
                speedwarning.visible =true
                speedwarning.anchors.topMargin=0
                speedwarning.source ="file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/pause.png"
                speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2
                speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2
                starttext.text="Stop"
                starttext.color ="#F89880"
                starteffect.color="#FF6700"
            }
            onPressed: {
                starteffect.glowRadius= 8
            }
            onReleased: {
                starteffect.glowRadius=4
            }
            onDoubleClicked: {
                startstop = 0
                popup.visible = true
                notification.text ="Stopped"
                popup.visible=true
                notification.color ="#CC3A19"
                speedwarning.visible =true
                speedwarning.anchors.topMargin=0
                speedwarning.source ="file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/run.png"
                speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2
                speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2
                starttext.text ="Start"
                starttext.color ="#FFFFE0"
                starteffect.color="#FFFF33"
            }
        }
    }

    ComboBox {
        id: root
        property color checkedColor: "#1ABC9C"
        model: ["Choose Action", "Color Sorting", "Face follow","Face Recognition","Fruits&Vegetables","Garbage Sorting"]
        anchors.top:speedometer.bottom
        anchors.topMargin: (mainrect.height *2 + mainrect.width *2)/18
        anchors.left: start.right
        anchors.leftMargin: 30
        width: mainrect.width*0.17
        height: mainrect.height*0.061

        delegate: ItemDelegate {
            width: root.width
            contentItem: Text {
                text: modelData
                anchors.centerIn: parent
                color:"white"
                font.family: "Arial"
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
            }
            background: Rectangle {
                width: parent.width
                height: parent.height
                color: "transparent"
                radius:25
                border.color:root.highlightedIndex === index ? root.checkedColor : "black"
            }
        }
        indicator: Canvas {
            id: canvas
            x:root.width - width - root.rightPadding
            y: root.topPadding + (root.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"
            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = "white"
                context.fill();
            }
        }
        contentItem: Item {
            width: root.background.width - root.indicator.width - 10
            height: root.background.height
            Text {
                anchors.centerIn: parent
                x: 10
                text: root.displayText
                elide: Text.ElideRight
                font.family: "Arial"
                font.weight: Font.Thin
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/14
                color: root.down ? Qt.rgba(255, 255, 255, 0.75) : "white"
            }
        }
        background: Rectangle {
            implicitWidth: 150
            implicitHeight: 41
            color: "transparent"
            border.color:"#00FFFF"
            border.width: root.visualFocus ? 2 : 1
            radius:30
            layer.enabled: root.hovered | root.down
            layer.effect: DropShadow {
                transparentBorder: true
                color: "#00FFFF"
                samples: 10
            }
        }
        popup: Popup {
            y: root.height - 1
            width: root.width
            implicitHeight:mainrect.height*0.19
            padding: 1
            contentItem: ListView {
                implicitHeight: contentHeight
                model: root.popup.visible ? root.delegateModel : null
                clip: true
                currentIndex: root.highlightedIndex

            }
            background: Rectangle {
                color: "transparent"
                radius: 20
                border.color:"#00FFFF"
            }
        }
        onCurrentTextChanged: {
            if(startstop){
                if(root.currentText == "Color Sorting"){}
            }
            else if(root.currentText == "Choose Action"){

            }
            else{
                change()
            }
        }
    }


    DashboardGaugeStyle {
        id: speedometer
        value: 0
        anchors.top: mainrect.top
        anchors.topMargin: (mainrect.height*0.2)
        anchors.right: controllerrect.left
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.33 + mainrect.width*0.33)/2
        height:(mainrect.height*0.33 + mainrect.width*0.33)/2
        onValueChanged: {
            if(value>75){
                popup.visible=true
                notification.text ="HighSpeed Warning!"
                notification.color ="#F67280"
                speedwarning.visible =true
                speedwarning.anchors.topMargin=0
                speedwarning.source ="file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/speedwarning.png"
                speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2.2
                speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2.2
            }
        }
    }




    DashboardGaugeStyle {
        id: speedometer1
        value: 0
        anchors.top: mainrect.top
        anchors.topMargin: (mainrect.height*0.2)
        anchors.right: controllerrect.left
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.33 + mainrect.width*0.33)/2
        height:(mainrect.height*0.33 + mainrect.width*0.33)/2
        onValueChanged: {
            if(value>75){
                popup.visible=true
                notification.text ="HighSpeed Warning!"
                notification.color ="#F67280"
                speedwarning.visible =true
                speedwarning.anchors.topMargin=0
                speedwarning.source ="file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/speedwarning.png"
                speedwarning.height =(mainrect.height*0.06 + mainrect.width *0.08)/2.2
                speedwarning.width=(mainrect.height*0.06 + mainrect.width *0.08)/2.2
            }
        }
    }


    Rectangle{
        id:r1
        property int count:0
        property int sliderwidth: 100
        property int sliderheight:50
        property int handleheigh: 40
        signal xsliderChanged(int xval)
        implicitWidth: sliderwidth
        implicitHeight:sliderheight
        width:(mainrect.height*0.3 + mainrect.width*0.3)/2
        height:(mainrect.height*0.5 + mainrect.width*0.5)/11
        border.color: "black"
        color:"black"
        anchors.top: speedometer.bottom
        anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
        anchors.right: controllerrect.left
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)

        Text {
            id: l1
            anchors.top: s1.top
            anchors.topMargin: -5
            anchors.left: s1.left
            anchors.leftMargin: 10
            text:"0"
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        Text {
            id: l2
            anchors.top: s1.top
            anchors.topMargin: -5
            anchors.right:s1.right
            anchors.rightMargin: 10
            text: qsTr("120")
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        Slider{
            id:s1
            from:0
            to:120
            value: 0
            stepSize: 5
            width: r1.width
            height: r1.height
            anchors.horizontalCenter: parent.horizontalCenter
            handle: Image {
                id:handle
                source:"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/speedarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
                anchors.bottom: s1.bottom
                x:s1.visualPosition * (s1.width-width)
                y: (s1.height-height)/2

            }
            onMoved:  {
                speedometer.value= value
            }
        }
    }


    Rectangle{
        id:controllerrect
        height:(mainrect.height + mainrect.width)/5
        width:(mainrect.height + mainrect.width)/4
        color:"transparent"
        anchors.right:mainrect.right
        anchors.rightMargin:10
        anchors.top: speedometer.top
        Label{
            id:axis1text
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            anchors.right:axis1line.left
            anchors.rightMargin: 75
            anchors.bottom: axis1line.top
            anchors.bottomMargin: -5
            color:"white"
            text:"Base"
        }

        Rectangle {
            id: axis1line
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.width: (mainrect.height+mainrect.width)/9
            anchors.left: controllerrect.left
            color:"dark gray"
            border.color: "dark gray"
            anchors.leftMargin: 100
            anchors.top: controllerrect.top
            anchors.topMargin: 50
            Label{
                id:axis1r
                text:"R"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.right: axis1line.right
                anchors.bottom: axis1line.top
                color:"white"
            }
            Label{
                id:axis1l
                text:"L"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis1line.left
                anchors.bottom: axis1line.top
                color:"white"
            }
            Image {
                source:"file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                id: axis1mover
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis1line.bottom
                x: axis1line.width / 2 - axis1mover.width / 2
                MouseArea {
                    id: axis1mouse
                    anchors.fill: parent
                    drag.target: axis1mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis1mover.x < (axis1line.width - axis1mover.width) / 2 ? axis1l.font.pointSize=15 : axis1r.font.pointSize=15
                        axis1mover.x < (axis1line.width - axis1mover.width) / 2 ? axis1r.font.pointSize=10 : axis1l.font.pointSize=10
                        if(startstop && speedometer.value > 0 ){
                            axis1mover.x < (axis1line.width - axis1mover.width) / 2 ?  send.sendData("1|Left|"+speedometer.value) : send.sendData("1|Right|"+speedometer.value)
                            axis1mover.x < (axis1line.width - axis1mover.width) / 2 ?  send.sendDataUnity("1|Left|"+speedometer.value) : send.sendDataUnity("1|Right|"+speedometer.value)
                        }
                        else{
                            change()
                        }
                    }
                    onPressed: {
                        axis1text.font.bold=true
                        axis1text.font.pointSize =15
                        axis1line.height = (mainrect.height+mainrect.width)/400
                        axis1l.font.bold=true
                        axis1r.font.bold=true
                    }
                    onReleased: {
                        axis1text.font.bold=false
                        axis1l.font.bold=false
                        axis1r.font.bold=false
                        axis1r.font.pointSize=10
                        axis1l.font.pointSize=10
                        axis1text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis1line.height= (mainrect.height+mainrect.width)/550
                        axis1mover.x = axis1line.width / 2 - axis1mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis1mover.x < 0) {
                        axis1mover.x = 0;
                    } else if (axis1mover.x > axis1line.width - axis1mover.width) {
                        axis1mover.x = axis1line.width - axis1mover.width;
                    }
                }
            }
        }
        Label{
            id:axis2text
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            anchors.right:axis2.left
            anchors.rightMargin: 40
            anchors.bottom: axis2.top
            anchors.bottomMargin: -5
            color:"white"
            text:"Shoulder"
        }
        Rectangle {
            id: axis2
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.width: (mainrect.height+mainrect.width)/9
            border.color: "dark gray"
            color:"dark gray"
            anchors.left: controllerrect.left
            anchors.leftMargin: 100
            anchors.top: axis1line.bottom
            anchors.topMargin: 50
            Label{
                id:axis2u
                text:"B"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.right: axis2.right
                anchors.bottom: axis2.top
                color:"white"
            }
            Label{
                id:axis2d
                text:"F"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis2.left
                anchors.bottom: axis2.top
                color:"white"
            }

            Image {
                id: axis2mover
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis2.bottom
                x: axis2.width / 2 - axis2mover.width / 2
                MouseArea {
                    id: axis2mouse
                    anchors.fill: parent
                    drag.target: axis2mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis2mover.x < (axis2.width - axis2mover.width) / 2 ? axis2d.font.pointSize=15 : axis2u.font.pointSize=15
                        axis2mover.x < (axis2.width - axis2mover.width) / 2 ? axis2u.font.pointSize=10 : axis2d.font.pointSize=10
                        if(startstop && speedometer.value > 0){
                            axis2mover.x < (axis2.width - axis2mover.width) / 2 ?  send.sendData("2|Forward|"+speedometer.value) : send.sendData("2|Backward|"+speedometer.value)
                            axis2mover.x < (axis2.width - axis2mover.width) / 2 ?  send.sendDataUnity("2|Forward|"+speedometer.value) : send.sendDataUnity("2|Backward|"+speedometer.value)
                        }
                        else{
                            change()
                        }
                    }
                    onPressed:  {
                        axis2text.font.bold=true
                        axis2text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis2.height = (mainrect.height+mainrect.width)/400
                        axis2u.font.bold=true
                        axis2d.font.bold=true
                    }
                    onReleased: {
                        axis2text.font.bold=false
                        axis2d.font.bold=false
                        axis2u.font.bold=false
                        axis2d.font.pointSize=10
                        axis2u.font.pointSize=10
                        axis2text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis2.height= (mainrect.height+mainrect.width)/550
                        axis2mover.x = axis2.width / 2 - axis2mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis2mover.x < 0) {
                        axis2mover.x = 0;
                    } else if (axis2mover.x > axis2.width - axis2mover.width) {
                        axis2mover.x = axis2.width - axis2mover.width;
                    }
                }
            }
        }

        Label{
            id:axis3text
            anchors.right:axis3.left
            anchors.rightMargin: 65
            anchors.bottom: axis3.top
            anchors.bottomMargin: -5
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            color:"white"
            text:"Elbow"
        }
        Rectangle {
            id: axis3
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.color: "dark gray"
            color:"dark gray"
            border.width: 5
            anchors.left: controllerrect.left
            anchors.leftMargin: 100
            anchors.top: axis2.bottom
            anchors.topMargin: 50
            Label{
                id:axis3u
                text:"U"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.right: axis3.right
                anchors.bottom: axis3.top
                color:"white"
            }
            Label{
                id:axis3d
                text:"D"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis3.left
                anchors.bottom: axis3.top
                color:"white"
            }
            Image {
                id: axis3mover
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis3.bottom
                x: axis3.width / 2 - axis3mover.width / 2
                MouseArea {
                    id: axis3mouse
                    anchors.fill: parent
                    drag.target: axis3mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis3mover.x < (axis3.width - axis3mover.width) / 2 ? axis3d.font.pointSize=15 : axis3u.font.pointSize=15
                        axis3mover.x < (axis3.width - axis3mover.width) / 2 ? axis3u.font.pointSize=10 : axis3d.font.pointSize=10
                        if(startstop && speedometer.value > 0){
                            axis3mover.x < (axis3.width - axis3mover.width) / 2 ?  send.sendData("3|Down|"+speedometer.value) : send.sendData("3|Up|"+speedometer.value)
                            axis3mover.x < (axis3.width - axis3mover.width) / 2 ?  send.sendDataUnity("3|Down|"+speedometer.value) : send.sendDataUnity("3|Up|"+speedometer.value)
                        }
                        else{
                            change()
                        }
                    }
                    onPressed: {
                        axis3text.font.bold=true
                        axis3d.font.bold=true
                        axis3u.font.bold=true
                        axis3text.font.pointSize =15
                        axis3.height= (mainrect.height+mainrect.width)/400
                    }
                    onReleased: {
                        axis3text.font.bold=false
                        axis3d.font.bold=false
                        axis3u.font.bold=false
                        axis3d.font.pointSize=10
                        axis3u.font.pointSize=10
                        axis3text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis3.height= (mainrect.height+mainrect.width)/550
                        axis3mover.x = axis3.width / 2 - axis3mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis3mover.x < 0) {
                        axis3mover.x = 0;
                    } else if (axis3mover.x > axis3.width - axis3mover.width) {
                        axis3mover.x = axis3.width - axis3mover.width;
                    }
                }
            }
        }
        Label{
            id:axis4text
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            anchors.right:axis4.left
            anchors.rightMargin: 73
            anchors.bottom: axis4.top
            anchors.bottomMargin: -5
            color:"white"
            text:"Wrist"
        }
        Rectangle {
            id: axis4
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.color: "dark gray"
            color: "dark gray"
            border.width: 5
            anchors.left: controllerrect.left
            anchors.leftMargin: 100
            anchors.top: axis3.bottom
            anchors.topMargin: 50
            Label{
                id:axis4u
                text:"R"
                anchors.right: axis4.right
                anchors.bottom: axis4.top
                color:"white"
            }
            Label{
                id:axis4d
                text:"L"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis4.left
                anchors.bottom: axis4.top
                color:"white"
            }
            Image {
                id: axis4mover
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis4.bottom
                x: axis4.width / 2 - axis4mover.width / 2
                MouseArea {
                    id: axis4mouse
                    anchors.fill: parent
                    drag.target: axis4mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis4mover.x < (axis4.width - axis4mover.width) / 2 ? axis4d.font.pointSize=15 : axis4u.font.pointSize=15
                        axis4mover.x < (axis4.width - axis4mover.width) / 2 ? axis4u.font.pointSize=10 : axis4d.font.pointSize=10
                        if(startstop && speedometer.value > 0){
                            axis4mover.x < (axis4.width - axis4mover.width) / 2 ?  send.sendData("4|RotateLeft|"+speedometer.value) : send.sendData("4|RotateRight|"+speedometer.value)
                            axis4mover.x < (axis4.width - axis4mover.width) / 2 ?  send.sendDataUnity("4|RotateLeft|"+speedometer.value) : send.sendDataUnity("4|RotateRight|"+speedometer.value)
                        }
                        else{
                            change()
                        }
                    }
                    onPressed: {
                        axis4text.font.bold=true
                        axis4text.font.pointSize =15
                        axis4.height = (mainrect.height+mainrect.width)/400
                        axis4u.font.bold=true
                        axis4d.font.bold=true
                    }
                    onReleased: {
                        axis4text.font.bold=false
                        axis4d.font.pointSize=10
                        axis4u.font.pointSize=10
                        axis4text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis4.height = (mainrect.height+mainrect.width)/550
                        axis4u.font.bold=false
                        axis4d.font.bold=false
                        axis4mover.x = axis4.width / 2 - axis4mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis4mover.x < 0) {
                        axis4mover.x = 0;
                    } else if (axis4mover.x > axis4.width - axis4mover.width) {
                        axis4mover.x = axis4.width - axis4mover.width;
                    }
                }
            }
        }
        Label{
            id:axis5text
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            anchors.right:axis5.left
            anchors.rightMargin: 62
            anchors.bottom: axis5.top
            anchors.bottomMargin: -5
            color:"white"
            text:"Finger"
        }
        Rectangle {
            id: axis5
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.color: "dark gray"
            color:"dark grey"
            border.width: 5
            anchors.left: controllerrect.left
            anchors.leftMargin: 100
            anchors.top: axis4.bottom
            anchors.topMargin: 50
            Label{
                id:axis5u
                text:"U"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.right: axis5.right
                anchors.bottom: axis5.top
                color:"white"
            }
            Label{
                id:axis5d
                text:"D"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis5.left
                anchors.bottom: axis5.top
                color:"white"
            }
            Image {
                id: axis5mover
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis5.bottom
                x: axis5.width / 2 - axis5mover.width / 2
                MouseArea {
                    id: axis5mouse
                    anchors.fill: parent
                    drag.target: axis5mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis5mover.x < (axis5.width - axis5mover.width) / 2 ? axis5d.font.pointSize=15 : axis5u.font.pointSize=15
                        axis5mover.x < (axis5.width - axis5mover.width) / 2 ? axis5u.font.pointSize=10 : axis5d.font.pointSize=10
                        if(startstop && speedometer.value > 0){
                            axis5mover.x < (axis5.width - axis5mover.width) / 2 ?  send.sendData("5|Down|"+speedometer.value) : send.sendData("5|Up|"+speedometer.value)
                            axis5mover.x < (axis5.width - axis5mover.width) / 2 ?  send.sendDataUnity("5|Down|"+speedometer.value) : send.sendDataUnity("5|Up|"+speedometer.value)
                        }else{
                            change()
                        }
                    }
                    onPressed: {

                        axis5text.font.bold=true
                        axis5text.font.pointSize =15
                        axis5.height = (mainrect.height+mainrect.width)/400
                        axis5u.font.bold=true
                        axis5d.font.bold=true
                    }
                    onReleased: {
                        axis5text.font.bold=false
                        axis5d.font.pointSize=10
                        axis5u.font.pointSize=10
                        axis5text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis5.height = (mainrect.height+mainrect.width)/550
                        axis5u.font.bold=false
                        axis5d.font.bold=false
                        axis5mover.x = axis5.width / 2 - axis5mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis5mover.x < 0) {
                        axis5mover.x = 0;
                    } else if (axis5mover.x > axis5.width - axis5mover.width) {
                        axis5mover.x = axis5.width - axis5mover.width;
                    }
                }
            }
        }
        Label{
            id:axis6text
            anchors.right:axis6.left
            anchors.rightMargin: 82
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/13
            anchors.bottom: axis6.top
            anchors.bottomMargin: -5
            color:"white"
            text:"Tip"
        }
        Rectangle {
            id: axis6
            height: (mainrect.height+mainrect.width)/550
            width: (mainrect.height+mainrect.width)/6
            border.color: "dark gray"
            color:"dark grey"
            border.width: 5
            anchors.left: controllerrect.left
            anchors.leftMargin: 100
            anchors.top: axis5.bottom
            anchors.topMargin: 50
            Label{
                id:axis6u
                text:"R"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.right: axis6.right
                anchors.bottom: axis6.top
                color:"white"
            }
            Label{
                id:axis6d
                text:"L"
                font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/17
                anchors.left: axis6.left
                anchors.bottom: axis6.top
                color:"white"
            }
            Image {
                id: axis6mover
                source: "file:///C:/Users/sriha/Downloads/bithacks/Qt_controls_Unity/images/axisarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/8.7
                anchors.top: axis6.bottom
                x: axis6.width / 2 - axis6mover.width / 2
                MouseArea {
                    id: axis6mouse
                    anchors.fill: parent
                    drag.target: axis6mover
                    drag.axis: Drag.XAxis
                    onPositionChanged: {
                        axis6mover.x < (axis6.width - axis6mover.width) / 2 ? axis6d.font.pointSize=15 : axis6u.font.pointSize=15
                        axis6mover.x < (axis6.width - axis6mover.width) / 2 ? axis6u.font.pointSilze=10 : axis6d.font.pointSize=10
                        if(startstop && speedometer.value > 0){
                            axis6mover.x < (axis6.width - axis6mover.width) / 2 ? send.sendData("6|Left|"+speedometer.value) : send.sendData("6|Right|"+speedometer.value);
                            axis6mover.x < (axis6.width - axis6mover.width) / 2 ? send.sendDataUnity("6|Left|"+speedometer.value) : send.sendDataUnity("6|Right|"+speedometer.value);

                        }
                        else{
                            change()
                        }
                    }
                    onPressed: {
                        axis6text.font.bold=true
                        axis6text.font.pointSize =15
                        axis6.height = (mainrect.height+mainrect.width)/400
                        axis6u.font.bold=true
                        axis6d.font.bold=true
                    }
                    onReleased: {
                        axis6text.font.bold=false
                        axis6u.font.pointSize=10
                        axis6d.font.pointSize=10
                        axis6text.font.pointSize =(mainrect.height*0.06 + mainrect.width*0.10)/13
                        axis6.height = (mainrect.height+mainrect.width)/550
                        axis6d.font.bold=false
                        axis6u.font.bold=false
                        axis6mover.x = axis6.width / 2 - axis6mover.width / 2;
                    }
                }
                onXChanged: {
                    if (axis6mover.x < 0) {
                        axis6mover.x = 0;
                    } else if (axis6mover.x > axis6.width - axis6mover.width) {
                        axis6mover.x = axis6.width - axis6mover.width;
                    }
                }
            }
        }
    }
}
