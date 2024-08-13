#ifndef SENDER_H
#define SENDER_H

#include <QObject>
#include<QTcpSocket>
class Sender : public QObject
{
    Q_OBJECT
public:
    explicit Sender(QObject *parent = nullptr);
public slots:
    void sendData(QString data);
    void sendDataUnity(QString data);
private:
    QTcpSocket *socket;
    QTcpSocket *unity_socket;

signals:

};

#endif // SENDER_H
