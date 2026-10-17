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
        guard let value else {
            return nil
        }
        
        switch value.effect {
        case .system(_):
            return nil
        case .customColor(let resolved):
            let v3_0 = resolved.red
            let v3_1 = resolved.green
            var v0_0 = (v3_0 >= 0) ? Float(bitPattern: 0xFFFFFFFF) : 0
            var v0_1 = (v3_1 >= 0) ? Float(bitPattern: 0xFFFFFFFF) : 0
            var v1_0: Float = 2
            var v1_1: Float = 2
            let v2_0 = (v3_0 > v1_0) ? Float(bitPattern: 0xFFFFFFFF) : 0
            let v2_1 = (v3_1 > v1_1) ? Float(bitPattern: 0xFFFFFFFF) : 0
            v1_0 = Float(bitPattern: (v1_0.bitPattern & v2_0.bitPattern) | (v3_0.bitPattern & ~v2_0.bitPattern))
            v1_1 = Float(bitPattern: (v1_1.bitPattern & v2_1.bitPattern) | (v3_1.bitPattern & ~v2_1.bitPattern))
            v0_0 = Float(bitPattern: v0_0.bitPattern & v1_0.bitPattern)
            v0_1 = Float(bitPattern: v0_1.bitPattern & v1_1.bitPattern)
            let sp = (v0_0, v0_1)
            v0_0 = resolved.blue
            v1_0 = 2
            v1_0 = (v0_0 > v1_0) ? v1_0 : v0_0
            let cmp = (v0_0 >= 0)
            v0_0 = 0
            v0_0 = cmp ? v1_0 : v0_0
            v1_0 = sp.0
            v1_1 = sp.1
            
            return NSValue._mrui_value(withSIMDFloat3: simd_float3(v1_0, v1_1, v0_0))
        case .customDarkness(let darkness):
            var s0 = darkness
            var s1: Float = 1
            s1 = (s0 > s1) ? s1 : s0
            let cmp = (s0 >= 0)
            s0 = 0
            s0 = cmp ? s1 : s0
            return NSValue._mrui_value(withSIMDFloat3: simd_float3(repeating: s0))
        }
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
