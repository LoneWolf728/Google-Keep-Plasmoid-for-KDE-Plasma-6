import QtQuick
import QtWebEngine
import org.kde.plasma.plasmoid

WebEngineView {
    id: webView
    url: "https://keep.google.com"
    
    property real savedZoomFactor: plasmoid.configuration.zoomFactor || 1.0
    
    // Minimal persistent profile for better performance
    profile: WebEngineProfile {
        storageName: "GoogleKeepProfile"
        offTheRecord: false
        persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
        httpCacheType: WebEngineProfile.MemoryHttpCache // Use memory cache for speed
        httpCacheMaximumSize: 50 * 1024 * 1024
    }
    
    // Minimal settings for best performance
    settings.localStorageEnabled: true
    settings.javascriptEnabled: true
    settings.showScrollBars: false
    
    Component.onCompleted: {
        zoomFactor = savedZoomFactor
    }
    
    onZoomFactorChanged: {
        if (Math.abs(zoomFactor - savedZoomFactor) > 0.01) {
            plasmoid.configuration.zoomFactor = zoomFactor
        }
    }
    
    onVisibleChanged: {
        if (visible && url.toString() === "") {
            url = "https://keep.google.com"
        }
    }
}