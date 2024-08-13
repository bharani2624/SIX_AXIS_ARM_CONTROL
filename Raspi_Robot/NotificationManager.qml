import QtQml 2.2

import QtQuick 2.7

import QtQuick.Window 2.2



Rectangle{

    id:text

    height: parent.height

    width: parent.width

    color:"black"

    Text {

        id: startstop

        color:"white"

        text:"1) Please Start before doing any Operation."

        anchors.top:parent.top

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: speed

        color:"white"

        text:"2) You can Set the Speed for each axis using Slider below SpeedIndicator."

        anchors.top:startstop.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: move

        color:"white"

        text:"3) For moving Set Speed and Drag the handler on a specific directioin."

        anchors.top:speed.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: camera

        color:"white"

        text:"4) You can Change the view of robot by pressing the Camera icon on top."

        anchors.top:move.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: job

        color:"white"

        text:"5) The jobs for the Arm can be selected by clicking the ChooseAction."

        anchors.top:camera.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: reset

        color:"white"

        text:"6) To Reset the Axis use Reset Button"

        anchors.top:job.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: automation

        color:"white"

        text:"7) To preform automation just select the jobs listed in ChooseAction."

        anchors.top:reset.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: retrive

        color:"white"

        text:"8) Saved commands are automatically enabled when the system starts."

        anchors.top:automation.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: stop

        color:"white"

        text:"9) Double Click the Stop button to stop the Arm."

        anchors.top:retrive.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }
    Text {

        id: speeech

        color:"white"

        text:"10) Click the Mike icon to use speech to command option."

        anchors.top:retrive.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

}

