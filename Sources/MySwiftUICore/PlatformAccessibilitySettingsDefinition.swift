#warning("TODO")
package import Foundation
private import os.lock

extension EnvironmentValues {
    package var accessibilitySettingsDefinition: PlatformSystemDefinition? {
        get {
            return self[AccessibilitySettingsDefinitionKey.self]?.definition
        }
        set {
            guard let newValue else {
                self[AccessibilitySettingsDefinitionKey.self] = nil
                return
            }
            
            let definition: PlatformAccessibilitySettingsDefinition?
            switch newValue {
            case .appKit:
                definition = unsafe .appKit
            default:
                definition = unsafe .uiKit
            }
            
            let seed: UInt32
            if let definition {
                seed = definition.cache.withLockUnchecked { key in
                    return key.seed
                }
            } else {
                seed = 0
            }
            
            self[AccessibilitySettingsDefinitionKey.self] = AccessibilitySettingsDefinitionKey(definition: newValue, seed: seed)
        }
    }
}

package class PlatformAccessibilitySettingsDefinition {
    package static let notification = Notification.Name(rawValue: "AXUserSettingsDidChange")
    package static nonisolated(unsafe)var uiKit: PlatformAccessibilitySettingsDefinition?
    package static nonisolated(unsafe)var appKit: PlatformAccessibilitySettingsDefinition?
    
    package static func setDefinition(_ defition: PlatformAccessibilitySettingsDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .appKit:
            unsafe PlatformAccessibilitySettingsDefinition.appKit = defition.init()
        case .uiKit:
            unsafe PlatformAccessibilitySettingsDefinition.uiKit = defition.init()
        default:
            break
        }
    }
    
    package static func `for`(system: PlatformSystemDefinition) -> PlatformAccessibilitySettingsDefinition? {
        switch system {
        case .appKit:
            return unsafe PlatformAccessibilitySettingsDefinition.appKit
        default:
            return unsafe PlatformAccessibilitySettingsDefinition.uiKit
        }
    }
    
    fileprivate let cache = OSAllocatedUnfairLock(uncheckedState: PlatformAccessibilitySettingsDefinition.Storage())
    
    package required init() {}
    
    package func notificationCenter(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> NotificationCenter {
        return .default
    }
    
    package func currentValue(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        return false
    }
    
    package final func isEnabled(in setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        fatalError("TODO")
    }
    
    @objc private func settingsValueDidChange(_ notification: Notification) {
        fatalError("TODO")
    }
    
    package final var differentiateWithoutColors: Bool {
        fatalError("TODO")
    }
    
    package final var reduceTransparency: Bool {
        fatalError("TODO")
    }
    
    package final var reduceMotion: Bool {
        fatalError("TODO")
    }
    
    package final var prefersCrossFadeTransitions: Bool {
        fatalError("TODO")
    }
    
    package final var invertColors: Bool {
        fatalError("TODO")
    }
    
    package final var useBoldText: Bool {
        fatalError("TODO")
    }
    
    package final var buttonShapes: Bool {
        fatalError("TODO")
    }
    
    package final var dimFlashingLights: Bool {
        fatalError("TODO")
    }
    
    package final var playAnimatedImages: Bool {
        fatalError("TODO")
    }
    
    package final var headAnchorAlternative: Bool {
        fatalError("TODO")
    }
    
    package final var increaseFocusState: Bool {
        fatalError("TODO")
    }
    
    package final var reduceHoverReveal: Bool {
        fatalError("TODO")
    }
    
    package final var onOffLabels: Bool {
        fatalError("TODO")
    }
    
    package final var quickActions: Bool {
        fatalError("TODO")
    }
    
    package final var largeContentViewer: Bool {
        fatalError("TODO")
    }
    
    package final var enabledTechnologies: [AccessibilityEnabledTechnology] {
        fatalError("TODO")
    }
}

extension PlatformAccessibilitySettingsDefinition {
    package enum Setting: Hashable {
        case differentiateWithoutColors
        case reduceTransparency
        case reduceMotion
        case prefersCrossFadeTransitions
        case invertColors
        case boldText
        case buttonShapes
        case dimFlashingLights
        case playAnimatedImages
        case headAnchorAlternative
        case increaseFocusState
        case reduceHoverReveal
        case onOffLabels
        case quickActions
        case largeContentViewer
        case voiceOver
        case switchControl
        case fullKeyboardAccess
        case voiceControl
        case hoverText
    }
    
    fileprivate struct Storage {
        var entries: [PlatformAccessibilitySettingsDefinition.Entry] = []
        var seed: UInt32 = 0
    }
    
    fileprivate struct Entry {
        var setting: PlatformAccessibilitySettingsDefinition.Setting
        var notification: Notification.Name?
        var value: Bool?
    }
}

package enum AccessibilityEnabledTechnology {
    case voiceOver
    case switchControl
    case fullKeyboardAccess
    case voiceControl
    case hoverText
}

fileprivate struct AccessibilitySettingsDefinitionKey: EnvironmentKey {
    static var defaultValue: AccessibilitySettingsDefinitionKey? {
        return nil
    }
    
    var definition: PlatformSystemDefinition
    var seed: UInt32
}
