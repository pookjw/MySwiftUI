// 61C177A7FCD5136917C98992B59F3368
internal import Spatial
private import AttributeGraph
private import CoreGraphics
private import os.log

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
        var result = self.transform
        
        do {
            var position = self.position
            position = position - result.positionAdjustment
            position = -(position - result.pendingTranslation)
            result.pendingTranslation = CGSize(position)
            result.positionAdjustment = .zero
        }
        
        // <+228>
        if T._affectsLayout {
            // <+252>
            let size = self.size
            let depth = self.depth
            
            let size3D = Size3D(
                width: size.width,
                height: size.height,
                depth: depth.value
            )
            
            // x19 + 0x190
            let effectValue = self.effect.effectValue(size: size3D)
            // x19 + 0x110
            let transform: AffineTransform3D
            
            switch self.layoutDirection {
            case .leftToRight:
                // <+680>
                transform = effectValue
                // <+712>
            case .rightToLeft:
                // <+440>
                // x19 + 0x90
                let point3D = Point3D(x: 1, y: 1, z: 1)
                // x29 - 0x100
                let transform_2 = AffineTransform3D(scale: Size3D(point3D))
                // x19
                var copy_1 = transform_2
                copy_1.matrix.columns.0.x = -1
                copy_1.matrix.columns.3.x = size3D[.horizontal]
                
                // x29 - 0x100
                let copy_2 = copy_1
                // x19 + 0x90
                let transform_3 = copy_2.concatenating(effectValue)
                
                // <+612>
                // x29 - 0x100
                let copy_3 = copy_1
                // x19 + 0x110
                transform = transform_3.concatenating(copy_3)
                // <+712>
            }
            
            // <+712>
            // x29 - 0x100
            let copy_4 = transform
            
            if transform.isInvertible {
                // <+756>
                result.appendAffineTransform3D(copy_4, inverse: true)
                // <+880>
            } else {
                // <+776>
                Log.externalWarning("ignoring singular matrix: \(copy_4.description)")
                // <+880>
            }
        } else {
            // <+880>
        }
        
        // <+880>
        var d0 = self.pixelLength
        var d1 = result.depth.value
        let d2: CGFloat = 1
        
        if d0 != d2 {
            // <+928>
            d1 = d1 / d0
            d1 = round(d1)
            d0 = d0 * d1
            // <+940>
        } else {
            // <+920>
            d0 = round(d1)
            // <+940>
        }
        
        // <+940>
        result.depth.value = d0
        return result
    }
 }

fileprivate struct GeometryEffect3DDisplayList<T : _GeometryEffect3D> : Rule, AsyncAttribute, CustomStringConvertible {
    let identity: _DisplayList_Identity // 0x0
    @Attribute private(set) var effect: T // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var size: ViewSize // 0xc
    @Attribute private(set) var depth: ViewDepth // 0x10
    @Attribute private(set) var layoutDirection: LayoutDirection // 0x14
    @Attribute private(set) var containerPosition: CGPoint // 0x18
    private(set) var _content: OptionalAttribute<DisplayList> // 0x20
    let options: DisplayList.Options // 0x2c
    
    var content: DisplayList? {
        assertUnimplemented()
    }
    
    var value: DisplayList {
        // self -> x20
        let size = self.size
        let depth = self.depth
        
        let size3D = Size3D(
            width: size.width,
            height: size.height,
            depth: depth.value
        )
        var d8 = size3D.width
        var d9 = size3D.height
        var d10 = size3D.depth
        
        // x19 + 0x2f0
        let transform = self.effect.effectValue(size: size3D)
        // x19 + 0xc0
        var copy_1 = transform
        
        // <+332>
        switch self.layoutDirection {
        case .leftToRight:
            // <+664>
            break
        case .rightToLeft:
            // <+360>
            // x29 - 0x100
            let point = Point3D(x: 1, y: 1, z: 1)
            // x19 + 0x1e0
            let transform = AffineTransform3D(scale: Size3D(point))
            // x19 + 0x10
            var copy_2 = transform
            copy_2.matrix.columns.0.x = -1
            copy_2.matrix.columns.3.x = size3D[.horizontal]
            // x19 + 0x1e0
            let copy_3 = copy_2
            // x19 + 0x270
            let transform_2 = copy_3.concatenating(copy_1)
            // x19 + 0x1e0
            let copy_4 = copy_2
            // x29 - 0x100
            let transform_3 = transform_2.concatenating(copy_4)
            copy_1 = transform_3
            // <+680>
        }
        
        // <+680>
        // <+700>
        // x29 - 0x100
        let copy_2 = copy_1
        // x19 + 0x270 -> x23/w28/w27
        guard let content else {
            return DisplayList()
        }
        
        // <+812>
        // x19 + 0x1e0
        let copy_4 = copy_1
        let effect: DisplayList.Effect
        
        if copy_4.isInvertible {
            // <+868>
            if copy_2.isValid {
                // <+880>
                d8 = self.position.x
                
                let d0: CGFloat
                let d1: CGFloat
                do {
                    let containerPosition = self.containerPosition
                    d0 = containerPosition.x
                    d1 = containerPosition.y
                }
                
                d9 = d8 - d0
                d8 = d10 - d1
                
                if copy_2.is3DTransform {
                    // <+956>
                    // x19 + 0x1e0
                    let copy_5 = copy_1
                    effect = .transform(.affine3D(copy_5))
                    // <+1520>
                } else {
                    // <+1248>
                    // x19 + 0x1e0
                    let copy_5 = copy_1
                    
                    if copy_5.isTranslation {
                        // <+1304>
                        // x19 + 0x1e0
                        let copy_6 = copy_1
                        // x19 + 0x270
                        let translation = copy_6.translation
                        // x19 + 0x1e0
                        let size = Size3D(vector: translation.vector)
                        d9 = d9 + size.width
                        d8 = d8 + size.height
                        effect = .identity
                        // <+1520>
                    } else {
                        // <+1396>
                        // x19 + 0x1e0
                        let copy_5 = copy_1
                        effect = .transform(.affine3D(copy_5))
                        // <+1520>
                    }
                    
                    // <+1520>
                }
            } else {
                // <+1124>
                Log.externalWarning("ignoring invalid matrix: \(copy_2.description)")
                // <+1940>
                return DisplayList()
            }
        } else {
            // <+1064>
            Log.externalWarning("ignoring singular matrix: \(copy_2.description)")
            // <+1940>
            return DisplayList()
        }
        
        // <+1520>
        // x19 + 0x270
        var item = DisplayList.Item(
            .effect(effect, content),
            frame: CGRect(
                origin: CGPoint(x: d9, y: d8),
                size: self.size.value
            ),
            identity: self.identity,
            version: DisplayList.Version()
        )
        
        item.canonicalize(options: self.options)
        
        // <+1616>
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
