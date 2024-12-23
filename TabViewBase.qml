import QtQuick
import QtQuick.Controls

TabBar {
    id: bar
    width: parent.width
    property string fileContent: ""

    Repeater {
        model: ["First", "Second", "Third", "Fourth", "Fifth"]

        TabButton {
            text: modelData
            width: Math.max(100, bar.width / 5)
            onClicked: {
                fileContent = modelData
            }
        }
    }
}
