// 61C177A7FCD5136917C98992B59F3368
internal import Spatial
private import AttributeGraph
private import CoreGraphics

protocol _GeometryEffect3D : ViewModifier, VisualEffect {
    func effectValue(size: Size3D) -> AffineTransform3D
    static var _affectsLayout: Bool { get }
}

extension _GeometryEffect3D {
    public typealias Body = Never
    
    static var _affectsLayout: Bool {
        return true
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self.makeGeometryEffect3D(modifier: effect, inputs: inputs, body: body)
    }
    
    nonisolated static func makeGeometryEffect3D(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        // x29 - 0xc0
        let copy_1 = inputs
        
        if !copy_1.base.options.contains(.viewNeedsGeometry) {
            // <+104>
            // x19 + 0x100
            let copy_2 = inputs
            return body(_Graph(), copy_2)
        } else {
            // <+156>
            /*
             body -> x2/x3 -> x19 + 0x8 / x28
             modifier -> x0 -> x19 + 0x38
             */
            // x19 + 0x100
            var copy_2 = inputs.base
            // x19 + 0x90
            let _ = copy_1.base
            // x19 + 0x1c
            let effect = Self.makeAnimatable(value: modifier, inputs: copy_2)
            _ = consume copy_2
            
            let layoutDirection = copy_1.layoutDirection
            let pixelLength = copy_1.base.pixelLength
            
            // x19 + 0x100
            var copy_3 = copy_1
            
            let animatedSize = copy_1.animatedSize()
            let position = copy_1.animatedPosition()
            let depth = copy_1.animatedDepth()
            
            // x19 + 0x90
            let viewTransform = GeometryEffect3DTransform<Self>(
                effect: effect,
                size: animatedSize,
                position: position,
                depth: depth,
                transform: inputs.transform,
                layoutDirection: layoutDirection,
                pixelLength: pixelLength
            )
            let viewTransformRule = Attribute(viewTransform)
            copy_3.transform = viewTransformRule
            
            // <+776>
            let zeroPoint = ViewGraph.current.$zeroPoint
            copy_3.containerPosition = zeroPoint
            copy_3.position = zeroPoint
            
            let viewSize = RoundedSize(
                position: inputs.position,
                size: inputs.size,
                pixelLength: pixelLength
            )
            let viewSizeAttribute = Attribute(viewSize)
            
            // <+920>
            copy_3.size = viewSizeAttribute
            // x26
            var outputs = body(_Graph(), copy_3)
            
            // <+956>
            if copy_1.preferences.contains(DisplayList.Key.self) {
                // <+972>
                // w22
                let displayListID: _DisplayList_Identity
                
                if copy_1.base.options.contains(.needsStableDisplayListIDs) {
                    // <+1580>
                    // x19 + 0x90
                    let stableID = copy_1[_DisplayList_StableIdentityScope.self].attribute!
                    displayListID = stableID.value.pushIdentity()
                    // <+1008>
                } else {
                    // <+980>
                    displayListID = _DisplayList_Identity()
                    // <+1008>
                }
                
                // <+1008>
                // x19 + 0x90
                let displayList = GeometryEffect3DDisplayList<Self>(
                    identity: displayListID,
                    effect: effect,
                    position: copy_1.animatedPosition(),
                    size: copy_1.animatedSize(),
                    depth: copy_1.animatedDepth(),
                    layoutDirection: layoutDirection,
                    containerPosition: inputs.containerPosition,
                    _content: OptionalAttribute(outputs[DisplayList.Key.self]),
                    options: copy_1[DisplayList.Options.self]
                )
                
                outputs[DisplayList.Key.self] = Attribute(displayList)
                // <+1468>
            } else {
                // <+1468>
            }
            
            return outputs
        }
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self._makeVisualEffect(effect: modifier, inputs: inputs, body: body)
    }
}

fileprivate struct GeometryEffect3DTransform<T : _GeometryEffect3D> : Rule, AsyncAttribute {
    @Attribute private(set) var effect: T
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var depth: ViewDepth
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var layoutDirection: LayoutDirection
    @Attribute private(set) var pixelLength: CGFloat
    
    var value: ViewTransform {
        var transform = self.transform
        
        do {
            var position = self.position
            position -= transform.positionAdjustment
            position -= transform.pendingTranslation
            transform.pendingTranslation = CGSize(position)
            transform.positionAdjustment = .zero
        }
        
        // <+228>
        _ = T._affectsLayout
        assertUnimplemented()
    }
 }

fileprivate struct GeometryEffect3DDisplayList<T> : Rule, AsyncAttribute, CustomStringConvertible {
    let identity: _DisplayList_Identity
    @Attribute private(set) var effect: T
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var depth: ViewDepth
    @Attribute private(set) var layoutDirection: LayoutDirection
    @Attribute private(set) var containerPosition: CGPoint
    private(set) var _content: OptionalAttribute<DisplayList>
    let options: DisplayList.Options
    
    var content: DisplayList? {
        assertUnimplemented()
    }
    
    var value: DisplayList {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
