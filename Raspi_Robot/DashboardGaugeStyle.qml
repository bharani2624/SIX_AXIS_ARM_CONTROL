import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0

CircularGauge {
    id: gauge

    style:CircularGaugeStyle {
        labelStepSize: -1
        labelInset: outerRadius / 2.2
        tickmarkInset: outerRadius / 4.2
        minorTickmarkInset: outerRadius / 4.2
        minimumValueAngle: -180
        maximumValueAngle: 180
        background: Rectangle {
            implicitHeight: gauge.height
            implicitWidth: gauge.width
            color: "black"
            anchors.centerIn: parent
            radius: 360

            Image {
                anchors.fill: parent
                source: "file:///D:/Raspi_Robot/Raspi_Robot/images/background.png"
                asynchronous: true
                sourceSize {
                    width: width
                }
            }

            Canvas {
                property int value: gauge.value
                anchors.fill: parent
                onValueChanged: requestPaint()
                function degreesToRadians(degrees) {
                  return degrees * (Math.PI / 180);
                }
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.beginPath();
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = outerRadius
                    ctx.arc(outerRadius,
                          outerRadius,
                          outerRadius - ctx.lineWidth / 2,
                          degreesToRadians(valueToAngle(gauge.value) - 90),
                          degreesToRadians(valueToAngle(gauge.maximumValue + 1) - 90));
                    ctx.stroke();
                }
            }
        }

        needle: Item {
            y: -outerRadius * 0.78
            height: outerRadius * 0.27
            Rectangle {
                id: needle
                anchors.bottom: parent.bottom
                height: parent.height -8
                width: height * 0.1
                color:"red"
                antialiasing: true
            }


        }

        foreground: Item {

            Text {
                id: speedLabel
                anchors.centerIn: parent
                text: gauge.value.toFixed(0)
                font.family: "MORSPEED"
                font.pixelSize: outerRadius * 0.3
                color: "white"
                antialiasing: true
            }
        }

        tickmarkLabel:  Text {
            font.pixelSize: Math.max(6, outerRadius * 0.08)
            text: styleData.value
            color: styleData.value <= gauge.value ? "white" : "#777776"
            antialiasing: true
        }

        tickmark: Image {
            source: "file:///D:/Raspi_Robot/Raspi_Robot/images/tickmark.svg"
            width: outerRadius * 0.018
            height: outerRadius * 0.15
            antialiasing: true
            asynchronous: true
        }

        minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            implicitHeight: outerRadius * 0.03
            antialiasing: true
            smooth: true
            function getMinorTickColor(value) {
                    if (value > 75) {
                        return "red";
                    } else {
                        return "green";
                    }
                }
             color: styleData.value <= gauge.value? getMinorTickColor(styleData.value):"dark gray"
        }
    }
}
