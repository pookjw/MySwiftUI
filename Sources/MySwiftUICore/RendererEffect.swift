internal import CoreGraphics

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
        let copy_2 = inputs
        // sp + 0x150
        var copy_3 = copy_1
        
        if !isScrapeable || !copy_1.needsGeometry {
            // <+204>
            if copy_1.preferences.contains(DisplayList.Key.self) {
                // <+236>
                // x27
                let cachedEnvironment = copy_1.base.cachedEnvironment
                if isolatesChildPosition {
                    // <+268>
                    copy_3 = copy_1
                    let position = cachedEnvironment.value.animatedPosition(for: copy_3)
                    // <+348>
                    fatalError("TODO")
                } else {
                    // <+784>
                    copy_3 = copy_1
                    // sp + 0x1f4
                    let position = cachedEnvironment.value.animatedPosition(for: copy_3)
                    // <+868>
                    fatalError("TODO")
                }
            } else {
                // <+868>
                fatalError("TODO")
            }
        } else {
            // <+700>
            fatalError("TODO")
        }
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
