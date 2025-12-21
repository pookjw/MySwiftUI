@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import UIKit

final class UIKitPlatformAccessibilitySettingsDefinition: PlatformAccessibilitySettingsDefinition {
    override func currentValue(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        fatalError("TODO")
    }
    
    override func notification(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Notification.Name? {
        fatalError("TODO")
    }
    
    // TODO
}
