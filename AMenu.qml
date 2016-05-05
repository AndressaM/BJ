import QtQuick 2.0

Item {
    Column{
        anchors.centerIn: parent
        height: hpercent(root, 40)
        width: wpercent(root, 50)
        spacing: hpercent(parent, 5)
        Text{
            height: hpercent(parent,100)
            width: wpercent(parent,100)
            font { pixelSize: hpercent(this,25); bold:true }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "black" ; text:"BlackJack "
        }

        AButton{
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent,20)
            width: wpercent(parent,25)
            color: "white"
            text: "Novo Jogo"
            action.onClicked: stackPages.push(gameComponent)
        }
        AButton{
            anchors.horizontalCenter: parent.horizontalCenter
            height: hpercent(parent,20)
            width: wpercent(parent,25)
            color: "white"
            text: "Score"
            action.onClicked: stackPages.push(scoreComponent)
        }

    }
}

