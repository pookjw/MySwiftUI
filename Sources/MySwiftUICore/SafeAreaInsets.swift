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
        let d12 = size.height
        let d13 = size.width
        
        // x19 + 0xe0
        let mergedInsets = self.mergedInsets(regions: regions, adaptCorners: !cornerAdaptation.isEmpty)
        
        // <+144>
        let flag: Bool
        do {
            var v0_0: UInt64 = (mergedInsets.unknown0 == 0) ? .max : 0
            var v0_1: UInt64 = (mergedInsets.unknown1 == 0) ? .max : 0
            let v1_0: UInt64 = (mergedInsets.unknown2 == 0) ? .max : 0
            let v1_1: UInt64 = (mergedInsets.unknown3 == 0) ? .max : 0
            
            v0_0 = ((v0_0 << 32) >> 32) | (v0_1 << 32)
            v0_1 = ((v1_0 << 32) >> 32) | (v1_1 << 32)
            v0_0 = ~v0_0
            v0_1 = ~v0_1
            
            let s0 = max(
                (v0_0 << 32) >> 32,
                (v0_0 >> 32),
                (v0_1 << 32) >> 32,
                (v0_1 >> 32)
            )
            
            flag = (s0 & 1) != 0
        }
        
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
            case .affineTransform(let transform, let inverse):
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
