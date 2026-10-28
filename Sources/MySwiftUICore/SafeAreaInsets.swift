// C4DC82F2A500E9B6DEA3064A36584B42
private import AttributeGraph
private import CoreGraphics
private import Spatial

package struct SafeAreaInsets {
    var space: CoordinateSpace.ID // 0x0
    var elements: [SafeAreaInsets.Element] // 0x8
    var next: SafeAreaInsets.OptionalValue // 0x10
    
    func resolve(regions: SafeAreaRegions, cornerAdaptation: Edge.Set, in context: _PositionAwarePlacementContext) -> EdgeInsets {
        /*
         regions -> x0 -> x19
         cornerAdaptation -> w1 -> w22 / sp + 0x48
         context -> x2
         */
        var d8: CGFloat
        let d9: CGFloat
        do {
            let size = context.size
            d8 = size.width
            d9 = size.height
        }
        
        // sp + 0xa8
        var rect = CGRect(
            origin: .zero,
            size: CGSize(width: d8, height: d9)
        )
        
        let set: AbsoluteEdge.Set
        if !cornerAdaptation.isEmpty {
            // <+152>
            let layoutDirection = context.layoutDirection
            set = AbsoluteEdge.Set(cornerAdaptation, layoutDirection: layoutDirection)
            // <+500>
        } else {
            // <+496>
            set = []
            // <+500>
        }
        
        // <+500>
        self.adjust(
            &rect,
            regions: regions,
            cornerAdaptation: set,
            size: CGSize(width: d8, height: d9),
            to: context
        )
        
        // <+576>
        var next = self.next
        while case .insets(let _next) = next {
            _next.adjust(
                &rect,
                regions: regions,
                cornerAdaptation: set,
                size: CGSize(width: d8, height: d9),
                to: context
            )
            
            next = _next.next
        }
        
        // <+716>
        let sp0x50 = CGRect(origin: .zero, size: CGSize(width: d8, height: d9)).minY
        let sp0x48 = rect.minY
        var d12 = CGRect(origin: .zero, size: CGSize(width: d8, height: d9)).minX
        d12 = d12 - rect.minX
        let sp0x40 = rect.maxY
        let d14 = CGRect(origin: .zero, size: CGSize(width: d8, height: d9)).maxY
        let d10 = rect.maxX
        d8 = d10 - CGRect(origin: .zero, size: CGSize(width: d8, height: d9)).maxX
        
        if d12 == d8 {
            // <+1228>
        } else {
            // <+924>
            let layoutDirection = context.layoutDirection
            let d0 = (layoutDirection == .rightToLeft) ? d12 : d8
            d12 = (layoutDirection == .rightToLeft) ? d8 : d12
            d8 = d0
            // <+1228>
        }
        
        // <+1228>
        var d0 = sp0x40
        var d1 = sp0x48
        let d2 = d0 - d14
        d0 = sp0x50
        d0 = d0 - d1
        d1 = d12
        let d3 = d8
        
        return EdgeInsets(top: d0, leading: d1, bottom: d2, trailing: d3)
    }
    
    fileprivate func adjust(
        _ rect: inout CGRect,
        regions: SafeAreaRegions,
        cornerAdaptation: AbsoluteEdge.Set,
        size: CGSize,
        to context: _PositionAwarePlacementContext
    ) {
        /*
         rect -> x0 -> x28
         regions -> x1
         cornerAdaptation -> x2 -> w21
         context -> x3
         */
        var d12 = size.height
        var d13 = size.width
        
        // x19 + 0xe0
        let mergedInsets = self.mergedInsets(regions: regions, adaptCorners: !cornerAdaptation.isEmpty)
        
        // <+144>
        let flag: Bool = (mergedInsets.unknown0 != 0) || (mergedInsets.unknown1 != 0) || (mergedInsets.unknown2 != 0) || (mergedInsets.unknown3 != 0)
//        do {
//            var v0_0: UInt64 = (mergedInsets.unknown0 == 0) ? .max : 0
//            var v0_1: UInt64 = (mergedInsets.unknown1 == 0) ? .max : 0
//            let v1_0: UInt64 = (mergedInsets.unknown2 == 0) ? .max : 0
//            let v1_1: UInt64 = (mergedInsets.unknown3 == 0) ? .max : 0
//            
//            v0_0 = ((v0_0 << 32) >> 32) | (v0_1 << 32)
//            v0_1 = ((v1_0 << 32) >> 32) | (v1_1 << 32)
//            v0_0 = ~v0_0
//            v0_1 = ~v0_1
//            
//            let s0 = max(
//                (v0_0 << 32) >> 32,
//                (v0_0 >> 32),
//                (v0_1 << 32) >> 32,
//                (v0_1 >> 32)
//            )
//            
//            flag = (s0 & 1) != 0
//        }
        
        if flag {
            // <+204>
        } else {
            // <+176>
            let insets = AbsoluteRectangleCornerInsets(
                RectangleCornerInsets(
                    topLeading: CGSize(width: mergedInsets.unknown4, height: mergedInsets.unknown5),
                    topTrailing: CGSize(width: mergedInsets.unknown6, height: mergedInsets.unknown7),
                    bottomLeading: CGSize(width: mergedInsets.unknown8, height: mergedInsets.unknown9),
                    bottomTrailing: CGSize(width: mergedInsets.unknown10, height: mergedInsets.unknown11)
                ),
                layoutDirection: .leftToRight
            )
            
            guard insets.isNonEmpty else {
                return
            }
            
            // <+204>
        }
        
        // <+204>
        var x190x1f8: [CGPoint]? = nil
        var x190xdf = false
        // inlined
        let transform = context.transform
        
        // <+372>
        // x19 + 0x170
        let tag = transform.coordinateSpaceTag(.id(self.space))
        
        transform.convertSpaceToLocal(.id(self.space)) { item in
            // $s7SwiftUI14SafeAreaInsetsV6adjust33_C4DC82F2A500E9B6DEA3064A36584B42LL_7regions16cornerAdaptation4size2toySo6CGRectVz_AA0cD7RegionsVAA12AbsoluteEdgeO3SetVSo6CGSizeVAA30_PositionAwarePlacementContextVtFyAA13ViewTransformV4ItemOXEfU_TA
            switch item {
            case .translation(_):
                // <+844>
                break
            case .affineTransform(let transform, _):
                // <+712>
                if ((transform.b != 0) || (transform.c != 0)) && ((transform.a != 0) || (transform.d != 0)) {
                    // <+876>
                    x190xdf = true
                    return
                } else {
                    // <+844>
                }
            case .projectionTransform(let transform, _):
                // <+756>
                if transform.isAffine {
                    // <+844>
                } else {
                    // <+804>
                    // m12 m21 m11 m22
                    if ((transform.m12 != 0) || (transform.m21 != 0)) && ((transform.m11 != 0) || (transform.m22 != 0)) {
                        // <+876>
                        x190xdf = true
                        return
                    } else {
                        // <+844>
                    }
                }
            case .coordinateSpace(_):
                // <+844>
                break
            case .sizedSpace(let coordinateSpaceTag, let size):
                // <+172>
                if let tag, tag == coordinateSpaceTag {
                    // <+204>
                    let rect_1 = CGRect(origin: .zero, size: size)
                        .inset(
                            by: EdgeInsets(
                                top: mergedInsets.unknown12,
                                leading: mergedInsets.unknown13,
                                bottom: mergedInsets.unknown14,
                                trailing: mergedInsets.unknown15
                            )
                        )
                    
                    let rect_2 = rect_1
                        .inset(
                            by: EdgeInsets(
                                top: -mergedInsets.unknown0,
                                leading: -mergedInsets.unknown1,
                                bottom: -mergedInsets.unknown2,
                                trailing: -mergedInsets.unknown3
                            )
                        )
                    
                    // <+288>
                    // sp + 0x90
                    var points_1: [CGPoint] = [
                        rect_1.origin,
                        CGPoint(x: rect_1.origin.x + rect_1.size.width, y: rect_1.origin.y),
                        CGPoint(x: rect_1.origin.x + rect_1.size.width, y: rect_1.origin.y + rect_1.size.height),
                        CGPoint(x: rect_1.origin.x, y: rect_1.origin.y + rect_1.size.height)
                    ]
                    
                    let points_2: [CGPoint] = [
                        rect_2.origin,
                        CGPoint(x: rect_2.origin.x + rect_2.size.width, y: rect_2.origin.y),
                        CGPoint(x: rect_2.origin.x + rect_2.size.width, y: rect_2.origin.y + rect_2.size.height),
                        CGPoint(x: rect_2.origin.x, y: rect_2.origin.y + rect_2.size.height)
                    ]
                    
                    points_1.append(contentsOf: points_2)
                    
                    if !cornerAdaptation.isEmpty {
                        let insets = AbsoluteRectangleCornerInsets(
                            RectangleCornerInsets(
                                topLeading: CGSize(width: mergedInsets.unknown4, height: mergedInsets.unknown5),
                                topTrailing: CGSize(width: mergedInsets.unknown6, height: mergedInsets.unknown7),
                                bottomLeading: CGSize(width: mergedInsets.unknown8, height: mergedInsets.unknown9),
                                bottomTrailing: CGSize(width: mergedInsets.unknown10, height: mergedInsets.unknown11)
                            ),
                            layoutDirection: .leftToRight
                        )
                        
                        points_1.append(contentsOf: insets.cornerPoints(in: rect_2))
                    }
                    
                    x190x1f8 = points_1
                    return
                } else {
                    // <+884>
                    return
                }
            case .scrollGeometry(_):
                // <+844>
                break
            case .depthTranslation(_):
                // <+844>
                break
            case .affineTransform3D(let transform3D, _):
                // <+588>
                if let rotation = transform3D.rotation {
                    // <+660>
                    var other = Rotation3D()
                    unsafe other.quaternion = simd_quatd(ix: 0, iy: 0, iz: 0, r: 1)
                    
                    if rotation == other {
                        // <+844>
                    } else {
                        // <+876>
                        x190xdf = true
                        return
                    }
                } else {
                    // <+876>
                    x190xdf = true
                    return
                }
            case .sizedSpace3D(_, _):
                // <+844>
                break
            }
            
            // <+844>
            if !x190xdf, var copy = x190x1f8 {
                copy.applyTransform(item: item)
                x190x1f8 = copy
            }
        }
        
        guard !x190xdf, let x190x1f8 else {
            return
        }
        
        // <+584>
        let x190x30 = d13
        let rect_1 = CGRect(cornerPoints: x190x1f8[0..<4])
        var x190x98 = rect_1.size.height
        var d11 = rect_1.origin.x
        d13 = rect_1.origin.y
        var d15 = rect_1.size.width
        let x190x38 = d12
        let rect_2 = CGRect(cornerPoints: x190x1f8[4..<8])
        var x190xc0 = rect_2.origin.x
        var x190x70 = rect_2.size.width
        var x190x78 = rect_2.origin.y
        var x190x68 = rect_2.size.height
        var d9 = rect.origin.x
        d12 = rect.origin.y
        var d8 = rect.size.width
        var d10 = rect.size.height
        // rect -> x28 -> x19 + 0x90
        var x190xa8 = CGRect(x: d9, y: d12, width: d8, height: d10).minY
        let x190xb0 = CGRect(x: d9, y: d12, width: d8, height: d10).maxY
        let x190xb8 = CGRect(x: d9, y: d12, width: d8, height: d10).minX
        var x190x20 = d12
        var x190x28 = d9
        var x190x80 = d10
        var x190x88 = d8
        let x190xa0 = CGRect(x: d9, y: d12, width: d8, height: d10).maxX
        
        d9 = context.pixelLength
        
        // <+1104>
        var d0: CGFloat = 0.5
        d0 = d9 * d0
        var d1: CGFloat = 0.001
        d0 = d0 + d1
        let x190xc8 = d0
        d12 = d15
        var d14 = x190x98
        var x190x50 = CGRect(x: d11, y: d13, width: d15, height: d14).minX
        
        // <+1184>
        d8 = x190xc0
        d10 = x190x70
        d9 = x190x78
        d15 = x190x68
        var x190x40 = CGRect(x: d8, y: d9, width: d10, height: d15).minX
        var x190x58 = CGRect(x: d11, y: d13, width: d12, height: d14).maxX
        var x190x60 = CGRect(x: d8, y: d9, width: d10, height: d15).maxX
        var x190x48 = CGRect(x: d11, y: d13, width: d12, height: d14).minY
        d8 = d13
        d13 = x190xc0
        
        do {
            let value_1 = CGRect(x: d13, y: d9, width: d10, height: d15).minY
            let value_2 = CGRect(x: d11, y: d8, width: d12, height: d14).maxY
            d12 = value_1
            d11 = value_2
        }
        
        d8 = x190xc8
        d0 = CGRect(x: d13, y: d9, width: d10, height: d15).maxY
        
        // <+1372>
        var d2 = x190xa8
        let d7 = d2 - d8
        d1 = x190x48
        
        var d4: CGFloat
        var d3: CGFloat
        var d16: CGFloat
        
        if !(d7 < d1) {
            // <+1448>
            d2 = x190xa0
            d4 = x190xb0
            d3 = x190xb8
            d16 = x190x80
        } else {
            d1 = d2 + d8
            if !(d12 < d1) {
                // <+1448>
                d2 = x190xa0
                d4 = x190xb0
                d3 = x190xb8
                d16 = x190x80
            } else {
                // <+1404>
                d1 = d2 - d12
                d2 = x190x20
                d2 = d2 - d1
                rect.origin.y = d2
                d16 = x190x80
                d16 = d16 + d1
                rect.size.height = d16
                d2 = x190xa0
                d4 = x190xb0
                d3 = x190xb8
                // <+1464>
            }
        }
        
        // rect -> x19 + 0x90 -> x20
        // <+1464>
        let d17 = x190x50
        let d5 = x190x58
        let d6 = d4 + d8
        
        if !(d11 < d6) {
            // <+1504>
        } else {
            d1 = d4 - d8
            
            if !(d1 < d0) {
                // <+1504>
            } else {
                // <+1492>
                d0 = d0 - d4
                d0 = d0 + d16
                rect.size.height = d0
                // <+1504>
            }
        }
        
        // <+1504>
        d11 = d3 - d8
        
        if !(d11 < d17) {
            // <+1576>
            d1 = x190x88
            d4 = x190x60
            // <+1584>
        } else {
            // <+1516>
            d0 = d3 + d8
            d1 = x190x40
            d4 = x190x60
            
            if !(d1 < d0) {
                // <+1568>
                d1 = x190x88
                // <+1584>
            } else {
                // <+1536>
                d0 = d3 - d1
                d1 = x190x28
                d1 = d1 - d0
                rect.origin.x = d1
                d1 = x190x88
                d1 = d1 + d0
                rect.size.width = d1
                // <+1584>
            }
        }
        
        // <+1584>
        d10 = d2 + d8
        
        if !(d5 < d10) {
            // <+1620>
        } else {
            // <+1596>
            d0 = d2 - d8
            
            if !(d0 < d4) {
                // <+1620>
            } else {
                d0 = d4 - d2
                d0 = d0 + d1
                rect.size.width = d0
                // <+1620>
            }
        }
        
        // <+1620>
        guard !cornerAdaptation.isEmpty else {
            return
        }
        
        x190x20 = d7
        x190x28 = d6
        
        let rect_3 = CGRect(cornerPoints: x190x1f8[8..<12])
        x190xc0 = rect_3.size.width
        x190x98 = rect_3.size.height
        d9 = rect_3.origin.x
        d15 = rect_3.origin.y
        let x190x10 = d11
        let x190x18 = d10
        let rect_4 = CGRect(cornerPoints: x190x1f8[12..<16])
        x190x88 = rect_4.origin.y
        let x190x90 = rect_4.origin.x
        x190x78 = rect_4.size.height
        x190x80 = rect_4.size.width
        let rect_5 = CGRect(cornerPoints: x190x1f8[16..<20])
        x190x68 = rect_5.size.width
        x190x70 = rect_5.origin.y
        x190x60 = rect_5.size.height
        d11 = rect_5.origin.x
        let rect_6 = CGRect(cornerPoints: x190x1f8[20..<24])
        x190x50 = rect_6.origin.y
        x190x58 = rect_6.origin.x
        x190x40 = rect_6.size.height
        x190x48 = rect_6.size.width
        
        // <+1820>
        if cornerAdaptation.contains(.top) {
            let x190x8 = d11
            d10 = x190xc0
            d11 = x190x98
            d13 = CGRect(x: d9, y: d15, width: d10, height: d11).maxY
            d8 = d9
            d14 = d15
            let x19 = CGRect(x: d9, y: d15, width: d10, height: d11).maxX
            d11 = x190x88
            d10 = x190x90
            d9 = x190x78
            d15 = x190x80
            d12 = CGRect(x: d10, y: d11, width: d15, height: d9).maxY
            d0 = CGRect(x: d10, y: d11, width: d15, height: d9).minX
            d4 = x190x20
            
            if !(d4 < d13) {
                // <+2040>
                assertUnimplemented()
            } else {
                // <+1956>
                d1 = 0
                d2 = x190xc8
                d1 = d1 - d2
                d2 = x19
                d11 = x190x8
                d9 = d8
                d15 = d14
                
                if !(d1 < d2) {
                    // <+2064>
                    if !(d4 < d12) {
                        // <+2164>
                    } else {
                        // <+2072>
                        d1 = x190x30
                        d2 = x190xc8
                        d1 = d1 + d2
                        
                        if !(d0 < d1) {
                            // <+2164>
                        } else {
                            // <+2092>
                            d0 = x190xa8
                            d8 = d12 - d0
                            
                            if !(d8 >= 0) {
                                // <+2164>
                            } else {
                                // <+2108>
                                if !(d8 > 0) {
                                    // <+2164>
                                } else {
                                    // <+2116>
                                    d0 = rect.origin.x
                                    d12 = rect.origin.y
                                    d2 = rect.size.width
                                    d13 = rect.size.height
                                    d1 = d12
                                    d3 = d13
                                    d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minY
                                    d1 = x190xa8
                                    d0 = d1 - d0
                                    d0 = d8 + d0
                                    d1 = d12 + d0
                                    rect.origin.y = d1
                                    d0 = d13 - d0
                                    rect.size.height = d0
                                    // <+2164>
                                }
                                
                                // <+2164>
                            }
                            
                            // <+2164>
                        }
                        
                        // <+2164>
                    }
                    
                    // <+2164>
                } else {
                    // <+1988>
                    d3 = x190xa8
                    d8 = d13 - d3
                    
                    if !(d4 < d12) {
                        // <+2108>
                    } else {
                        // <+2004>
                        d1 = x190x30
                        d2 = x190xc8
                        d1 = d1 + d2
                        
                        if !(d0 < d1) {
                            // <+2108>
                        } else {
                            // <+2024>
                            d0 = d12 - d3
                            d8 = (d8 <= d0) ? d0 : d8
                            // <+2108>
                        }
                        
                        // <+2108>
                    }
                    
                    // <+2108>
                    if !(d8 > 0) {
                        // <+2164>
                    } else {
                        // <+2116>
                        d0 = rect.origin.x
                        d12 = rect.origin.y
                        d2 = rect.size.width
                        d13 = rect.size.height
                        d1 = d12
                        d3 = d13
                        d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minY
                        d1 = x190xa8
                        d0 = d1 - d0
                        d0 = d8 + d0
                        d1 = d12 + d0
                        rect.origin.y = d1
                        d0 = d13 - d0
                        rect.size.height = d0
                        // <+2164>
                    }
                    
                    // <+2164>
                }
                
                // <+2164>
            }
            
            // <+2164>
        }
        
        // <+2164>
        if cornerAdaptation.contains(.bottom) {
            x190xa8 = d15
            x190x20 = d9
            d9 = x190x68
            d8 = x190x70
            d10 = x190x60
            d13 = CGRect(x: d11, y: d8, width: d9, height: d10).minY
            d14 = d11
            d15 = CGRect(x: d11, y: d8, width: d9, height: d10).maxX
            d9 = x190x50
            d8 = x190x58
            d11 = x190x40
            d10 = x190x48
            d12 = CGRect(x: d8, y: d9, width: d10, height: d11).minY
            d0 = CGRect(x: d8, y: d9, width: d10, height: d11).minX
            d4 = x190x28
            
            if !(d13 < d4) {
                // <+2380>
                d9 = x190x20
                d15 = x190xa8
                d11 = d14
                
                if d12 < d4 {
                    // <+2416>
                    d1 = x190x30
                    d2 = x190xc8
                    d1 = d1 + d2
                    
                    if !(d0 < d1) {
                        // <+2496>
                    } else {
                        // <+2436>
                        d0 = x190xb0
                        d8 = d0 - d12
                        
                        if !(d8 >= 0) {
                            // <+2496>
                        } else {
                            // <+2452>
                            if !(d8 > 0) {
                                // <+2496>
                            } else {
                                // <+2460>
                                d0 = rect.origin.x
                                d1 = rect.origin.y
                                d2 = rect.size.width
                                d12 = rect.size.height
                                d3 = d12
                                d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxY
                                d1 = x190xb0
                                d0 = d0 - d1
                                d0 = d8 + d0
                                d0 = d12 - d0
                                rect.size.height = d0
                                // <+2496>
                            }
                            // <+2496>
                        }
                        
                        // <+2496>
                    }
                    
                    // <+2496>
                } else {
                    // <+2496>
                }
                
                // <+2496>
            } else {
                // <+2300>
                d1 = 0
                d2 = x190xc8
                d1 = d1 - d2
                d9 = x190x20
                d11 = d14
                
                if !(d1 < d15) {
                    // <+2404>
                    d15 = x190xa8
                    
                    if !(d12 < d4) {
                        // <+2496>
                    } else {
                        // <+2416>
                        d1 = x190x30
                        d2 = x190xc8
                        d1 = d1 + d2
                        
                        if !(d0 < d1) {
                            // <+2496>
                        } else {
                            // <+2436>
                            d0 = x190xb0
                            d8 = d0 - d12
                            
                            if !(d8 >= 0) {
                                // <+2496>
                            } else {
                                // <+2452>
                                if !(d8 > 0) {
                                    // <+2496>
                                } else {
                                    // <+2460>
                                    d0 = rect.origin.x
                                    d1 = rect.origin.y
                                    d2 = rect.size.width
                                    d12 = rect.size.height
                                    d3 = d12
                                    d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxY
                                    d1 = x190xb0
                                    d0 = d0 - d1
                                    d0 = d8 + d0
                                    d0 = d12 - d0
                                    rect.size.height = d0
                                    // <+2496>
                                }
                                // <+2496>
                            }
                        }
                    }
                    
                    // <+2496>
                } else {
                    d15 = x190xa8
                    d3 = x190xb0
                    d8 = d3 - d13
                    
                    if !(d12 < d4) {
                        // <+2452>
                    } else {
                        // <+2344>
                        d1 = x190x30
                        d2 = x190xc8
                        d1 = d1 + d2
                        
                        if !(d0 < d1) {
                            // <+2452>
                        } else {
                            // <+2364>
                            d0 = d3 - d12
                            d8 = (d8 <= d0) ? d0 : d8
                            // <+2452>
                        }
                    }
                    
                    // <+2452>
                    if !(d8 > 0) {
                        // <+2496>
                    } else {
                        // <+2460>
                        d0 = rect.origin.x
                        d1 = rect.origin.y
                        d2 = rect.size.width
                        d12 = rect.size.height
                        d3 = d12
                        d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxY
                        d1 = x190xb0
                        d0 = d0 - d1
                        d0 = d8 + d0
                        d0 = d12 - d0
                        rect.size.height = d0
                        // <+2496>
                    }
                    
                    // <+2496>
                }
                
                // <+2496>
            }
            
            // <+2496>
        }
        
        // <+2496>
        if cornerAdaptation.contains(.left) {
            d8 = x190xc0
            d10 = x190x98
            d13 = CGRect(x: d9, y: d15, width: d8, height: d10).maxY
            d14 = CGRect(x: d9, y: d15, width: d8, height: d10).maxX
            d9 = x190x68
            d8 = x190x70
            d10 = x190x60
            d12 = CGRect(x: d11, y: d8, width: d9, height: d10).minY
            d0 = CGRect(x: d11, y: d8, width: d9, height: d10).maxX
            d3 = x190x10
            
            if !(d3 < d14) {
                // <+2692>
                if !(d3 < d0) {
                    // <+2792>
                } else {
                    d1 = x190x38
                    d2 = x190xc8
                    d1 = d1 + d2
                    
                    if !(d12 < d1) {
                        // <+2792>
                    } else {
                        d1 = x190xb8
                        d10 = d0 - d1
                        
                        if !(d10 >= 0) {
                            // <+2792>
                        } else {
                            // <+2736>
                            if !(d10 > 0) {
                                // <+2792>
                            } else {
                                // <+2744>
                                d8 = rect.origin.x
                                d1 = rect.origin.y
                                d9 = rect.size.width
                                d3 = rect.size.height
                                d0 = d8
                                d2 = d9
                                d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minX
                                d1 = x190xb8
                                d0 = d1 - d0
                                d0 = d10 + d0
                                d1 = d8 + d0
                                rect.origin.x = d1
                                d0 = d9 - d0
                                rect.size.width = d0
                                // <+2792>
                            }
                            
                            // <+2792>
                        }
                        // <+2792>
                    }
                    // <+2792>
                }
                // <+2792>
            } else {
                // <+2620>
                d1 = 0
                d2 = x190xc8
                d1 = d1 - d2
                
                if !(d1 < d13) {
                    // <+2692>
                    if !(d3 < d0) {
                        // <+2792>
                    } else {
                        d1 = x190x38
                        d2 = x190xc8
                        d1 = d1 + d2
                        
                        if !(d12 < d1) {
                            // <+2792>
                        } else {
                            d1 = x190xb8
                            d10 = d0 - d1
                            
                            if !(d10 >= 0) {
                                // <+2792>
                            } else {
                                // <+2736>
                                if !(d10 > 0) {
                                    // <+2792>
                                } else {
                                    // <+2744>
                                    d8 = rect.origin.x
                                    d1 = rect.origin.y
                                    d9 = rect.size.width
                                    d3 = rect.size.height
                                    d0 = d8
                                    d2 = d9
                                    d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minX
                                    d1 = x190xb8
                                    d0 = d1 - d0
                                    d0 = d10 + d0
                                    d1 = d8 + d0
                                    rect.origin.x = d1
                                    d0 = d9 - d0
                                    rect.size.width = d0
                                    // <+2792>
                                }
                                
                                // <+2792>
                            }
                            
                            // <+2792>
                        }
                        
                        // <+2792>
                    }
                    
                    // <+2792>
                } else {
                    d2 = x190xb8
                    d10 = d14 - d2
                    
                    if !(d3 < d0) {
                        // <+2736>
                    } else {
                        // <+2656>
                        d1 = x190x38
                        d3 = x190xc8
                        d1 = d1 + d3
                        
                        if !(d12 < d1) {
                            // <+2736>
                        } else {
                            // <+2676>
                            d0 = d0 - d2
                            d10 = (d10 <= d0) ? d0 : d10
                            // <+2736>
                        }
                        
                        // <+2736>
                    }
                    
                    // <+2736>
                    if !(d10 > 0) {
                        // <+2792>
                    } else {
                        // <+2744>
                        d8 = rect.origin.x
                        d1 = rect.origin.y
                        d9 = rect.size.width
                        d3 = rect.size.height
                        d0 = d8
                        d2 = d9
                        d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minX
                        d1 = x190xb8
                        d0 = d1 - d0
                        d0 = d10 + d0
                        d1 = d8 + d0
                        rect.origin.x = d1
                        d0 = d9 - d0
                        rect.size.width = d0
                        // <+2792>
                    }
                    
                    // <+2792>
                }
                
                // <+2792>
            }
        }
        
        // <+2792>
        if cornerAdaptation.contains(.right) {
            // <+2892>
            d10 = x190x88
            d8 = x190x90
            d0 = d8
            d1 = d10
            d12 = x190x78
            d11 = x190x80
            d2 = d11
            d3 = d12
            d9 = CGRect(x: d0, y: d1, width: d2, height: d3).maxY
            d10 = CGRect(x: d8, y: d10, width: d11, height: d12).minX
            d12 = x190x50
            d11 = x190x58
            d0 = d11
            d1 = d12
            d14 = x190x40
            d13 = x190x48
            d2 = d13
            d3 = d14
            d8 = CGRect(x: d0, y: d1, width: d2, height: d3).minY
            d0 = CGRect(x: d11, y: d12, width: d13, height: d14).minX
            d3 = x190x18
            
            if !(d10 < d3) {
                // <+3080>
                d1 = x190x38
                d11 = x190xa0
                d2 = x190xc8
                
                if d0 < d3 {
                    // <+3112>
                    d1 = d1 + d2
                    
                    if !(d8 < d1) {
                        // <+3200>
                        // <+2812>
                    } else {
                        // <+3124>
                        d10 = d11 - d0
                        
                        if !(d10 >= 0) {
                            // <+3200>
                            // <+2812>
                        } else {
                            // <+3136>
                            if !(d10 > 0) {
                                // <+3200>
                                // <+2812>
                            } else {
                                // <+3144>
                                d0 = rect.origin.x
                                d1 = rect.origin.y
                                d8 = rect.size.width
                                d3 = rect.size.height
                                d2 = d8
                                d9 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
                                d0 = d9 - d11
                                d0 = d10 + d0
                                d0 = d8 - d0
                                rect.size.width = d0
                                // <+2812>
                            }
                            // <+2812>
                        }
                        // <+2812>
                    }
                    // <+2812>
                } else {
                    // <+3200>
                    // <+2812>
                }
            } else {
                // <+3012>
                d1 = 0
                d2 = x190xc8
                d1 = d1 - d2
                let flag = !(d1 < d9)
                d1 = x190x38
                d11 = x190xa0
                
                if flag {
                    // <+3104>
                    if !(d0 < d3) {
                        // <+3200>
                        // <+2812>
                    } else {
                        d1 = d1 + d2
                        
                        if !(d8 < d1) {
                            // <+3200>
                            // <+2812>
                        } else {
                            d10 = d11 - d0
                            
                            if !(d10 >= 0) {
                                // <+3200>
                                // <+2812>
                            } else {
                                // <+3136>
                                if !(d10 > 0) {
                                    // <+3200>
                                    // <+2812>
                                } else {
                                    // <+3144>
                                    d0 = rect.origin.x
                                    d1 = rect.origin.y
                                    d8 = rect.size.width
                                    d3 = rect.size.height
                                    d2 = d8
                                    d9 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
                                    d0 = d9 - d11
                                    d0 = d10 + d0
                                    d0 = d8 - d0
                                    rect.size.width = d0
                                    // <+2812>
                                }
                                // <+2812>
                            }
                            // <+2812>
                        }
                        // <+2812>
                    }
                    // <+2812>
                } else {
                    d10 = d11 - d10
                    
                    if !(d0 < d3) {
                        // <+3136>
                    } else {
                        d1 = d1 + d2
                        
                        if !(d8 < d1) {
                            // <+3136>
                        } else {
                            d0 = d11 - d0
                            d10 = (d10 <= d0) ? d0 : d10
                            // <+3136>
                        }
                    }
                    
                    // <+3136>
                    if !(d10 > 0) {
                        // <+3200>
                        // <+2812>
                    } else {
                        // <+3144>
                        d0 = rect.origin.x
                        d1 = rect.origin.y
                        d8 = rect.size.width
                        d3 = rect.size.height
                        d2 = d8
                        d9 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
                        d0 = d9 - d11
                        d0 = d10 + d0
                        d0 = d8 - d0
                        rect.size.width = d0
                        // <+2812>
                    }
                    // <+2812>
                }
                // <+2812>
            }
            // <+2812>
        } else {
            // <+2796>
        }
    }
    
    fileprivate func mergedInsets(regions: SafeAreaRegions, adaptCorners: Bool) -> SafeAreaInsets.MergedInsets {
        /*
         regions -> x0
         adaptCorners -> w1
         */
        var result = SafeAreaInsets.MergedInsets(
            unknown0: 0,
            unknown1: 0,
            unknown2: 0,
            unknown3: 0,
            unknown4: 0,
            unknown5: 0,
            unknown6: 0,
            unknown7: 0,
            unknown8: 0,
            unknown9: 0,
            unknown10: 0,
            unknown11: 0,
            unknown12: 0,
            unknown13: 0,
            unknown14: 0,
            unknown15: 0
        )
        
        var w15: Edge.Corner.Set
        if adaptCorners {
            // <+48>
            w15 = .all
        } else {
            // <+76>
            w15 = .none
        }
        
        // <+80>
        var v0_0: CGFloat = 0
        var v0_1: CGFloat = 0
        let d1: CGFloat = 0
        var d2: CGFloat = 0
        var d3: CGFloat = 0
        var w16: Edge.Corner.Set = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
        var d5: CGFloat = 0
        var d4: CGFloat = 0
        var d7: CGFloat = 0
        var d6: CGFloat = 0
        var d18: CGFloat = 0
        var d16: CGFloat = 0
        var v17_0: CGFloat = 0
        var v17_1: CGFloat = 0
        var v19_0: CGFloat = 0
        var v19_1: CGFloat = 0
        var v23_0: CGFloat = 0
        var v23_1: CGFloat = 0
        var v20_0: CGFloat = 0
        var v20_1: CGFloat = 0
        var v24_0: CGFloat = 0
        var v24_1: CGFloat = 0
        
        for element in self.elements.reversed() {
            // <+276>
            let v21_0 = element.insets.top
            let v21_1 = element.insets.leading
            let v22_0 = element.insets.bottom
            let v22_1 = element.insets.trailing
            
            if element.regions.intersection(regions).isEmpty {
                // <+592>
                var d9 = v21_1
                var w1 = w16.subtracting(.topTrailing)
                var w2 = w15.subtracting([.topLeading, .bottomLeading])
                w15 = (d9 == 0) ? w15 : w2
                w16 = (d9 == 0) ? w16 : w1
                d9 = v22_1
                w1 = w16.subtracting(.bottomTrailing)
                w2 = w15.subtracting([.topTrailing, .bottomTrailing])
                w15 = (d9 == 0) ? w15 : w2
                w16 = (d9 == 0) ? w16 : w1
                w1 = w16.subtracting(.topLeading)
                w2 = w15.subtracting([.topLeading, .topTrailing])
                w15 = (v21_0 == 0) ? w15 : w2
                w16 = (v21_0 == 0) ? w16 : w1
                w1 = w16.subtracting(.bottomLeading)
                w2 = w15.subtracting([.bottomLeading, .bottomTrailing])
                w15 = (v22_0 == 0) ? w15 : w2
                w16 = (v22_0 == 0) ? w16 : w1
                
                if w1.isEmpty {
                    // <+764>
                    w15 = []
                    // <+256>
                } else if let cornerInsets = element.cornerInsets {
                    // <+696>
                    let d31 = cornerInsets.topLeft.width
                    let d8 = cornerInsets.topLeft.height
                    let d29 = cornerInsets.topRight.width
                    let d30 = cornerInsets.topRight.height
                    let d27 = cornerInsets.bottomLeft.width
                    let d28 = cornerInsets.bottomLeft.height
                    let d25 = cornerInsets.bottomRight.width
                    let d26 = cornerInsets.bottomRight.height
                    var w17 = w15.subtracting([.topLeading])
                    w15 = (!(d8 > 0) || !(d31 > d1)) ? w15 : w17
                    w17 = w15.subtracting([.topTrailing])
                    w15 = (!(d30 > 0) || !(d29 > d1)) ? w15 : w17
                    w17 = w15.subtracting([.bottomLeading])
                    w15 = (!(d28 > 0) || !(d27 > d1)) ? w15 : w17
                    w17 = w15.subtracting([.bottomTrailing])
                    w15 = (!(d26 > 0) || !(d25 > d1)) ? w15 : w17
                    // <+256>
                } else {
                    // <+256>
                }
                
                // <+256>
            } else {
                if !w15.isEmpty, let cornerInsets = element.cornerInsets {
                    // <+328>
                    let d31 = cornerInsets.topLeft.width
                    let d8 = cornerInsets.topLeft.height
                    let d29 = cornerInsets.topRight.width
                    let d30 = cornerInsets.topRight.height
                    let d27 = cornerInsets.bottomLeft.width
                    let d28 = cornerInsets.bottomLeft.height
                    let d25 = cornerInsets.bottomRight.width
                    let d26 = cornerInsets.bottomRight.height
                    
                    if w15.contains(.topLeading) && (d31 > 0) && (d8 > 0) {
                        // <+348>
                        var w17 = (d18 < v19_0)
                        v23_0 = v19_1
                        w17 = (d16 < v23_0) || w17
                        d18 = w17 ? v19_0 : d18
                        d16 = w17 ? v23_0 : d16
                        d16 = d31 + d16
                        d18 = d8 + d18
                        result.unknown4 = d16
                        result.unknown5 = d18
                        // <+392>
                    } else {
                        // <+392>
                    }
                    
                    // <+392>
                    if w15.contains(.topTrailing) && (d29 > 0) && (d30 > 0) {
                        // <+412>
                        var w17 = (d7 < v19_0)
                        v23_0 = v20_1
                        w17 = (d6 < v23_0) || w17
                        d7 = w17 ? v19_0 : d7
                        d6 = w17 ? v23_0 : d6
                        d6 = d29 + d6
                        d7 = d30 + d7
                        result.unknown6 = d6
                        result.unknown7 = d7
                        // <+456>
                    } else {
                        // <+456>
                    }
                    
                    // <+456>
                    if w15.contains(.bottomLeading) && (d27 > 0) && (d28 > 0) {
                        // <+476>
                        var w17 = (d5 < v20_0)
                        v23_0 = v20_1
                        w17 = (d4 < v23_0) || w17
                        d5 = w17 ? v20_0 : d5
                        v23_0 = v19_1
                        d4 = w17 ? v23_0 : d4
                        d4 = d27 + d4
                        d5 = d28 + d5
                        result.unknown8 = d4
                        result.unknown9 = d5
                        // <+524>
                    } else {
                        // <+524>
                    }
                    
                    // <+524>
                    if w15.contains(.bottomTrailing) && (d25 > 0) && (d26 > 0) {
                        var w17 = (d2 < v20_0)
                        v23_0 = v20_1
                        w17 = (d3 < v23_0) || w17
                        d2 = w17 ? v20_0 : d2
                        d3 = w17 ? v23_0 : d3
                        d3 = d25 + d3
                        d2 = d26 + d2
                        result.unknown10 = d3
                        result.unknown11 = d2
                        // <+192>
                    } else {
                        // <+192>
                    }
                    
                    // <+192>
                } else {
                    // <+184>
                    v19_0 = v23_0
                    v19_1 = v23_1
                    // <+192>
                }
                
                // <+192>
                let v24_0_s = w16.intersection([.topLeading])
                let v24_1_s = w16.intersection([.topTrailing])
                let v23_0_s = w16.intersection([.bottomLeading])
                let v23_1_s = w16.intersection([.bottomTrailing])
                
                // <+212>
                v24_0 = v24_0_s.isEmpty ? 0 : v21_0
                v24_1 = v24_1_s.isEmpty ? 0 : v21_1
                v19_0 = v19_0 + v24_0
                v19_1 = v19_1 + v24_1
                
                v23_0 = v23_0_s.isEmpty ? 0 : v22_0
                v23_1 = v23_1_s.isEmpty ? 0 : v22_1
                v20_0 = v20_0 + v23_0
                v20_1 = v20_1 + v23_1
                
                result.unknown0 = v19_0
                result.unknown1 = v19_1
                result.unknown2 = v20_0
                result.unknown3 = v20_1
                
                v23_0 = v19_0
                v23_1 = v19_1
                v24_0 = v20_0
                v24_1 = v20_1
                // <+256>
            }
            
            // <+256>
            v0_0 = v0_0 + v21_0
            v0_1 = v0_1 + v21_1
            v17_0 = v17_0 + v22_0
            v17_1 = v17_1 + v22_1
        }
        
        result.unknown12 = v0_0
        result.unknown13 = v0_1
        result.unknown14 = v17_0
        result.unknown15 = v17_1

        return result
    }
}

extension SafeAreaInsets {
    struct Element {
        var regions: SafeAreaRegions // 0x0
        var insets: EdgeInsets // 0x8
        var cornerInsets: AbsoluteRectangleCornerInsets? // 0x28
    }
    
    enum OptionalValue {
        indirect case insets(SafeAreaInsets) // 0x1
        case empty // 0x0
    }
    
    // nominal type descriptor가 없음
    fileprivate struct MergedInsets {
        var unknown0: CGFloat
        var unknown1: CGFloat
        var unknown2: CGFloat
        var unknown3: CGFloat
        var unknown4: CGFloat
        var unknown5: CGFloat
        var unknown6: CGFloat
        var unknown7: CGFloat
        var unknown8: CGFloat
        var unknown9: CGFloat
        var unknown10: CGFloat
        var unknown11: CGFloat
        var unknown12: CGFloat
        var unknown13: CGFloat
        var unknown14: CGFloat
        var unknown15: CGFloat
    }
}

struct _SafeAreaInsetsModifier : PrimitiveViewModifier, MultiViewModifier {
    private(set) var elements: [SafeAreaInsets.Element]
    @safe nonisolated(unsafe) private(set) var nextInsets: SafeAreaInsets.OptionalValue?
    
    nonisolated init(insets: EdgeInsets, cornerInsets: AbsoluteRectangleCornerInsets?, nextInsets: SafeAreaInsets.OptionalValue?) {
        assertUnimplemented() // TODO
    }
    
    nonisolated init() {
        self.elements = []
        self.nextInsets = nil
    }
    
    nonisolated init(elements: [SafeAreaInsets.Element], nextInsets: SafeAreaInsets.OptionalValue?) {
        self.elements = elements
        self.nextInsets = nextInsets
    }
    
    @inline(always) // 원래 없음
    func combined(layoutDirection: LayoutDirection?) -> EdgeInsets {
        var insets = EdgeInsets.zero
        
        if !elements.isEmpty {
            for element in elements {
                insets.top += element.insets.top
                insets.leading += element.insets.leading
                insets.bottom += element.insets.bottom
                insets.trailing += element.insets.trailing
            }
            
            if let layoutDirection {
                insets.xFlipIfRightToLeft { return layoutDirection }
            }
        }
        
        return insets
    }
    
    @inline(always)
    static func _makeView(modifier: _GraphValue<_SafeAreaInsetsModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        // x29 = sp + 0x260
        /*
         modifier = w28
         inputs = x19
         body = sp + 0x10 & 0x18
         */
        // sp + 0x1a0
        let copy_1 = inputs
        // x25
        let id = CoordinateSpace.ID()
        // x23
        let cachedEnvironment = copy_1.base.cachedEnvironment
        // w22
        let transform = inputs.transform
        // sp, #0x140
        var copy_2 = inputs
        // x24
        let animatedPosition = cachedEnvironment.value.animatedPosition(for: copy_2)
        copy_2 = copy_1
        // x20
        let animatedSize = cachedEnvironment.value.animatedSize(for: copy_2)
        _ = consume cachedEnvironment
        
        // sp, #0x140
        let transformRule = _SafeAreaInsetsModifier.Transform(
            space: id,
            transform: transform,
            position: animatedPosition,
            size: animatedSize
        )
        // x24
        let transformAttribute = Attribute(transformRule)
        
        // sp, #0x140
        let insetsRule = _SafeAreaInsetsModifier.Insets(
            space: id,
            modifier: modifier.value,
            next: copy_1.safeAreaInsets
        )
        // x25
        let insetsAttribute = Attribute(insetsRule)
        
        // <+424>
        // sp, #0x80
        var copy_3 = inputs
        copy_3.transform = transformAttribute
        copy_3.safeAreaInsets = OptionalAttribute(insetsAttribute)
        // sp, #0x20
        let copy_4 = copy_3
        
        return body(_Graph(), copy_4)
    }
}

extension _SafeAreaInsetsModifier {
    fileprivate struct Transform : Rule, AsyncAttribute {
        let space: CoordinateSpace.ID
        @Attribute var transform: ViewTransform
        @Attribute var position: CGPoint
        @Attribute var size: ViewSize
        
        var value: ViewTransform {
            let space = space
            // positionAdjustment = d10/d11, pendingTranslation = d8/d9
            var transform = transform
            
            let position = position
            
            var adjusted = position
            adjusted -= transform.positionAdjustment
            let pendingTranslation = transform.pendingTranslation - CGSize(adjusted)
            
            transform.positionAdjustment = CGSize(width: position.x, height: position.y)
            transform.pendingTranslation = pendingTranslation
            
            transform.appendSizedSpace(id: space, size: size.value)
            return transform
        }
    }
    
    fileprivate struct Insets : Rule, AsyncAttribute {
        let space: CoordinateSpace.ID
        @Attribute var modifier: _SafeAreaInsetsModifier
        @OptionalAttribute var next: SafeAreaInsets?
        
        var value: SafeAreaInsets {
            /*
             space -> x24
             modifier -> w23
             next -> w22
             */
            let value: SafeAreaInsets.OptionalValue
            if let nextInsets = modifier.nextInsets {
                value = nextInsets
            } else if let next = $next {
                value = .insets(next.value)
            } else {
                value = .empty
            }
            
            let existing = modifier
            return SafeAreaInsets(
                space: space,
                elements: existing.elements,
                next: value
            )
        }
    }
}

@frozen public struct SafeAreaRegions : OptionSet {
    public static var all: SafeAreaRegions {
        SafeAreaRegions(rawValue: .max)
    }
    
    public static var container: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 0)
    }
    
    public static var keyboard: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 1)
    }
    
    public static var background: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 0)
    }
    
    public let rawValue: UInt
    
    @inlinable
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}  
