private import CoreGraphics

struct ResolvedGradient : Sendable {
    private var stops: [ResolvedGradient.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
}

extension ResolvedGradient {
    struct Stop : Sendable {
        private var color: Color.Resolved
        private var location: CGFloat
        //        var interpolation: BezierTimingFunction<Float>?        
    }
    
    enum ColorSpace : Sendable {
        case device
        case linear
        case perceptual
        
        func convertIn(_ resolved: Color.Resolved) -> ResolvedGradient.ColorSpace.InterpolatableColor {
            var v0 = resolved.linearRed
            var v1 = resolved.linearGreen
            var v2 = resolved.linearBlue
            var v3 = resolved.opacity
            var v5 = v1
            var v6 = v0
            
            switch self {
            case .device:
                // <+268>
                v0 = -v6
                v0 = (v6 > 0) ? v6 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+380>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+396>
                } else {
                    // <+300>
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+396>
                    } else {
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v6
                        v0 = powf(v0, v1)
                        v5 = sp
                        v6 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v0 = v0 * v1
                        v1 = Float(bitPattern: 0xbd6147ae)
                        v1 = v0 + v1
                        // <+396>
                    }
                }
                
                // <+396>
                v0 = -v1
                var v4 = (v6 > 0) ? v1 : v0
                v0 = -v5
                v0 = (v5 > 0) ? v5 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+520>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+536>
                } else {
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+536>
                    } else {
                        // <+452>
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v4
                        v0 = powf(v0, v1)
                        v5 = sp
                        v4 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v0 = v0 * v1
                        v1 = Float(bitPattern: 0xbd6147ae)
                        v1 = v0 + v1
                        // <+536>
                    }
                }
                
                // <+536>
                v0 = -v1
                v5 = (v5 > 0) ? v1 : v0
                v0 = -v2
                v0 = (v2 > 0) ? v2 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+660>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+676>
                } else {
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+676>
                    } else {
                        // <+592>
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v4
                        v0 = powf(v0, v1)
                        v5 = sp
                        v4 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v0 = v0 * v1
                        v1 = Float(bitPattern: 0xbd6147ae)
                        v1 = v0 + v1
                        // <+676>
                    }
                }
                
                // <+676>
                if v2 <= 0 {
                    v2 = -v1
                } else {
                    v2 = v1
                }
                
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v4 * v3,
                    g: v5 * v3,
                    b: v3 * v2,
                    a: v3
                )
            case .linear:
                // <+700>
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v6 * v3,
                    g: v5 * v3,
                    b: v3 * v2,
                    a: v3
                )
            case .perceptual:
                var v4_0 = v6
                var v4_1 = v5
                // <+56>
                var v0_0 = Float(bitPattern: 0x3ed30eb1)
                var v0_1 = Float(bitPattern: 0x3e58fd3b)
                v0_0 = v0_0 * v6
                v0_1 = v0_1 * v6
                var v1_0 = Float(bitPattern: 0x3f094d17)
                var v1_1 = Float(bitPattern: 0x3f2e4253)
                v1_0 = v1_0 * v4_1
                v1_1 = v1_1 * v4_1
                v4_0 = Float(bitPattern: 0x3d52b909)
                v4_1 = Float(bitPattern: 0x3ddbf2f0)
                v4_0 = v4_0 * v2
                v4_1 = v4_1 * v2
                v0_0 = v0_0 + v1_0
                v0_1 = v0_1 + v1_1
                v4_0 = v0_0 + v4_0
                v4_1 = v0_1 + v4_1
                
                // <+100>
                v0 = Float(bitPattern: 0x3db4d7ec)
                v0 = v6 * v0
                v1 = Float(bitPattern: 0x3e903d74)
                v1 = v5 * v1
                v0 = v0 + v1
                v1 = Float(bitPattern: 0x3f214649)
                v1 = v2 * v1
                v0 = v0 + v1
                // sp + 0x10
                var sp0x10 = (v4_0, v4_1)
                // sp + 0x20
                let sp0x20 = v0
                v0 = abs(v4_0)
                let v8 = Float(bitPattern: 0x3eaaaaab)
                v1 = v8
                // sp + 0x30
                let sp0x30 = v3
                v0 = powf(v0, v1)
                // sp
                let sp = v0
                v0_0 = v4_0
                v0_1 = v4_1
                v0 = v0_1
                v0 = abs(v0)
                v1 = v8
                v0 = powf(v0, v1)
                let v2_0 = sp
                (v1_0, v1_1) = sp0x10
                let v2_1 = v0
                
                // <+220>
                v0_0 = Float(signOf: v1_0, magnitudeOf: v2_0)
                v0_1 = Float(signOf: v1_1, magnitudeOf: v2_1)
                sp0x10 = (v0_0, v0_1)
                v0 = sp0x20
                v0 = abs(v0)
                v1 = v8
                v0 = powf(v0, v1)
                (v4_0, v4_1) = sp0x10
                v2 = sp0x20
                v3 = sp0x30
                
                // <+256>
                v2 = Float(signOf: v2, magnitudeOf: v0)
                // <+700>
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v4_0 * v3,
                    g: v4_1 * v3,
                    b: v3 * v2,
                    a: v3
                )
            }
        }
        
        func convertOut(_ converted: ResolvedGradient.ColorSpace.InterpolatableColor) -> Color.Resolved {
            var v5_0 = converted.r
            var v5_1 = converted.g
            var s2 = converted.b
            var s3 = converted.a
            
            if s3 != 0 {
                // <+168>
                var s0: Float = 1.0
                s0 = 1.0 / s3
                v5_0 = v5_0 * s0
                v5_1 = v5_1 * s0
                s2 = s2 * s0
            }
            
            switch self {
            case .device:
                // <+188>
                var s0 = -v5_0
                var s1 = (v5_0 > 0) ? v5_0 : s0
                s0 = Float(bitPattern: 0x3d25aee6)
                
                if s1 <= s0 {
                    // <+308>
                    s0 = Float(bitPattern: 0x3d9e8391)
                    s0 = s1 * s0
                    // <+324>
                } else {
                    s0 = 1.0
                    
                    if s1 == s0 {
                        // <+324>
                    } else {
                        // <+232>
                        s0 = Float(bitPattern: 0x3f72a76f)
                        s0 = s1 * s0
                        s1 = Float(bitPattern: 0x3d55891a)
                        s0 = s0 + s1
                        s1 = Float(bitPattern: 0x4019999a)
                        let s8 = s3
                        let s9 = s2
                        // sp + 0x10
                        let sp0x10 = (v5_0, v5_1)
                        s0 = powf(s0, s1)
                        (v5_0, v5_1) = sp0x10
                        s2 = s9
                        s3 = s8
                        // <+324>
                    }
                }
                
                // <+324>
                s1 = -s0
                var s4 = (v5_0 > 0) ? s0 : s1
                let s8 = v5_1
                s0 = -s8
                s1 = (s8 > 0) ? s8 : s0
                s0 = Float(bitPattern: 0x3d25aee6)
                
                if s1 <= s0 {
                    // <+460>
                    s0 = Float(bitPattern: 0x3d9e8391)
                    s0 = s1 * s0
                } else {
                    // <+476>
                    // <+372>
                    s0 = 1.0
                    
                    if s1 == s0 {
                        // <+476>
                    } else {
                        // <+384>
                        s0 = Float(bitPattern: 0x3f72a76f)
                        s0 = s1 * s0
                        s1 = Float(bitPattern: 0x3d55891a)
                        s0 = s0 + s1
                        s1 = Float(bitPattern: 0x4019999a)
                        let s9 = s3
                        let s10 = s2
                        // sp + 0x10
                        let sp0x10 = s4
                        s0 = powf(s0, s1)
                        s4 = sp0x10
                        s2 = s10
                        s3 = s9
                        // <+476>
                    }
                }
                
                // <+476>
                s1 = -s0
                var s5 = (s8 > 0) ? s0 : s1
                s0 = -s2
                s1 = (s2 > 0) ? s2 : s0
                s0 = Float(bitPattern: 0x3d25aee6)
                
                if s1 <= s0 {
                    // <+608>
                    s0 = Float(bitPattern: 0x3d9e8391)
                    s0 = s1 * s0
                    // <+624>
                } else {
                    s0 = 1.0
                    
                    if s1 == s0 {
                        // <+624>
                    } else {
                        // <+532>
                        s0 = Float(bitPattern: 0x3f72a76f)
                        s0 = s1 * s0
                        s1 = Float(bitPattern: 0x3d55891a)
                        s0 = s0 + s1
                        s1 = Float(bitPattern: 0x4019999a)
                        let s8 = s3
                        let s9 = s2
                        // sp
                        let sp = (s5, s4)
                        s0 = powf(s0, s1)
                        s5 = sp.0
                        s4 = sp.1
                        s2 = s9
                        s3 = s8
                        // <+624>
                    }
                }
                
                // <+624>
                v5_0 = s4
                v5_1 = s5
                
                if s2 <= 0 {
                    s2 = -s0
                } else {
                    s2 = s0
                }
                
                return Color.Resolved(
                    linearRed: v5_0,
                    linearGreen: v5_1,
                    linearBlue: s2,
                    opacity: s3
                )
            case .linear:
                // <+652>
                return Color.Resolved(
                    linearRed: v5_0,
                    linearGreen: v5_1,
                    linearBlue: s2,
                    opacity: s3
                )
            case .perceptual:
                // <+52>
                var v0_0 = v5_0 * v5_0
                var v0_1 = v5_1 * v5_1
                var s1 = s2 * s2
                s1 = s2 * s1
                v0_0 = v5_0 * v0_0
                v0_1 = v5_1 * v0_1
                
                // <+68>
                var v2_0 = Float(bitPattern: 0x3fa25c2d)
                var v2_1 = Float(bitPattern: 0x4053b18c)
                v2_0 = v0_0 * v2_0
                v2_1 = v0_1 * v2_1
                swap(&v2_0, &v2_1)
                
                // <+84>
                var v4_0 = Float(bitPattern: 0x408274ab)
                var v4_1 = Float(bitPattern: 0x40270644)
                v4_0 = v0_0 * v4_0
                v4_1 = v0_1 * v4_1
                v2_0 = v4_0 - v2_0
                v2_1 = v4_1 - v2_1
                
                // <+100>
                v4_0 = Float(bitPattern: 0x3e6c8362)
                v4_1 = Float(bitPattern: 0x3eaec16a)
                v4_0 = v4_0 * s1
                v4_1 = v4_1 * s1
                v5_0 = v2_0 + v4_0
                v5_1 = v2_1 + v4_1
                v2_0 = v2_0 - v4_0
                v2_1 = v2_1 - v4_1
                v5_1 = v2_1
                
                // <+124>
                v2_0 = Float(bitPattern: 0xbb897f53)
                v2_1 = Float(bitPattern: 0x3f34133e)
                v0_0 = v0_0 * v2_0
                v0_1 = v0_1 * v2_1
                v2_0 = v0_1
                v2_1 = v0_1
                v0_0 = v0_0 - v2_0
                v0_1 = v0_1 - v2_1
                s2 = Float(bitPattern: 0x3fda931e)
                s1 = s1 * s2
                s2 = s1 + v0_0
                
                // <+652>
                return Color.Resolved(
                    linearRed: v5_0,
                    linearGreen: v5_1,
                    linearBlue: s2,
                    opacity: s3
                )
            }
        }
    }
}

extension ResolvedGradient.ColorSpace {
    struct InterpolatableColor : Sendable {
        var r: Float
        var g: Float
        var b: Float
        var a: Float
    }
}
