import QtQuick 2.5

Item {
    function getCard(value){
        var array = ['X','A','2','3','4','5','6','7','8','9','10','J','Q','K']
        return array[value]
    }

    Component.onCompleted: {
        _game.start()
        _game.turn()
    }
    Column{
        anchors.verticalCenter: parent.verticalCenter
        height: hpercent(parent, 80)
        width: wpercent(parent,100)
        spacing: hpercent(parent,5)
        Item{
            height: hpercent(parent, 40)
            width: height*0.734
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                anchors.fill: parent
                source: "qrc:/img/deck.png"
            }
        }
        Item {
            height: hpercent(parent, 50)
            width: wpercent(parent,80)
            anchors.horizontalCenter: parent.horizontalCenter
            ListView {
                Component.onCompleted: console.log(01)
                anchors.fill: parent
                model: _game.you.hand
                spacing: wpercent(this,5)
                orientation: ListView.Horizontal
                delegate: Rectangle {
                    height: hpercent(root,30)
                    width: wpercent(root,18)
                    radius: 10
                    Rectangle{
                        color: (naipes%2 == 0) ? "black" : "red"
                        anchors.centerIn: parent
                        height: hpercent(parent,80)
                        width: wpercent(parent,80)
                        radius: 10
                        Text{
                            text: getCard(value)
                            color: "white"
                            font.pixelSize: hpercent(parent,40)
                            anchors.centerIn: parent
                        }
                    }
                }

            }

        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: wpercent(this, 5)
            height: hpercent(parent, 20)
            width: wpercent(parent,100)

            Item{
                height: hpercent(parent, 100)
                width: wpercent(parent,30)
                AButton{
                    anchors.centerIn: parent
                    height: hpercent(parent,60)
                    width: wpercent(parent,30)
                    color: "white"
                    text: "Puxar"
                    action.onClicked: {
                        if(!_game.stopYou)
                            _game.push()
                        if(_game.you.score()>21)
                            stackPages.push(endComponent)
                    }
                }
            }
            Item{
                height: hpercent(parent, 100)
                width: wpercent(parent,30)
                AButton{
                    anchors.centerIn: parent
                    height: hpercent(parent,60)
                    width: wpercent(parent,30)
                    color: "white"
                    text: "Parar"
                    action.onClicked: stackPages.push(endComponent)
                }
            }
            Item{
                height: hpercent(parent, 100)
                width: wpercent(parent,30)
                AButton{
                    anchors.centerIn: parent
                    height: hpercent(parent,60)
                    width: wpercent(parent,30)
                    color: "white"
                    text: "Voltar"
                    action.onClicked: stackPages.pop()
                }
            }
        }
    }
}
