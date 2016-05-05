import QtQuick 2.0
Item {
    Component.onCompleted: _game.load()
    Column{
        height: hpercent(parent,80)
        width: wpercent(parent,100)
        spacing: hpercent(parent,10)
        anchors.verticalCenter: parent.verticalCenter
        Item{
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent,30)
            width: wpercent(parent,80)
            Text {
                height: hpercent(parent,100)
                width: wpercent(parent,100)
                font { pixelSize: hpercent(this,33); bold:true }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black" ; text: _game.win
            }
        }
        Item{
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent,30)
            width: wpercent(parent,80)
            Row{
                anchors.fill: parent
                Text {
                    height: hpercent(parent,100)
                    width: wpercent(parent,30)
                    font { pixelSize: hpercent(this,33); bold:true }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black" ; text:"Voce: " + _game.scoreYou
                }Text {
                    height: hpercent(parent,100)
                    width: wpercent(parent,30)
                    font { pixelSize: hpercent(this,33); bold:true }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black" ; text: " x "
                }Text {
                    height: hpercent(parent,100)
                    width: wpercent(parent,30)
                    font { pixelSize: hpercent(this,33); bold:true }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "black" ; text:"PC: " +  _game.scoreComp
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
