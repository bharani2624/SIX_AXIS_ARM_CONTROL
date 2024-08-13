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


    DashboardGaugeStyle {
        id: speedometer
        Text {
            id: arm1
            text: qsTr("ARM-1")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: mainrect.top
        anchors.topMargin: (mainrect.height*0.08)
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2
        onValueChanged: {

        }
    }
    DashboardGaugeStyle {
        id: speedometer2
        Text {
            id: arm2
            text: qsTr("ARM-2")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: mainrect.top
        anchors.topMargin: (mainrect.height*0.08)
//        anchors.right: controllerrect.left
        anchors.left: speedometer.right
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2
        onValueChanged: {

        }
    }
    DashboardGaugeStyle {
        id: speedometer3
        Text {
            id: arm3
            text: qsTr("ARM-3")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: mainrect.top
        anchors.topMargin: (mainrect.height*0.08)
//        anchors.right: controllerrect.left
        anchors.left: speedometer2.right
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2
        onValueChanged: {

        }
    }



    DashboardGaugeStyle {
        id: speedometer4
        Text {
            id: arm4
            text: qsTr("ARM-4")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: speedometer.bottom
        anchors.topMargin: (mainrect.height*0.2)
//        anchors.right: controllerrect.left
//        anchors.left: speedometer.right
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2
        onValueChanged: {
        speedometer4< value
        }
    }

    DashboardGaugeStyle {
        id: speedometer5
        Text {
            id: arm5
            text: qsTr("ARM-5")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: speedometer2.bottom
        anchors.topMargin: (mainrect.height*0.2)
//        anchors.right: controllerrect.left
        anchors.left: speedometer.right
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2
        onValueChanged: {

        }
    }





    DashboardGaugeStyle {
        id: speedometer6
        Text {
            id: arm6
            text: qsTr("ARM-6")
            anchors.topMargin: -5
            anchors.leftMargin: 10
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        value: 0
        anchors.top: speedometer3.bottom
        anchors.topMargin: (mainrect.height*0.2)
//        anchors.right: controllerrect.left
        anchors.left: speedometer2.right
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)
        maximumValue: 120
        width: (mainrect.height*0.23 + mainrect.width*0.23)/2
        height:(mainrect.height*0.23 + mainrect.width*0.23)/2

        onValueChanged: {

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
        width:(mainrect.height*0.2 + mainrect.width*0.2)/2
        height:(mainrect.height*0.5 + mainrect.width*0.5)/11
        border.color: "black"
        color:"black"
        anchors.top: speedometer.bottom
        anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)

        Text {
            id: l1
            anchors.top: s1.top
            anchors.topMargin: -5
            anchors.left: s1.left
            anchors.leftMargin: 10
            text:"-180"
            font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
            color:"white"
        }
        Text {
            id: l2
            anchors.top: s1.top
            anchors.topMargin: -5
            anchors.right:s1.right
            anchors.rightMargin: 10
            text: qsTr("180")
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
                source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
                width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
                height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
                anchors.bottom: s1.bottom
                x:s1.visualPosition * (s1.width-width)
                y: (s1.height-height)/2

            }
            onMoved:  {
                speedometer.value= value
//                speedometer<send.sendData(speedometer.value+" Arm-1")
            }


        }
    }





    Rectangle{
    id:r2
    property int count:0
    property int sliderwidth: 100
    property int sliderheight:50
    property int handleheigh: 40
    signal xsliderChanged(int xval)
    implicitWidth: sliderwidth
    implicitHeight:sliderheight
    width:(mainrect.height*0.2 + mainrect.width*0.2)/2
    height:(mainrect.height*0.5 + mainrect.width*0.5)/11
    border.color: "black"
    color:"black"
    anchors.top: speedometer2.bottom
    anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
//    anchors.right: speedometer3.left
    anchors.left: speedometer.right
    anchors.leftMargin: (mainrect.width/16)
    anchors.rightMargin: (mainrect.width/10)
    Text {
        id: l11
        anchors.top: s11.top
        anchors.topMargin: -5
        anchors.left: s11.left
        anchors.leftMargin: 10
        text:"0"
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Text {
        id: l22
        anchors.top: s11.top
        anchors.topMargin: -5
        anchors.right:s11.right
        anchors.rightMargin: 10
        text: qsTr("120")
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Slider{
        id:s11
        from:0
        to:120
        value: 0
        stepSize: 5
        width: r2.width
        height: r2.height
        anchors.horizontalCenter: parent.horizontalCenter
        handle: Image {
            id:handle1
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
            width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
            height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
            anchors.bottom: s11.bottom
            x:s11.visualPosition * (s11.width-width)
            y: (s11.height-height)/2

        }
        onMoved:  {
            speedometer2.value= value

        }

    }
 }


    Rectangle{
    id:r3
    property int count:0
    property int sliderwidth: 100
    property int sliderheight:50
    property int handleheigh: 40
    signal xsliderChanged(int xval)
    implicitWidth: sliderwidth
    implicitHeight:sliderheight
    width:(mainrect.height*0.2 + mainrect.width*0.2)/2
    height:(mainrect.height*0.5 + mainrect.width*0.5)/11
    border.color: "black"
    color:"black"
    anchors.top: speedometer3.bottom
    anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
//    anchors.right: speedometer3.left
    anchors.left: speedometer2.right
    anchors.leftMargin: (mainrect.width/16)
    anchors.rightMargin: (mainrect.width/10)
    Text {
        id: l111
        anchors.top: s111.top
        anchors.topMargin: -5
        anchors.left: s111.left
        anchors.leftMargin: 10
        text:"0"
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Text {
        id: l222
        anchors.top: s111.top
        anchors.topMargin: -5
        anchors.right:s111.right
        anchors.rightMargin: 10
        text: qsTr("120")
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Slider{
        id:s111
        from:0
        to:120
        value: 0
        stepSize: 5
        width: r3.width
        height: r3.height
        anchors.horizontalCenter: parent.horizontalCenter
        handle: Image {
            id:handle11
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
            width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
            height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
            anchors.bottom: s111.bottom
            x:s111.visualPosition * (s111.width-width)
            y: (s111.height-height)/2

        }
        onMoved:  {
            speedometer3.value= value

        }
    }
 }







    Rectangle{
    id:r4
    property int count:0
    property int sliderwidth: 100
    property int sliderheight:50
    property int handleheigh: 40
    signal xsliderChanged(int xval)
    implicitWidth: sliderwidth
    implicitHeight:sliderheight
    width:(mainrect.height*0.2 + mainrect.width*0.2)/2
    height:(mainrect.height*0.5 + mainrect.width*0.5)/11
    border.color: "black"
    color:"black"
    anchors.top: speedometer4.bottom
    anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
//    anchors.right: speedometer3.left
//    anchors.left: speedometer.right
    anchors.leftMargin: (mainrect.width/16)
    anchors.rightMargin: (mainrect.width/10)
    Text {
        id: l1111
        anchors.top: s1111.top
        anchors.topMargin: -5
        anchors.left: s111.left
        anchors.leftMargin: 10
        text:"0"
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Text {
        id: l2222
        anchors.top: s1111.top
        anchors.topMargin: -5
        anchors.right:s1111.right
        anchors.rightMargin: 10
        text: qsTr("120")
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Slider{
        id:s1111
        from:0
        to:120
        value: 0
        stepSize: 5
        width: r4.width
        height: r4.height
        anchors.horizontalCenter: parent.horizontalCenter
        handle: Image {
            id:handle111
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
            width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
            height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
            anchors.bottom: s1111.bottom
            x:s1111.visualPosition * (s1111.width-width)
            y: (s1111.height-height)/2

        }
        onMoved:  {
            speedometer4.value= value
         }
    }
 }


    Rectangle{
    id:r5
    property int count:0
    property int sliderwidth: 100
    property int sliderheight:50
    property int handleheigh: 40
    signal xsliderChanged(int xval)
    implicitWidth: sliderwidth
    implicitHeight:sliderheight
    width:(mainrect.height*0.2 + mainrect.width*0.2)/2
    height:(mainrect.height*0.5 + mainrect.width*0.5)/11
    border.color: "black"
    color:"black"
    anchors.top: speedometer5.bottom
    anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
    anchors.right: speedometer3.left
    anchors.left: speedometer.right
    anchors.leftMargin: (mainrect.width/16)
    anchors.rightMargin: (mainrect.width/10)
    Text {
        id: l11111
        anchors.top: s11111.top
        anchors.topMargin: -5
        anchors.left: s11111.left
        anchors.leftMargin: 10
        text:"0"
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Text {
        id: l22222
        anchors.top: s11111.top
        anchors.topMargin: -5
        anchors.right:s11111.right
        anchors.rightMargin: 10
        text: qsTr("120")
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Slider{
        id:s11111
        from:0
        to:120
        value: 0
        stepSize: 5
        width: r4.width
        height: r4.height
        anchors.horizontalCenter: parent.horizontalCenter
        handle: Image {
            id:handle1111
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
            width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
            height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
            anchors.bottom: s11111.bottom
            x:s11111.visualPosition * (s11111.width-width)
            y: (s11111.height-height)/2

        }
        onMoved:  {
            speedometer5.value= value
        }

    }
 }


    Rectangle{
    id:r6
    property int count:0
    property int sliderwidth: 100
    property int sliderheight:50
    property int handleheigh: 40
    signal xsliderChanged(int xval)
    implicitWidth: sliderwidth
    implicitHeight:sliderheight
    width:(mainrect.height*0.2 + mainrect.width*0.2)/2
    height:(mainrect.height*0.5 + mainrect.width*0.5)/11
    border.color: "black"
    color:"black"
    anchors.top: speedometer6.bottom
    anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
//    anchors.right: speedometer2.left
    anchors.left: speedometer2.right
    anchors.leftMargin: (mainrect.width/16)
    anchors.rightMargin: (mainrect.width/10)
    Text {
        id: l111111
        anchors.top: s111111.top
        anchors.topMargin: -5
        anchors.left: s111111.left
        anchors.leftMargin: 10
        text:"0"
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Text {
        id: l222222
        anchors.top: s111111.top
        anchors.topMargin: -5
        anchors.right:s111111.right
        anchors.rightMargin: 10
        text: qsTr("120")
        font.pointSize:(mainrect.height*0.06 + mainrect.width*0.10)/12
        color:"white"
    }
    Slider{
        id:s111111
        from:0
        to:120
        value: 0
        stepSize: 5
        width: r4.width
        height: r4.height
        anchors.horizontalCenter: parent.horizontalCenter
        handle: Image {
            id:handle11111
            source:"file:///D:/Raspi_Robot/Raspi_Robot/images/speedarrow.png"
            width: (mainrect.height*0.10 +  mainrect.width*0.10)/6
            height:  (mainrect.height*0.10 +  mainrect.width*0.10)/6
            anchors.bottom: s111111.bottom
            x:s111111.visualPosition * (s111111.width-width)
            y: (s111111.height-height)/2

        }

        onMoved:  {
            speedometer6.value=110
            speedometer6.value= value
        }
    }

    Button{
        text: "Send"
        anchors.top: speedometer.bottom
        anchors.topMargin: (mainrect.height*0.10 + mainrect.width*0.10)/10
        anchors.left: mainrect.left
        anchors.leftMargin: (mainrect.width/16)
        anchors.rightMargin: (mainrect.width/10)

    onPressed: {

        send.sendData(speedometer.value+"|"+speedometer2.value+"|"+speedometer3.value+"|"+speedometer4.value+"|"+speedometer5.value+"|"+speedometer6.value)
    }
    }

 }






}
