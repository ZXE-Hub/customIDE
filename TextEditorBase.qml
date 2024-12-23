import QtQuick
import QtQuick.Controls

// import file.hadler
Item {

    // DocumentHandler {
    //     id: document
    //     document: textArea.textDocument
    //     cursorPosition: textArea.cursorPosition
    //     selectionStart: textArea.selectionStart
    //     selectionEnd: textArea.selectionEnd
    //     // textColor: TODO
    //     Component.onCompleted: document.load("qrc:/logo/ide_logo.svg")
    //     onLoaded: {
    //         textArea.text = text
    //     }
    //     onError: {
    //         errorDialog.text = message
    //         errorDialog.visible = true
    //     }
    // }
    Flickable {
        id: flickable
        property string fileContent: ""
        flickableDirection: Flickable.VerticalFlick
        width: root.width
        height: root.height * 0.95

        // anchors.top: tabBarContainer.bottom
        TextArea.flickable: TextArea {
            id: textArea
            // text: readFile('qrc:/logo/ide_logo.svg')
            textFormat: Qt.RichText
            wrapMode: TextArea.Wrap
            readOnly: false
            persistentSelection: true
            leftPadding: 6
            rightPadding: 6
            topPadding: 0
            bottomPadding: 0
            background: null

            onLinkActivated: Qt.openUrlExternally(link)
        }

        ScrollBar.vertical: ScrollBar {}
    }
}
