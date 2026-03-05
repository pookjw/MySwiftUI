internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct UpperLimbsVisibilityKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: UpperLimbsVisibilityKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout UpperLimbsVisibilityKey.PreferredValue?, nextValue: () -> UpperLimbsVisibilityKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIUpperLimbsVisibilityPreferenceKey.self
    }
    
    static func bridgedValue(from value: UpperLimbsVisibilityKey.PreferredValue?) -> NSNumber? {
        guard let value else {
            return nil
        }
        
        switch value.visibility.storage {
        case .automatic:
            return 0 as NSNumber
        case .visible:
            return 1 as NSNumber
        case .hidden:
            return 2 as NSNumber
        case .hiddenAdaptive:
            return 3 as NSNumber
        }
    }
    
    static func value(from bridgedValue: NSNumber?) -> UpperLimbsVisibilityKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        let integer = bridgedValue.intValue
        let storage: UpperLimbVisibility.Storage
        if integer == 0 {
            storage = .automatic
        } else if integer == 1 {
            storage = .visible
        } else if integer == 2 {
            storage = .hidden
        } else if integer == 3 {
            storage = .hiddenAdaptive
        } else {
            return nil
        }
        
        return UpperLimbsVisibilityKey.PreferredValue(
            visibility: UpperLimbVisibility(storage: storage),
            animation: nil
        )
    }
    
    static func animation(from value: UpperLimbsVisibilityKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension UpperLimbsVisibilityKey {
    struct PreferredValue: Equatable {
        fileprivate private(set) var visibility: UpperLimbVisibility
        fileprivate private(set) var animation: Animation?
    }
}

struct UpperLimbVisibility: Hashable {
    fileprivate private(set) var storage: UpperLimbVisibility.Storage
}

extension UpperLimbVisibility {
    enum Storage: Hashable {
        case automatic
        case visible
        case hidden
        case hiddenAdaptive
    }
}
