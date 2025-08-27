#warning("TODO")
private import AttributeGraph
private import CoreGraphics

struct CachedEnvironment {
    private var environment: Attribute<EnvironmentValues>
    private var mapItems: [MapItem]
    private var animatedFrame: [AnimatedFrame]
    private var resolvedShapeStyles: [ResolvedShapeStyles]
    private var platformCache: CachedEnvironment.PlatformCache
}

extension CachedEnvironment {
    struct ID {
        var base: UniqueID
    }
}

extension CachedEnvironment {
    struct AnimatedFrame {
        private let position: Attribute<CGPoint>
        private let size: Attribute<ViewSize>
        private let pixelLength: Attribute<CGFloat>
        private let time: Attribute<Time>
        private let transaction: Attribute<Transaction>
        private let viewPhase: Attribute<_GraphInputs.Phase>
        private let animatedFrame: Attribute<ViewFrame>
        private var _animatedPosition: Attribute<CGPoint>?
        private var _animatedSize: Attribute<ViewSize>?
        private var _animatedCGSize: Attribute<CGSize>?
    }
}

extension CachedEnvironment {
    fileprivate struct MapItem {
        var key: CachedEnvironment.ID
        var value: AnyAttribute
    }
}

fileprivate struct ResolvedShapeStyles {
    private let environment: Attribute<EnvironmentValues>
    private let time: Attribute<Time>
    private let transaction: Attribute<Transaction>
    private let mode: OptionalAttribute<_ShapeStyle_ResolverMode>
    private let role: ShapeRole
    private let substrate: Material.Substrate?
    private let animationsDisabled: Bool
}
