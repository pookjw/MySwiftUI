
@_spi(Internal)
open class PlatformScrollEdgeEffectTagDefinition {
    package static func apply(inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewInputs) -> _ViewOutputs? {
        assertUnimplemented()
    }
    
    @safe nonisolated(unsafe) package static var definition: PlatformScrollEdgeEffectTagDefinition.Type?
    
    package static func setDefinition(_ type: PlatformScrollEdgeEffectTagDefinition.Type) {
        definition = type
    }
    
    open class var modifier : any PlatformScrollEdgeEffectTagModifier.Type {
        preconditionFailure() // abstract
    }
}

@_spi(Internal) public protocol PlatformScrollEdgeEffectTagModifier : ViewModifier {
    }
