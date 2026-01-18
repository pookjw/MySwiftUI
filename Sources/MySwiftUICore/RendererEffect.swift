// 49800242E3DD04CB91F7CE115272DDC3
internal import CoreGraphics
private import AttributeGraph

protocol _RendererEffect: MultiViewModifier, PrimitiveViewModifier {
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect
    static nonisolated var isolatesChildPosition: Bool { get }
    static nonisolated var disabledForFlattenedContent: Bool { get }
    static nonisolated var preservesEmptyContent: Bool { get }
    static nonisolated var isScrapeable: Bool { get }
}

extension _RendererEffect {
    static nonisolated var isolatesChildPosition: Bool {
        return false
    }
    
    static nonisolated var disabledForFlattenedContent: Bool {
        return false
    }
    
    static nonisolated var preservesEmptyContent: Bool {
        return false
    }
    
    static nonisolated var isScrapeable: Bool {
        return false
    }
    
    static nonisolated func _makeRendererEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         effect -> x19 + 0x3c
         */
        // sp + 0x210
        let copy_1 = inputs
        // sp + 0x1b0
        var copy_2 = inputs
        // sp + 0x150
        var copy_3 = copy_1
        
        // sp + 0x30
        let scrapeableID: ScrapeableID
        if isScrapeable && copy_1.needsGeometry {
            // <+700>
            let hasDisplayList = copy_1.preferences.contains(DisplayList.Key.self)
            
            if !copy_1.base.options.contains(.doNotScrape) && hasDisplayList {
                scrapeableID = ScrapeableID()
                copy_2.scrapeableParentID = scrapeableID
            } else {
                scrapeableID = .none
            }
        } else {
            // <+204>
            scrapeableID = .none
        }
        
        // <+208>
        // w22
        let hasDisplayList = copy_1.preferences.contains(DisplayList.Key.self)
        if hasDisplayList {
            // <+236>
            // x27
            let cachedEnvironment = copy_1.base.cachedEnvironment
            if isolatesChildPosition {
                // <+268>
                copy_3 = copy_1
                // sp + 0x150
                let position = cachedEnvironment.value.animatedPosition(for: copy_3)
                // <+348>
                // sp + 0x1ec
                let transform = Attribute(ResetPositionTransform(position: position, transform: copy_1.transform))
                copy_2.transform = transform
                
                let graph = ViewGraph.current
                
                let pixelLength: Attribute<CGFloat> = cachedEnvironment.value.attribute(id: .pixelLength) { environmentValues in
                    // $s7SwiftUI17CachedEnvironmentV17withAnimatedFrame33_B62A4B04AF9F1325924A089D63071424LL3for4bodyxAA11_ViewInputsV_xAC0fG0VzXEtlF12CoreGraphics7CGFloatVAA0D6ValuesVcfU_
                    fatalError("TODO")
                }
                
                let size = Attribute(RoundedSize(position: position, size: copy_1.size, pixelLength: pixelLength))
                copy_2.size = size
                // <+868>
            } else {
                // <+784>
                copy_3 = copy_1
                // sp + 0x1f4
                let position = cachedEnvironment.value.animatedPosition(for: copy_3)
                // <+868>
            }
        }
        
        // <+868>
        // sp + 0xf0
        let copy_4 = copy_2
        // sp + 0x90
        let copy_5 = copy_2
        copy_3 = copy_4
        // sp + 0x68
        var outputs = body(_Graph(), copy_5)
       
        if hasDisplayList {
            // <+988>
            // sp + 0x18
            let inputOptions = copy_1.base.options
            // w22
            let identity = _DisplayList_Identity()
            // sp + 0x50
            let copy_6 = copy_1
            // x27
            let cachedEnvironment = copy_1.base.cachedEnvironment
            if copy_1.base.needsStableDisplayListIDs {
               // <+1712>
                copy_6[_DisplayList_StableIdentityScope.self].attribute!.value.pushIdentity(identity: identity)
            }
            
            // sp + 0x90
            var copy_7 = copy_1
            // w25
            let position = cachedEnvironment.value.animatedPosition(for: copy_7)
            copy_7 = copy_1
            // w20
            let size = cachedEnvironment.value.animatedSize(for: copy_7)
            // w22
            let displayList: OptionalAttribute<DisplayList>
            if let attribute: Attribute<DisplayList> = outputs[DisplayList.Key.self] {
                displayList = OptionalAttribute(attribute)
            } else {
                displayList = OptionalAttribute()
            }
            // w24
            let options = copy_6[DisplayList.Options.self]
            // w8
            let scrapeableParentID = copy_6.scrapeableParentID
            // <+1284>
            let renderEffectDisplayList = Attribute(
                RendererEffectDisplayList<Self>(
                    identity: identity,
                    effect: effect.value,
                    position: position,
                    size: size,
                    transform: copy_1.transform,
                    containerPosition: copy_1.position,
                    environment: cachedEnvironment.value.environment,
                    safeAreaInsets: copy_1.safeAreaInsets,
                    content: displayList,
                    options: options,
                    localID: scrapeableID,
                    parentID: scrapeableParentID
                )
            )
            
            let isScrapeable = Self.isScrapeable
            if inputOptions.contains(.viewNeedsGeometry) && isScrapeable {
                renderEffectDisplayList.flags.formUnion(.unknown3)
            }
            
            // <+1552>
            outputs[DisplayList.Key.self] = renderEffectDisplayList
        }
        
        // <+1592>
        return outputs
    }
    
    var scrapeableContent: ScrapeableContent.Content? {
        fatalError("TODO")
    }
}

protocol RendererEffect: Animatable, _RendererEffect {
}

extension RendererEffect {
    static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
    
    static nonisolated func makeRendererEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

fileprivate struct RendererEffectDisplayList<Effect: _RendererEffect>: Rule, AsyncAttribute, ScrapeableAttribute {
    let identity: _DisplayList_Identity // 0x4
    @Attribute private(set) var effect: Effect // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var size: ViewSize // 0xc
    @Attribute private(set) var transform: ViewTransform // 0x10
    @Attribute private(set) var containerPosition: CGPoint // 0x14
    @Attribute private(set) var environment: EnvironmentValues // 0x18
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets? // 0x1c
    @OptionalAttribute var content: DisplayList? // 0x20
    let options: DisplayList.Options // 0x2c
    let localID: ScrapeableID
    let parentID: ScrapeableID
    
    var value: DisplayList {
        // sp + 0x80
        let copy_1 = self
        // sp + 0x1a0
        let copy_2 = self
        let content_0 = copy_2.content
        // sp + 0x150 -> x26(items), x19(features, properties) -> x25, sp + 0x68
        var content = content_0 ?? DisplayList()
        
        if content.items.isEmpty {
            guard Effect.preservesEmptyContent else {
                return DisplayList()
            }
        }
        
        // <+164>
        // x20
        let version = DisplayList.Version(forUpdate: ())
        let currentAttribute = Graph.currentAttribute
        assert(currentAttribute != .empty)
        
        /*
         x26 -> sp + 0x48
         version -> sp + 0x50
         x25 -> sp + 0x58
         return pointer -> sp + 0x60
         */
        // sp + 0x40
        var properties = content.properties
        properties.formUnion(.privacySensitive)
        
        var proxy = GeometryProxy(
            owner: currentAttribute,
            size: $size,
            environment: $environment,
            transform: $transform,
            position: $position,
            safeAreaInsets: $safeAreaInsets,
            seed: UInt32(version.value)
        )
        
        // x23, w21, w24 -> sp + 0x1f8
        let displayEffectValue: DisplayList.Effect
        if Effect.disabledForFlattenedContent && content.features.contains(.flattened) {
            // <+352>
            displayEffectValue = .identity
            // <+544>
        } else {
            // <+388>
            displayEffectValue = proxy.asCurrent { [copy_1] in
                // $s7SwiftUI25RendererEffectDisplayList33_49800242E3DD04CB91F7CE115272DDC3LLV5valueAA0eF0VvgAG0D0OyXEfU_
                // copy_1 -> x20
                // x25
                let effect = copy_1.effect
                // d0, d1
                let size = copy_1.size
                return effect.effectValue(size: size.value)
            }
            // <+544>
        }
        
        // <+544>
        let position = copy_1.position
        var d8 = position.x
        var d9 = position.y
        
        let containerPosition = copy_1.containerPosition
        var d0 = containerPosition.x
        var d1 = containerPosition.y
        
        d8 = d8 - d0
        d9 = d9 - d1
        
        // <+604>
        // properties -> x10, content.items -> x9
        // x25 (properties_2 | content.features)
        var properties_2: DisplayList.Properties
        if content_0 == nil {
            properties_2 = .privacySensitive
        } else {
            properties_2 = properties
        }
        
        let size = copy_1.size
        let identity = copy_1.identity
        
        content.properties = properties_2
        
        // sp + 0x100
        var item = DisplayList.Item(
            .effect(displayEffectValue, content),
            frame: CGRect(x: d8, y: d9, width: size.width, height: size.height),
            identity: identity,
            version: version
        )
        
        item.canonicalize(options: copy_2.options)
        
        return DisplayList(item)
    }
}
