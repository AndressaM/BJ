import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    function hpercent(ref,percent) { return (ref.height/100)*percent; }
    function wpercent(ref,percent) { return (ref.width/100)*percent; }
    id: root
    visible: true
    height: 600
    width: 800

    Rectangle {
        anchors.fill: parent
        color: "green"
    }
    StackView {
        id: stackPages
        height: hpercent(root,80)
        width: wpercent(root,100)
        initialItem:menuComponent
    }

    Component {
        id: menuComponent
        AMenu{}
    }
    Component {
        id: gameComponent
        Game{}
    }
    Component {
        id: endComponent
        EndGame{}
    }
    Component {
        id: scoreComponent
        Score{}
    }
}
