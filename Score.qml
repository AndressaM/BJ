import QtQuick 2.0

Item {

    Column{
        height: hpercent(parent,80)
        width: wpercent(parent,100)
        spacing: hpercent(parent,10)
        anchors.verticalCenter: parent.verticalCenter
        Item{
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent,30)
            width: wpercent(parent,80)
            Row{
                anchors.fill: parent
                Text {
                    height: hpercent(parent,100)
                    width: wpercent(parent,50)
                    font { pixelSize: hpercent(this,33); bold:true }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black" ; text:"Vitorias: " + _game.wins
                }Text {
                    height: hpercent(parent,100)
                    width: wpercent(parent,50)
                    font { pixelSize: hpercent(this,33); bold:true }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black" ; text:"Derrotas: " +  _game.loses
                }
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent, 20)
            width: wpercent(parent, 100)
            Item{
                height: hpercent(parent, 100)
                width: wpercent(parent,50)
                AButton{
                    anchors.centerIn: parent
                    height: hpercent(parent,60)
                    width: wpercent(parent,30)
                    color: "white"
                    text: "Novo Jogo"
                    action.onClicked: {
                        stackPages.push(gameComponent)
                    }
                }
            }
            Item{
                height: hpercent(parent, 100)
                width: wpercent(parent,50)
                AButton{
                    anchors.centerIn: parent
                    height: hpercent(parent,60)
                    width: wpercent(parent,30)
                    color: "white"
                    text: "Menu"
                    action.onClicked: stackPages.push(menuComponent)
                }
            }
        }
    }

}
