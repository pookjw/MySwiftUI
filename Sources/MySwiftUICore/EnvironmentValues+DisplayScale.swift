// 1B17C64D9E901A0054B49B69A4A2439D
public import CoreGraphics
private import Synchronization
private import UIKit
private import CoreText

extension EnvironmentValues {
    public var displayScale: CGFloat {
        get {
            return self[DisplayScaleKey.self]
        }
        set {
            self[DisplayScaleKey.self] = newValue
        }
        _modify {
            yield &self[DisplayScaleKey.self]
        }
    }
    
    var defaultPixelLength: CGFloat? {
        get {
            return self[DefaultPixelLengthKey.self]
        }
        set {
            self[DefaultPixelLengthKey.self] = newValue
        }
        _modify {
            yield &self[DefaultPixelLengthKey.self]
        }
    }
    
    package var pixelLength: CGFloat {
        if let defaultPixelLength {
            return defaultPixelLength
        } else {
            let displayScale = displayScale
            if displayScale == 0 {
                return 1
            } else {
                return 1.0 / displayScale
            }
        }
    }
    
    package var readableWidth: CGFloat {
        return self[EnvironmentValues.ReadableWidthKey.self]
    }
    
    fileprivate struct ReadableWidthKey : DerivedEnvironmentKey {
        static let cache = Mutex<[DynamicTypeSize: CGFloat]>([:])
        
        static func value(in environment: EnvironmentValues) -> CGFloat {
            let cached: CGFloat? = EnvironmentValues.ReadableWidthKey.cache.withLock { cache in
                // $s7SwiftUI17EnvironmentValuesVAAE16ReadableWidthKey33_1B17C64D9E901A0054B49B69A4A2439DLLV5value2in12CoreGraphics7CGFloatVAC_tFZAKSgSDyAA15DynamicTypeSizeOAKGzYuYTXEfU_
                return cache[environment.dynamicTypeSize]
            }
            
            // <+104>
            if let cached {
                return cached
            }
            
            // x21
            let body = Font.body
            let context = environment.fontResolutionContext
            let cfFont = body.platformFont(in: context)
            
            // <+408>
            let attributedString = NSAttributedString(
                string: String(repeating: "M", count: 62),
                attributes: [.font: cfFont]
            )
            
            // <+688>
            let ctLine = CTLineCreateWithAttributedString(attributedString)
            var bounds = CTLineGetTypographicBounds(ctLine, nil, nil, nil)
            bounds = bounds * 0.125
            bounds = ceil(bounds)
            bounds = bounds * 8.0
            
            EnvironmentValues.ReadableWidthKey.cache.withLock { cache in
                cache[environment.dynamicTypeSize] = bounds
            }
            
            return bounds
        }
    }
}

fileprivate struct DisplayScaleKey : EnvironmentKey {
    static var defaultValue: CGFloat {
        return 1
    }
}

fileprivate struct DefaultPixelLengthKey : EnvironmentKey {
    static var defaultValue: CGFloat? {
        return nil
    }
}

extension EnvironmentValues {
    var effectiveFont: Font {
        return self[EnvironmentValues.EffectiveFontKey.self]
    }
    
    fileprivate struct EffectiveFontKey : DerivedEnvironmentKey {
        static func value(in environment: EnvironmentValues) -> Font {
            if let font = environment.font {
                return font
            }
            
            if let defaultFont = environment.defaultFont {
                return defaultFont
            }
            
            return environment.fallbackFont
        }
    }
}

extension EnvironmentValues {
    public var font: Font? {
        get {
            return self[FontKey.self]
        }
        set {
            self[FontKey.self] = newValue
        }
    }
}

fileprivate struct FontKey : EnvironmentKey {
    static var defaultValue: Font? {
        return nil
    }
}

extension EnvironmentValues {
    var defaultFont: Font? {
        get {
            return self[DefualtFontKey.self]
        }
        set {
            self[DefualtFontKey.self] = newValue
        }
    }
}

fileprivate struct DefualtFontKey : EnvironmentKey {
    static var defaultValue: Font? {
        return nil
    }
}

extension EnvironmentValues {
    var fallbackFont: Font {
        return self[EnvironmentValues.FallbackFontKey.self]
    }
    
    fileprivate struct FallbackFontKey : DerivedEnvironmentKey {
        static func value(in environment: EnvironmentValues) -> Font {
            return environment.fallbackFontProvider.makeFont(in: environment)
        }
    }
}
