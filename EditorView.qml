import QtQuick

Item {
    id: root

    TabViewBase {
        id: tabs
        anchors.top: root.top
    }

    TextEditorBase {
        id: editor
        anchors.top: tabs.bottom
        anchors.topMargin: 5
        // fileContent: tabs.fileContent
    }
}
