@_spi(Internal) internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct SystemDefinedSurroundingsEffectKey : MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SystemDefinedSurroundingsEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SystemDefinedSurroundingsEffectKey.PreferredValue?, nextValue: () -> SystemDefinedSurroundingsEffectKey.PreferredValue?) {
        if value == nil {
            value = nextValue()
        }
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
        switch bridgedValue.uintValue {
        case 1:
            level = .semiDark
        case 2:
            level = .dark
        case 3:
            level = .ultraDark
        default:
            return nil
        }
        
        return SystemDefinedSurroundingsEffectKey.PreferredValue(level: .system(level), animation: nil)
    }
    
    static func animation(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension SystemDefinedSurroundingsEffectKey {
    struct PreferredValue : Equatable {
        fileprivate private(set) var level: SurroundingsEffectKind.Resolved
        fileprivate private(set) var animation: Animation?
    }
}
