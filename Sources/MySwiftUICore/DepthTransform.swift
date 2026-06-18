// 7155BC0A5DB12E9050135C0952700740
internal import AttributeGraph
private import CoreGraphics

extension _ViewOutputs {
    static func makeDepthTransform(inputs: _ViewInputs, depth: () -> Attribute<ViewDepth>, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var inputs = inputs
        
        if inputs.needsGeometry {
            inputs.transform = Attribute(
                DepthTransform(
                    transform: inputs.transform,
                    depth: depth()
                )
            )
        }
        
        return body(inputs)
    }
    
    static func makeDepthTransform(inputs: _ViewInputs, geometry: () -> Attribute<ViewDepthGeometry>, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         inputs -> x0 -> x27
         geometry -> x1/x2 -> x24/x20
         body -> x3/x4 -> sp + 0x28 / x23
         */
        // x29 - 0xc0
        let copy_1 = inputs
        // sp + 0x14
        let containsDisplayList = copy_1.preferences.contains(DisplayList.Key.self, includeHostPreferences: false)
        
        // w21
        let options = copy_1.base.options
        
        guard options.contains(.viewNeedsGeometry) || containsDisplayList else {
            // sp + 0xf0
            let copy_2 = inputs
            return body(copy_2)
        }
        
        // <+204>
        // sp
        let geometryAttribute = geometry()
        
        // sp + 0xf0
        let originRule = AnimatableDepthOriginAttribute(
            position: geometryAttribute[keyPath: \.origin],
            pixelLength: copy_1.base.pixelLength,
            environment: copy_1.environment,
            helper: AnimatableAttributeHelper<ViewDepthOrigin>(
                phase: copy_1.base.phase,
                time: copy_1.base.time,
                transaction: copy_1.base.transaction
            ),
            animationsDisabled: copy_1.base.options.contains(.animationsDisabled)
        )
        
        // w24
        let originAttribute = Attribute(originRule)
        originAttribute.flags = .unknown0
        
        // <+484>
        // sp + 0xf0
        var copy_2 = inputs
        // sp + 0x50
        var copy_3: _ViewInputs
        
        if options.contains(.viewNeedsGeometry) {
            // <+520>
            copy_3 = copy_1
            
            // w27
            let pixelLength = copy_1.base.pixelLength
            // w20
            let position = copy_3.animatedPosition()
            // sp + 0x50
            let transformRule = DepthGeometryTransform(
                transform: copy_1.transform,
                position: position,
                depthPosition: originAttribute,
                depthSize: geometryAttribute[keyPath: \.size],
                pixelLength: pixelLength
            )
            copy_2.transform = Attribute(transformRule)
            
            // sp + 0x50
            let positionRule = ResetPositionIfOffset(
                position: copy_1.position,
                depthPosition: originAttribute
            )
            copy_2.position = Attribute(positionRule)
            
            let containerPositionRule = ResetPositionIfOffset(
                position: copy_1.containerPosition,
                depthPosition: originAttribute
            )
            copy_2.containerPosition = Attribute(containerPositionRule)
            
            // <+880>
            // sp + 0x50
            let sizeRule = RoundedSizeIfOffset(
                position: copy_1.position,
                size: copy_1.size,
                depthPosition: originAttribute,
                pixelLength: pixelLength
            )
            copy_2.size = Attribute(sizeRule)
            // <+984>
        } else {
            // <+972>
            copy_3 = copy_1
            // <+984>
        }
        
        // <+984>
        copy_3 = copy_2
        
        // x26
        var outputs = body(copy_3)
        
        guard containsDisplayList else {
            return outputs
        }
        
        let identity: _DisplayList_Identity
        if options.contains(.needsStableDisplayListIDs) {
            // <+1480>
            identity = copy_1.base[_DisplayList_StableIdentityScope.self].attribute!.value.pushIdentity()
            // <+1080>
        } else {
            // <+1052>
            identity = _DisplayList_Identity()
            // <+1080>
        }
        
        // <+1080>
        // sp + 0x50
        let displayListRule = DisplayListZOrigin(
            position: copy_1.animatedPosition(),
            size: copy_1.animatedSize(),
            containerPosition: copy_1.containerPosition,
            origin: originAttribute,
            content: OptionalAttribute(outputs.preferences[DisplayList.Key.self]),
            identity: identity,
            options: copy_1.base[DisplayList.Options.self]
        )
        
        let displayListAttribute = Attribute(displayListRule)
        outputs.preferences[DisplayList.Key.self] = displayListAttribute
        
        return outputs
    }
}

fileprivate struct DepthTransform : Rule, AsyncAttribute {
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var depth: ViewDepth
    
    var value: ViewTransform {
        var transform = transform
        transform.depth = depth
        return transform
    }
}

struct AnimatableDepthOriginAttribute : ObservedAttribute, AsyncAttribute, StatefulRule {
    @Attribute fileprivate private(set) var position: ViewDepthOrigin
    @Attribute fileprivate private(set) var pixelLength: CGFloat
    @Attribute fileprivate private(set) var environment: EnvironmentValues
    fileprivate private(set) var helper: AnimatableAttributeHelper<ViewDepthOrigin>
    fileprivate let animationsDisabled: Bool
    
    typealias Value = ViewDepthOrigin
    
    mutating func updateValue() {
        // self -> x20
        let (position, positionChanged) = self.$position.changedValue(options: [])
        let d8 = position.value
        let (pixelLength, pixelLengthChanged) = self.$pixelLength.changedValue(options: [])
        var d0 = pixelLength
        
        let sp0x10 = positionChanged || pixelLengthChanged
        var d1: CGFloat = 1
        
        if d0 != d1 {
            // <+132>
            d1 = d8 / d0
            d1 = round(d1)
            d0 = d0 * d1
            // <+144>
        } else {
            d0 = round(d8)
            // <+144>
        }
        
        // sp + 0x8
        var value = (value: ViewDepthOrigin(d0), changed: sp0x10)
        
        // <+144>
        self.helper.update(
            value: &value,
            defaultAnimation: nil,
            environment: self.$environment,
            sampleCollector: { _, _ in
            }
        )
        
        if value.changed || !self.hasValue {
            self.value = value.value
        }
    }
    
    func destroy() {
        assertUnimplemented()
    }
}

fileprivate struct DepthGeometryTransform : Rule, AsyncAttribute {
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var depthPosition: ViewDepthOrigin
    @Attribute private(set) var depthSize: ViewDepth
    @Attribute private(set) var pixelLength: CGFloat
    
    var value: ViewTransform {
        assertUnimplemented()
    }
}

fileprivate struct ResetPositionIfOffset : AsyncAttribute, Rule {
    @Attribute var position: CGPoint
    @Attribute var depthPosition: ViewDepthOrigin
    
    var value: CGPoint {
        assertUnimplemented()
    }
}

fileprivate struct RoundedSizeIfOffset : AsyncAttribute, Rule {
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var depthPosition: ViewDepthOrigin
    @Attribute private(set) var pixelLength: CGFloat
    
    var value: ViewSize {
        // self -> x0/x1 -> x21/x22
        let d0 = self.depthPosition.value
        
        guard d0 != 0 else {
            return self.size
        }
        
        // <+100>
        var frame = ViewFrame(origin: self.position, size: self.size)
        frame.round(toMultipleOf: self.pixelLength)
        return frame.size
    }
}

fileprivate struct DisplayListZOrigin : AsyncAttribute, Rule {
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var containerPosition: CGPoint
    @Attribute private(set) var origin: ViewDepthOrigin
    @OptionalAttribute var content: DisplayList?
    let identity: _DisplayList_Identity
    let options: DisplayList.Options
    
    var value: DisplayList {
        assertUnimplemented()
    }
}
