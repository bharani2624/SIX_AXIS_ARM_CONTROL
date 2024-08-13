#include "sender.h"
#include<QDebug>
Sender::Sender(QObject *parent) : QObject(parent)
{
    socket = new QTcpSocket(this);
    unity_socket =  new QTcpSocket(this);
    unity_socket->connectToHost("",8090);
    socket->connectToHost("192.168.160.72", 8080);
}

void Sender::sendData(QString data)
{
        qDebug() <<"Data from QML: "+data;
        if(socket->state() == QAbstractSocket::ConnectedState) {
            QByteArray arr = data.toUtf8();
            socket->write(arr);
            socket->flush();
        }
        else {
            qDebug() << "Not connected to host!";
           }
}
void Sender::sendDataUnity(QString data)
{
        qDebug() <<"Data from QML: "+data;
        if(unity_socket->state() == QAbstractSocket::ConnectedState) {
            QByteArray arr = data.toUtf8();
            unity_socket->write(arr);
            unity_socket->flush();
        }
        else {
            qDebug() << "Not connected to host!";
           }
}
