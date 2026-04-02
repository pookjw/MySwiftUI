// DD012B99EE4F6885B033D7D23FEF69C0
public import Foundation
private import Synchronization

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
                seed = definition.cache.withLock { key in
                    return key.seed
                }
            } else {
                seed = 0
            }
            
            self[AccessibilitySettingsDefinitionKey.self] = AccessibilitySettingsDefinitionKey(definition: newValue, seed: seed)
        }
    }
    
    func accessibilitySettingEnabled(_ setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        guard let kind = self.accessibilitySettingsDefinition else {
            return false
        }
        
        guard let definition = PlatformAccessibilitySettingsDefinition.for(system: kind) else {
            return false
        }
        
        return definition.isEnabled(in: setting)
    }
}

@_spi(Internal) open class PlatformAccessibilitySettingsDefinition {
    package static let notification = Notification.Name(rawValue: "AXUserSettingsDidChange")
    nonisolated(unsafe) package static var uiKit: PlatformAccessibilitySettingsDefinition?
    nonisolated(unsafe) package static var appKit: PlatformAccessibilitySettingsDefinition?
    
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
    
    fileprivate let cache = Mutex(PlatformAccessibilitySettingsDefinition.Storage())
    
    public required init() {}
    
    package func notificationCenter(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> NotificationCenter {
        return .default
    }
    
    open func notification(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Notification.Name? {
        return nil
    }
    
    open func currentValue(for setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        return false
    }
    
    fileprivate final func isEnabled(in setting: PlatformAccessibilitySettingsDefinition.Setting) -> Bool {
        let existing: (Int, Bool?)? = cache.withLock { storage in
            for index in storage.entries.indices {
                let entry = storage.entries[index]
                if entry.setting == setting {
                    return (index, entry.value)
                }
            }
            
            return nil
        }
        
        if let existing, let value = existing.1 {
            return value
        }
        
        let newValue = currentValue(for: setting)
        if let index = existing?.0 {
            cache.withLock { storage in
                storage.entries[index].value = newValue
            }
        } else {
            let name = notification(for: setting)
            
            cache.withLock { storage in
                let entry = PlatformAccessibilitySettingsDefinition.Entry(setting: setting, notification: name, value: newValue)
                storage.entries.append(entry)
                
                if let name {
                    notificationCenter(for: setting).addObserver(self, selector: #selector(settingsValueDidChange(_:)), name: name, object: nil)
                }
            }
        }
        
        return newValue
    }
    
    @objc private func settingsValueDidChange(_ notification: Notification) {
        assertUnimplemented()
    }
    
    package final var differentiateWithoutColors: Bool {
        assertUnimplemented()
    }
    
    package final var reduceTransparency: Bool {
        assertUnimplemented()
    }
    
    package final var reduceMotion: Bool {
        assertUnimplemented()
    }
    
    package final var prefersCrossFadeTransitions: Bool {
        assertUnimplemented()
    }
    
    package final var invertColors: Bool {
        assertUnimplemented()
    }
    
    package final var useBoldText: Bool {
        assertUnimplemented()
    }
    
    package final var buttonShapes: Bool {
        assertUnimplemented()
    }
    
    package final var dimFlashingLights: Bool {
        assertUnimplemented()
    }
    
    package final var playAnimatedImages: Bool {
        assertUnimplemented()
    }
    
    package final var headAnchorAlternative: Bool {
        assertUnimplemented()
    }
    
    package final var increaseFocusState: Bool {
        assertUnimplemented()
    }
    
    package final var reduceHoverReveal: Bool {
        assertUnimplemented()
    }
    
    package final var onOffLabels: Bool {
        assertUnimplemented()
    }
    
    package final var quickActions: Bool {
        assertUnimplemented()
    }
    
    package final var largeContentViewer: Bool {
        assertUnimplemented()
    }
    
    package final var enabledTechnologies: [AccessibilityEnabledTechnology] {
        assertUnimplemented()
    }
}

extension PlatformAccessibilitySettingsDefinition {
    @_spi(Internal) public enum Setting : Hashable, Sendable {
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
    
    fileprivate struct Storage : Sendable {
        var entries: [PlatformAccessibilitySettingsDefinition.Entry] = []
        var seed: UInt32 = 0
    }
    
    fileprivate struct Entry : Sendable {
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

fileprivate struct AccessibilitySettingsDefinitionKey : EnvironmentKey {
    static var defaultValue: AccessibilitySettingsDefinitionKey? {
        return nil
    }
    
    var definition: PlatformSystemDefinition
    var seed: UInt32
}
