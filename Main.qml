import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    header: HeaderView {}

    Sidebar {}

    EditorView {
        width: parent.width
        height: parent.height
    }

    footer: FooterView {}
}
