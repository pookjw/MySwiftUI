import AttributeGraph
import CoreGraphics

package struct CachedEnvironment {
    package var environment: AttributeGraph.Attribute<EnvironmentValues>
    private let items: [Item]
    private let animatedFrame: AnimatedFrame?
    private let resolvedShapeStyles: [ResolvedShadowStyle: AttributeGraph.Attribute<_ShapeStyle_Pack>]
    private let platformCache: PlatformCache
    
    package func animatedPosition(for inputs: _ViewInputs) -> AttributeGraph.Attribute<ViewOrigin> {
        fatalError("TODO")
    }
    
    package func animatedSize(for inputs: _ViewInputs) -> AttributeGraph.Attribute<ViewSize> {
        fatalError("TODO")
    }
    
    package func animatedCGSize(for inputs: _ViewInputs) -> AttributeGraph.Attribute<CGSize> {
        fatalError("TODO")
    }
    
    package func resolvedShapeStyles(
        for inputs: _ViewInputs,
        role: ShapeRole,
        mode: AttributeGraph.Attribute<_ShapeStyle_ResolverMode>?
    ) -> AttributeGraph.Attribute<_ShapeStyle_Pack> {
        fatalError("TODO")
    }
    
    package func attribute<Value>(keyPath: KeyPath<EnvironmentValues, Value>) -> AttributeGraph.Attribute<Value> {
        fatalError("TODO")
    }
}

extension CachedEnvironment {
    package struct AnimatedFrame {
        
    }
}

extension CachedEnvironment {
    package struct PlatformCache {
        
    }
}

extension CachedEnvironment {
    struct Item {
        
    }
}
