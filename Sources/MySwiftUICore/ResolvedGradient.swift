
private import CoreGraphics
#if SwiftUICompataibility
private import _SwiftUICorePrivate
private import SwiftUI
#endif

struct ResolvedGradient: Sendable {
    private var stops: [ResolvedGradient.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
}

extension ResolvedGradient {
    struct Stop: Sendable {
        private var color: Color.Resolved
        private var location: CGFloat
        //        var interpolation: BezierTimingFunction<Float>?        
    }
    
    enum ColorSpace: Sendable {
        case device
        case linear
        case perceptual
        
        func convertIn(_ resolved: Color.Resolved) -> ResolvedGradient.ColorSpace.InterpolatableColor {
#if SwiftUICompataibility
            let colorSpace = unsafe unsafeBitCast(self, to: _SwiftUICorePrivate.ResolvedGradient.ColorSpace.self)
            let resolved = SwiftUICore.Color.Resolved(
                linearRed: resolved.linearRed,
                linearGreen: resolved.linearGreen,
                linearBlue: resolved.linearBlue,
                opacity: resolved.opacity
            )
            let converted = colorSpace.convertIn(resolved)
            
            let result = unsafe unsafeBitCast(converted, to: MySwiftUICore.ResolvedGradient.ColorSpace.InterpolatableColor.self)
            return result
#else
#error("TODO")
#endif
        }
        
        func convertOut(_ converted: ResolvedGradient.ColorSpace.InterpolatableColor) -> Color.Resolved {
#if SwiftUICompataibility
            let colorSpace = unsafe unsafeBitCast(self, to: _SwiftUICorePrivate.ResolvedGradient.ColorSpace.self)
            let converted = unsafe unsafeBitCast(converted, to: _SwiftUICorePrivate.ResolvedGradient.ColorSpace.InterpolatableColor.self)
            let resolved = colorSpace.convertOut(converted)
            
            let result = MySwiftUICore.Color.Resolved(
                linearRed: resolved.linearRed,
                linearGreen: resolved.linearGreen,
                linearBlue: resolved.linearBlue,
                opacity: resolved.opacity
            )
            return result
#else
#error("TODO")
#endif
        }
    }
}

extension ResolvedGradient.ColorSpace {
    struct InterpolatableColor: Sendable {
        var r: Float
        var g: Float
        var b: Float
        var a: Float
    }
}
