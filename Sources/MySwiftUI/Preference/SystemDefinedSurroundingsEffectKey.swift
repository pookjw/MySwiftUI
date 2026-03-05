internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct SystemDefinedSurroundingsEffectKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SystemDefinedSurroundingsEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SystemDefinedSurroundingsEffectKey.PreferredValue?, nextValue: () -> SystemDefinedSurroundingsEffectKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIPreferredDarknessPreferenceKey.self
    }
    
    static func bridgedValue(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> NSNumber? {
        guard case let .system(level) = value?.level else {
            return nil
        }
        
        switch level {
        case .semiDark:
            return 1 as NSNumber
        case .dark:
            return 2 as NSNumber
        case .ultraDark:
            return 3 as NSNumber
        }
    }
    
    static func value(from bridgedValue: NSNumber?) -> SystemDefinedSurroundingsEffectKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        let level: SystemTintLevel
        if bridgedValue == 1 {
            level = .semiDark
        } else if bridgedValue == 2 {
            level = .dark
        } else if bridgedValue == 3 {
            level = .ultraDark
        } else {
            return nil
        }
        
        return SystemDefinedSurroundingsEffectKey.PreferredValue(level: .system(level), animation: nil)
    }
    
    static func animation(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension SystemDefinedSurroundingsEffectKey {
    struct PreferredValue {
        fileprivate private(set) var level: SurroundingsEffectKind.Resolved
        fileprivate private(set) var animation: Animation?
    }
}
