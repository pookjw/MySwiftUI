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
    let identity: _DisplayList_Identity
    @Attribute private(set) var effect: Effect
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var containerPosition: CGPoint
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets?
    @OptionalAttribute var content: DisplayList?
    let options: DisplayList.Options
    let localID: ScrapeableID
    let parentID: ScrapeableID
    
    var value: DisplayList {
        fatalError("TODO")
    }
}
