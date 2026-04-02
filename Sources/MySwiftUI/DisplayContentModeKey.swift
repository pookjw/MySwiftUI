internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct DisplayContentModeKey : MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: DisplayContentModeKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout DisplayContentModeKey.PreferredValue?, nextValue: () -> DisplayContentModeKey.PreferredValue?) {
        if value == nil {
            value = nextValue()
        }
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIDisplayContentModePreferenceKey.self
    }
    
    static func bridgedValue(from value: DisplayContentModeKey.PreferredValue?) -> NSNumber? {
        guard let value else {
            return nil
        }
        
        switch value.displayContentMode.storage {
        case .automatic:
            return 1 as NSNumber
        case .media:
            return 2 as NSNumber
        }
    }
    
    static func value(from bridgedValue: NSNumber?) -> DisplayContentModeKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        let integer = bridgedValue.intValue
        let storage: DisplayContentMode.Storage
        if integer == 2 {
            storage = .media
        } else {
            storage = .automatic
        }
        
        return DisplayContentModeKey.PreferredValue(
            displayContentMode: DisplayContentMode(storage: storage),
            animation: nil
        )
    }
    
    static func animation(from value: DisplayContentModeKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension DisplayContentModeKey {
    struct PreferredValue : Equatable {
        var displayContentMode: DisplayContentMode
        var animation: Animation?
    }
}

struct DisplayContentMode : Hashable {
    fileprivate private(set) var storage: DisplayContentMode.Storage
}

extension DisplayContentMode {
    enum Storage : Hashable {
        case automatic
        case media
    }
}
