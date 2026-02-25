internal import MySwiftUICore
internal import MRUIKit

struct TintEffectKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: Never {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: Never) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> Never {
        fatalError()
    }
    
    static func animation(from value: Never) -> Animation? {
        fatalError()
    }
}
