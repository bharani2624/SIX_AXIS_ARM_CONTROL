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

        text:"2) To Train the RobotArm Select the jobs and axis listed by scrolling it."

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

        text:"3) To move the Arm press the button that is enabled for that axis"

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

        text:"4) To reset the Training commands Choose ResetCmd in the Menu."

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

        text:"5) Use Save button to Store the Commands permenantly."

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

        text:"6) The saved commands can be overwrite while saving the new commands."

        anchors.top:job.bottom

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

        text:"7) Saved commands are automatically enabled when the system starts."

        anchors.top:reset.bottom

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

        text:"8) Load the Cordinate values by pressing the load button"

        anchors.top:retrive.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

    Text {

        id: table

        color:"white"

        text:"9) Double Click a particular row to delete the values"

        anchors.top:automation.bottom

        anchors.topMargin: 14

        font.pixelSize: (parent.height*0.10 + parent.width*0.10)/6

        anchors.left: text.left

        anchors.leftMargin: 10

        anchors.right: text.right

        anchors.rightMargin: 20

    }

}
