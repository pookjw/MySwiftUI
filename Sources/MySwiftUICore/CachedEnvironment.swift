#warning("TODO")
internal import AttributeGraph
private import CoreGraphics

struct CachedEnvironment {
    var environment: Attribute<EnvironmentValues>
    private var mapItems: [MapItem] = []
    private var animatedFrame: [AnimatedFrame] = []
    private var resolvedShapeStyles: [ResolvedShapeStyles] = []
    private var platformCache = CachedEnvironment.PlatformCache()
    
    init(environment: Attribute<EnvironmentValues>) {
        self.environment = environment
    }
    
    mutating func attribute<T>(id: CachedEnvironment.ID, _ body: @escaping (EnvironmentValues) -> T) -> Attribute<T> {
        for mapItem in mapItems {
            if mapItem.key == id {
                return Attribute(identifier: mapItem.value)
            }
        }
        
        let map = Map<EnvironmentValues, T>(environment, body)
        let attribute = Attribute(map)
        let mapItem = MapItem(key: id, value: attribute.identifier)
        mapItems.append(mapItem)
        
        return attribute
    }
    
    func animatedPosition(for inputs: _ViewInputs) -> Attribute<CGPoint> {
        /*
         x29 = sp + 0x220
         x23 = sp + 0x60
         */
        // sp + 0x180 (x29 - 0xa0 / x23 + 0x120)
        var copy_1 = inputs
        
        guard !copy_1.base.options.isEmpty else {
            return inputs.position
        }
        
        // <+80>
        // inputs = x19
        fatalError("TODO")
    }
    
    func animatedSize(for inputs: _ViewInputs) -> Attribute<ViewSize> {
        fatalError("TODO")
    }
    
    func animatedCGSize(for inputs: _ViewInputs) -> Attribute<CGSize> {
        fatalError("TODO")
    }
}

extension CachedEnvironment {
    struct ID: Equatable {
        static let layoutDirection = CachedEnvironment.ID(base: UniqueID())
        
        var base: UniqueID
    }
    
    struct PlatformCache {
        private var animatedDepth: AnimatedDepth? = nil
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

fileprivate struct AnimatedDepth {
    let transform: Attribute<ViewTransform>
    let pixelLength: Attribute<CGFloat>
    let time: Attribute<Time>
    let transaction: Attribute<Transaction>
    let viewPhase: Attribute<_GraphInputs.Phase>
    let animatedDepth: Attribute<ViewDepth>
}
