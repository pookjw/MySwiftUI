@_spi(Internal) internal import MySwiftUICore
internal import MRUIKit
private import simd
internal import Foundation

struct TintEffectKey : MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: TintEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout TintEffectKey.PreferredValue?, nextValue: () -> TintEffectKey.PreferredValue?) {
        if value == nil {
            value = nextValue()
        }
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSValue>.Type {
        return MRUIPreferredTintPreferenceKey.self
    }
    
    static func bridgedValue(from value: TintEffectKey.PreferredValue?) -> NSValue? {
        assertUnimplemented()
    }
    
    static func value(from bridgedValue: NSValue?) -> TintEffectKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        let values = bridgedValue._mrui_SIMDFloat3Value()
        
        return TintEffectKey.PreferredValue(
            effect: .customColor(
                Color.Resolved(
                    colorSpace: .sRGB,
                    red: values[0],
                    green: values[1],
                    blue: values[2],
                    opacity: 1)
            ),
            animation: nil
        )
    }
    
    static func animation(from value: TintEffectKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension TintEffectKey {
    struct PreferredValue : Equatable {
        fileprivate private(set) var effect: SurroundingsEffectKind.Resolved
        fileprivate private(set) var animation: Animation?
    }
}
