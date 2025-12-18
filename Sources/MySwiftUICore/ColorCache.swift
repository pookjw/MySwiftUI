// A45C110C8134A7DB30776EFC6CE1E8A6

internal import CoreGraphics

extension Color.ResolvedHDR {
    static let cache = ObjectCache<Color.ResolvedHDR, CGColor> { resolved in
        // $s7SwiftUI5ColorVAAE11ResolvedHDRV5cache33_A45C110C8134A7DB30776EFC6CE1E8A6LLAA11ObjectCacheCyAESo10CGColorRefaGvpZfiAkEcfU_
        var s12 = resolved.base.linearRed
        var s11 = resolved.base.linearGreen
        let s9 = resolved.base.linearBlue
        let s8 = resolved.base.opacity
        
        if var s0 = resolved.headroom {
            var s1: Float = 1
            let s10 = (s0 <= s1) ? s1 : s0
            let colorspace = unsafe Color.Resolved.srgbExtended
            
            s0 = -s12
            s0 = (s12 > 0) ? s12 : s0
            
            // <+96>
            s1 = Float(bitPattern: 0x3b4d2e1c)
            
            if s0 <= s1 {
                // <+180>
                s1 = Float(bitPattern: 0x414eb852)
                s1 *= s0
                // <+196>
            } else {
                // <+116>
                s1 = 1
                
                if s0 == s1 {
                    // <+196>
                } else {
                    // <+128>
                    s1 = Float(bitPattern: 0x3ed55555)
                    s0 = powf(s0, s1)
                    
                    s1 = Float(bitPattern: 0x3f870a3d)
                    s0 *= s1
                    
                    s1 = Float(bitPattern: 0xbd6147ae)
                    s1 += s0
                    // <+196>
                }
            }
            
            // <+196>
            s0 = -s1
            s12 = (s12 > 0) ? s1 : s0
            
            s0 = -s11
            s0 = (s11 > 0) ? s11 : s0
            
            s1 = Float(bitPattern: 0x3b4d2e1c)
            
            if s0 <= s1 {
                // <+304>
                s1 = Float(bitPattern: 0x414eb852)
                s1 *= s0
                // <+320>
            } else {
                // <+240>
                s1 = 1
                
                if s0 == s1 {
                    // <+320>
                } else {
                    // <+252>
                    s1 = Float(bitPattern: 0x3ed55555)
                    s0 = powf(s0, s1)
                    
                    s1 = Float(bitPattern: 0x3f870a3d)
                    s0 *= s1
                    // <+320>
                }
            }
            
            // <+320>
            s0 = -s1
            s11 = (s11 > 0) ? s1 : s0
            
            s0 = -s9
            s0 = (s9 > 0) ? s9 : s0
            
            s1 = Float(bitPattern: 0x3b4d2e1c)
            if s0 <= s1 {
                // <+428>
                s1 = Float(bitPattern: 0x414eb852)
                s1 *= s0
                // <+444>
            } else {
                // <+364>
                s1 = 1
                if s0 == s1 {
                    // <+444>
                } else {
                    s1 = Float(bitPattern: 0x3ed55555)
                    s0 = powf(s0, s1)
                    
                    s1 = Float(bitPattern: 0x3f870a3d)
                    s0 *= s1
                    
                    s1 = Float(bitPattern: 0xbd6147ae)
                    s1 += s0
                    // <+444>
                }
            }
            
            // <+444>
            s0 = -s1
            s0 = (s9 > 0) ? s1 : s0
            
            let color = CGColor(headroom: s10, colorSpace: colorspace, red: CGFloat(s12), green: CGFloat(s11), blue: CGFloat(s0), alpha: CGFloat(s8))!
            return color
        } else {
            // <+540>
            return resolved.base.makeCGColor()
        }
    }
}

extension Color.Resolved {
    fileprivate func makeCGColor() -> CGColor {
        /*
         linearGreen: -> s10 
         linearBlue -> s9
         opacity - > s8
         */
        let s8  = opacity
        let s9  = linearBlue
        let s10 = linearGreen
        var s0 = linearRed
        var s1 = -s0
        
        var s2 = (s0 > 0) ? s0 : s1
        
        s1 = Float(bitPattern: 0x3b4d2e1c)
        if s2 <= s1 {
            // <+148>
            s1 = Float(bitPattern: 0x414eb852)
            s1 *= s2
            // <+164>
        } else {
            // <+68>
            s1 = 1
            if s2 == s1 {
                // <+164>
            } else {
                // <+80>
                s1 = Float(bitPattern: 0x3ed55555)
                let s11 = s0
                s0 = s2
                s0 = powf(s0, s1)
                s1 = s0
                s0 = s11
                s2 = Float(bitPattern: 0x3f870a3d)
                s1 *= s2
                s2 = Float(bitPattern: 0xbd6147ae)
                s1 += s2
                // <+164>
            }
        }
        
        // <+164>
        s2 = -s1
        s0 = (s0 > 0) ? s1 : s2
        
        // sp + 0x20
        let sp20 = CGFloat(s0)
        
        s0 = -s10
        s0 = (s10 > 0) ? s10 : s0
        
        s1 = Float(bitPattern: 0x3b4d2e1c)
        
        if s0 <= s1 {
            // <+280>
            s1 = Float(bitPattern: 0x414eb852)
            s1 *= s0
            // <+296>
        } else {
            s1 = 1
            if s0 == s1 {
                // <+296>
            } else {
                // <+228>
                s1 = Float(bitPattern: 0x3ed55555)
                s0 = powf(s0, s1)
                
                s1 = Float(bitPattern: 0x3f870a3d)
                s0 *= s1
                
                s1 = Float(bitPattern: 0xbd6147ae)
                s1 += s0
                // <+296>
            }
        }
        
        // <+296>
        s0 = -s1
        s0 = (s10 > 0) ? s1 : s0
        
        // sp + 0x28
        let sp28 = CGFloat(s0)
        
        // <+316>
        s0 = -s9
        s0 = (s9 > 0) ? s9 : s0
        
        s1 = Float(bitPattern: 0x3b4d2e1c)
        
        if s0 <= s1 {
            // <+412>
            s1 = Float(bitPattern: 0x414eb852)
            s1 *= s0
            // <+428>
        } else {
            // <+348>
            s1 = 1
            if s0 == s1 {
                // <+428>
            } else {
                s1 = Float(bitPattern: 0x3ed55555)
                s0 = powf(s0, s1)
                s1 = Float(bitPattern: 0x3f870a3d)
                s0 *= s1
                s1 = Float(bitPattern: 0xbd6147ae)
                s1 += s0
                // <+428>
            }
        }
        
        // <+428>
        s0 = -s1
        s0 = (s9 > 0) ? s1 : s0
        
        // sp + 0x30
        let sp30 = CGFloat(s0)
        // sp + 0x38
        let sp38 = CGFloat(s8)
        
        // <+456>
        let components = [sp20, sp28, sp30, sp38]
        
        return unsafe components.withUnsafeBufferPointer { buffer in
            let color = unsafe CGColor(colorSpace: Color.Resolved.srgbExtended, components: buffer.baseAddress.unsafelyUnwrapped)!
            return color
        }
    }
    
    static let srgbExtended = CGColorSpace(name: CGColorSpace.extendedSRGB)!
}
