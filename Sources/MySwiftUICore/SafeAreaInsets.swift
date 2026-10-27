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
        let x190xa8 = CGRect(x: d9, y: d12, width: d8, height: d10).minY
        let x190xb0 = CGRect(x: d9, y: d12, width: d8, height: d10).maxY
        let x190xb8 = CGRect(x: d9, y: d12, width: d8, height: d10).minX
        var x190x20 = d12
        var x190x28 = d9
        let x190x80 = d10
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
        let d14 = x190x98
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
        let d3: CGFloat
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
        x190x70 = rect_4.size.height
        x190x78 = rect_4.size.width
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
        assertUnimplemented()
    }
    
    fileprivate func mergedInsets(regions: SafeAreaRegions, adaptCorners: Bool) -> SafeAreaInsets.MergedInsets {
        assertUnimplemented()
    }
}

extension SafeAreaInsets {
    struct Element {
        var regions: SafeAreaRegions
        var insets: EdgeInsets
        var cornerInsets: AbsoluteRectangleCornerInsets?
    }
    
    enum OptionalValue {
        indirect case insets(SafeAreaInsets) // 0x1
        case empty // 0x0
    }
    
    // nominal type descriptor가 없음
    fileprivate struct MergedInsets {
        let unknown0: CGFloat
        let unknown1: CGFloat
        let unknown2: CGFloat
        let unknown3: CGFloat
        let unknown4: CGFloat
        let unknown5: CGFloat
        let unknown6: CGFloat
        let unknown7: CGFloat
        let unknown8: CGFloat
        let unknown9: CGFloat
        let unknown10: CGFloat
        let unknown11: CGFloat
        let unknown12: CGFloat
        let unknown13: CGFloat
        let unknown14: CGFloat
        let unknown15: CGFloat
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
