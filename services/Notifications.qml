pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
import QtQuick

Singleton {
    id: root

    property alias server: notifs

    //property ObjectModel<Notification> ignoredButStoredNotifications

    NotificationServer {
        id: notifs
        keepOnReload: true
        persistenceSupported: true
        actionsSupported: true
        actionIconsSupported: true
        bodySupported: true
        bodyMarkupSupported: true
        bodyHyperlinksSupported: true
        imageSupported: true
        bodyImagesSupported: true

        onNotification: notification => {
            notification.tracked = true;
            console.log("notification:", notification.appName, notification.body, notification.expireTimeout);
        }
    }
}
