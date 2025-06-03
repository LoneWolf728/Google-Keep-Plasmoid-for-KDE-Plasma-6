import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    // Keep WebView alive even when not visible
    property var webViewComponent: null

    compactRepresentation: Item {
        MouseArea {
            anchors.fill: parent
            onClicked: root.expanded = !root.expanded
        }

        Kirigami.Icon {
        anchors.fill: parent
        anchors.margins: 4  // Add 4px margin on all sides
        source: Qt.resolvedUrl("../images/google-keep-icon.svg")
    }
        
        function getIconSource() {
            // Try different icon options based on configuration
            if (plasmoid.configuration.useFavicon && plasmoid.configuration.favIcon) {
                return plasmoid.configuration.favIcon
            }
            
            // Use bundled Google Keep icon
            return Qt.resolvedUrl("../images/google-keep-icon.svg")
        }
    }

    fullRepresentation: Item {
        id: fullRep
        
        Component.onCompleted: {
            if (!root.webViewComponent) {
                var component = Qt.createComponent("WebView.qml")
                if (component.status === Component.Ready) {
                    root.webViewComponent = component.createObject(fullRep)
                    root.webViewComponent.anchors.fill = fullRep
                }
            }
        }
        
        onVisibleChanged: {
            if (root.webViewComponent) {
                root.webViewComponent.visible = visible
            }
        }
    }
}