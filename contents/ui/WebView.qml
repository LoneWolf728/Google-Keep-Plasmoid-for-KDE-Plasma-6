import QtQuick
import QtWebEngine
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

WebEngineView {
    id: webView
    url: "https://keep.google.com"
    
    // Persist zoom level
    property real savedZoomFactor: plasmoid.configuration.zoomFactor || 1.0
    
    // Load zoom level on component completion
    Component.onCompleted: {
        zoomFactor = savedZoomFactor
    }
    
    // Save zoom level when it changes
    onZoomFactorChanged: {
        if (Math.abs(zoomFactor - savedZoomFactor) > 0.01) {
            savedZoomFactor = zoomFactor
            plasmoid.configuration.zoomFactor = zoomFactor
        }
    }
    
    // Prevent reload when visibility changes
    onVisibleChanged: {
        if (visible && url.toString() === "") {
            url = "https://keep.google.com"
        }
    }
    
    // Handle loading states
    onLoadingChanged: function(loadRequest) {
        if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
            // Restore zoom after successful load
            if (Math.abs(zoomFactor - savedZoomFactor) > 0.01) {
                zoomFactor = savedZoomFactor
            }
        }
    }
    
    function goBackToHomePage() {
        if (url.toString() !== "https://keep.google.com") {
            url = "https://keep.google.com"
        }
    }
    
    // Prevent context menu for cleaner experience
    settings.showScrollBars: false
    settings.fullScreenSupportEnabled: false
}