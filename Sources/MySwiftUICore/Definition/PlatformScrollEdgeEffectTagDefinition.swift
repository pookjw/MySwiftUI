#warning("TODO")

@_spi(Internal)
open class PlatformScrollEdgeEffectTagDefinition {
    package static func apply(inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewInputs) -> _ViewOutputs? {
        fatalError("TODO")
    }
    
    package static nonisolated(unsafe) var definition: PlatformScrollEdgeEffectTagDefinition.Type?
    
    package static func setDefinition(_ type: PlatformScrollEdgeEffectTagDefinition.Type) {
        unsafe definition = type
    }
    
    open class var modifier: any PlatformScrollEdgeEffectTagModifier.Type {
        fatalError() // abstract
    }
}

@_spi(Internal) public protocol PlatformScrollEdgeEffectTagModifier: ViewModifier {
    }
