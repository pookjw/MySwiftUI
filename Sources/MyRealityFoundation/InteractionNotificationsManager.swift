private import Foundation

final class InteractionNotificationsManager {
    @safe static nonisolated(unsafe) let sharedManager = InteractionNotificationsManager()
    
    @inline(__always) // 원래 없음
    private init() {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(InteractionNotificationsManager.notificationTriggerDidPostWithNotification(_:)),
                name: __RKCustomTriggerNotification.name,
                object: nil
            )
    }
    
    deinit {
        NotificationCenter
            .default
            .removeObserver(self, name: __RKCustomTriggerNotification.name, object: nil)
    }
    
    @objc private func notificationTriggerDidPostWithNotification(_ notification: Notification) {
        assertUnimplemented()
    }
}
