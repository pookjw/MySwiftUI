// 580A00FC96845561BA69B57FCB8F7ECD
private import _DarwinFoundation1._math
private import CoreGraphics

extension FluidSpringAnimation {
    var function: Animation.Function {
        var d0 = self.response
        var d1 = self.dampingFraction
        
        let d8: Double
        if d0 <= 0 {
            // <+72>
            d8 = .infinity
        } else {
            // <+40>
            let d2 = CGFloat.pi * 2
            d0 = d2 / d0
            d8 = d0 * d0
        }
        
        // <+80>
        d0 = sqrt(d8)
        
        var d2 = d0 + d0
        let d9 = d1 * d2
        d1 = d9 / d2
        d2 = 0
        let d4: Double = 1
        var d3 = d0
        
        if !(d1 < d4) {
            // <+140>
        } else {
            // <+116>
            d2 = d1 * d1
            d2 = d4 - d2
            d2 = sqrt(d2)
            d2 = d0 * d2
            d3 = d0 * d1
            d3 = d3 / d2
            // <+140>
        }
        
        // <+140>
        // sp + 0x8
        let model = SpringModel(a: d0, b: d1, c: d2, d: 1, e: d3)
        d0 = 0.001
        d0 = model.duration(epsilon: d0)
        
        return .spring(
            duration: d0,
            mass: 1,
            stiffness: d8,
            damping: d9,
            initialVelocity: 0
        )
    }
}

fileprivate struct SpringModel {
    let a: Double // 0x0
    let b: Double // 0x8
    let c: Double // 0x10
    let d: Double // 0x18
    let e: Double // 0x20
    
    func duration(epsilon: Double) -> Double {
        var d0 = epsilon
        var d8 = d0
        let d11 = self.b
        d0 = 1E-6
        
        let flag: Bool // true -> <+88> / false -> <+104>
        if d8 <= d0 {
            // <+80>
            if d11 != 0 {
                // <+100>
                d8 = 10.0
                // <+104>
                flag = false
            } else {
                // <+88>
                flag = true
            }
        } else {
            // <+68>
            if d11 == 0 {
                // <+88>
                flag = true
            } else {
                // <+104>
                flag = false
            }
        }
        
        if flag {
            // <+88>
            d0 = .infinity
            // <+164>
        } else {
            // <+104>
            d0 = 1.0
            
            if !(d11 < d0) {
                // <+196>
                var d12: Double = 0
                var d10: Double = -1
                var d15: Double = .infinity
                var x19 = 1023
                var d14: Double = 1
                let x22: Double = 0.1
                var d13: Double = -1
                
                while true {
                    // <+276>
                    d0 = -d12
                    
                    if d11 < d14 {
                        // <+288>
                        var d1 = self.c
                        let d9 = d12 * d1
                        d1 = self.a
                        d1 = d11 * d1
                        d0 = d1 * d0
                        d0 = exp(d0)
                        d10 = d0
                        d14 = self.d
                        d0 = d9
                        
                        do {
                            let values = __sincos_stret(d0)
                            d0 = values.__sinval
                            d1 = values.__cosval
                        }
                        
                        d1 = d14 * d1
                        d14 = 1.0
                        let d2 = self.e
                        d0 = d0 * d2
                        d0 = d1 + d0
                        d0 = d10 * d0
                        d10 = -1
                        // <+388>
                    } else {
                        // <+360>
                        var d1 = self.d
                        var d2 = self.e
                        d2 = d12 * d2
                        var d9 = d1 + d2
                        d1 = self.a
                        d0 = d1 * d0
                        d0 = exp(d0)
                        d0 = d9 * d0
                        // <+388>
                    }
                    
                    // <+388>
                    d0 = d0 + d10
                    var d1 = d0 + d14
                    
                    // <+396>
                    d0 = 0
                    if !d1.isFinite {
                        // <+164>
                        break
                    } else {
                        // <+416>
                        d1 = abs(d1)
                        
                        if d15 < d8 {
                            if d1 < d8 {
                                // <+436>
                                d0 = d12 - d13
                                let v = d0 <= d14
                                d0 = d13
                                
                                if v {
                                    // <+256>
                                    d0 = 0
                                    
                                    if x19 == 0 {
                                        // <+164>
                                        break
                                    } else {
                                        // <+264>
                                    }
                                } else {
                                    // <+164>
                                    break
                                }
                            } else {
                                // <+456>
                                if x19 == 0 {
                                    // <+164>
                                    break
                                } else {
                                    d15 = .infinity
                                    // <+264>
                                }
                            }
                        } else {
                            // <+244>
                            if d1 < d15 {
                                d13 = d12
                                d15 = d1
                            }
                            
                            // <+256>
                            d0 = 0
                            
                            if x19 == 0 {
                                // <+164>
                                break
                            } else {
                                // <+264>
                            }
                        }
                    }
                    
                    // <+264>
                    d0 = x22
                    d12 = d12 + d0
                    x19 &-= 1
                    // <+276>
                }
            } else {
                // <+116>
                d0 = self.d
                var d1 = self.e
                d0 = abs(d0)
                d1 = abs(d1)
                d0 = d0 + d1
                d0 = d8 / d0
                d0 = log(d0)
                d1 = self.a
                d1 = d11 * d1
                d0 = -d0
                d0 = d0 / d1
                d1 = 0
                d0 = max(d0, d1)
                // <+164>
            }
        }
        
        // <+164>
        return d0
    }
}
