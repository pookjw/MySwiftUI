// B62A4B04AF9F1325924A089D63071424
#warning("TODO")
package import AttributeGraph
private import CoreGraphics

package struct CachedEnvironment {
    var environment: Attribute<EnvironmentValues>
    private var mapItems: [MapItem] = []
    private var animatedFrame: AnimatedFrame?
    private var resolvedShapeStyles: [ResolvedShapeStyles] = []
    private var platformCache = CachedEnvironment.PlatformCache()
    
    init(environment: Attribute<EnvironmentValues>) {
        self.environment = environment
    }
    
    package mutating func attribute<T>(id: CachedEnvironment.ID, _ body: @escaping (EnvironmentValues) -> T) -> Attribute<T> {
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
    
    mutating func animatedPosition(for inputs: _ViewInputs) -> Attribute<CGPoint> {
        /*
         x29 = sp + 0x220
         x23 = sp + 0x60
         */
        // sp + 0x180 (x29 - 0xa0 / x23 + 0x120)
        let copy_1 = inputs
        
        guard !copy_1.base.options.isEmpty else {
            return inputs.position
        }
        
        // <+80>
        // inputs = x19
        // sp + 0x120 (x29 - 0x1c0 / x23 + 0xc0)
        var copy_2 = inputs
        // w24
        var transaction = copy_2.base.transaction
        if let saved = copy_2.savedTransactions.first {
            transaction = saved
        }
        copy_2.base.transaction = transaction
        
        // inlined
        return withAnimatedFrame(for: copy_2) { animatedFrame in
            return animatedFrame.animatedPosition()
        }
    }
    
    mutating func animatedSize(for inputs: _ViewInputs) -> Attribute<ViewSize> {
        var copy = inputs
        guard copy.base.options.contains(.viewNeedsGeometry) else {
            return copy.size
        }
        
        // <+112>
        var transaction = copy.base.transaction
        if let saved = copy.savedTransactions.first {
            transaction = saved
        }
        copy.base.transaction = transaction
        
        // inlined
        return withAnimatedFrame(for: copy) { animatedFrame in
            return animatedFrame.animatedSize()
        }
    }
    
    mutating func animatedCGSize(for inputs: _ViewInputs) -> Attribute<CGSize> {
        /*
         x29 = sp + 0x220
         x23 = sp + 0x60
         */
        // sp + 0x180
        var copy = inputs
        guard copy.base.options.contains(.viewNeedsGeometry) else {
            return copy.size[keyPath: \.value]
        }
        
        // <+112>
        var transaction = copy.base.transaction
        if let saved = copy.savedTransactions.first {
            transaction = saved
        }
        copy.base.transaction = transaction
        
        // inlined
        return withAnimatedFrame(for: copy) { animatedFrame in
            return animatedFrame.animatedCGSize()
        }
    }
    
    private mutating func withAnimatedFrame<T>(for inputs: _ViewInputs, body: (inout CachedEnvironment.AnimatedFrame) -> T) -> T {
        let pixelLength = attribute(id: .pixelLength) { environment in
            return environment.pixelLength
        }
        
        var animatedFrame: CachedEnvironment.AnimatedFrame
//        if let _animatedFrame = self.animatedFrame, _animatedFrame.transaction == inputs.base.transaction {
//            animatedFrame = _animatedFrame
//        } else {
            animatedFrame = CachedEnvironment.AnimatedFrame(inputs: inputs, pixelLength: pixelLength, environment: environment)
//        }
        let result = body(&animatedFrame)
        self.animatedFrame = animatedFrame
        return result
    }
}

extension CachedEnvironment {
    package struct ID: Equatable {
        static let layoutDirection = CachedEnvironment.ID(base: UniqueID())
        static let pixelLength = CachedEnvironment.ID(base: UniqueID())
        
        var base: UniqueID
    }
    
    struct PlatformCache {
        private var animatedDepth: AnimatedDepth? = nil
    }
}

extension CachedEnvironment {
    struct AnimatedFrame {
        fileprivate let position: Attribute<CGPoint>
        fileprivate let size: Attribute<ViewSize>
        private let pixelLength: Attribute<CGFloat>
        private let time: Attribute<Time>
        fileprivate let transaction: Attribute<Transaction>
        private let viewPhase: Attribute<_GraphInputs.Phase>
        private let animatedFrame: Attribute<ViewFrame>
        private var _animatedPosition: Attribute<CGPoint>?
        private var _animatedSize: Attribute<ViewSize>?
        private var _animatedCGSize: Attribute<CGSize>?
        
        fileprivate init(inputs: _ViewInputs, pixelLength: Attribute<CGFloat>, environment: Attribute<EnvironmentValues>) {
            /*
             x29 = sp + 0x1f0
             pixelLength = x20
             environment = x2
             */
            // sp + 0x140 (x29 - 0xb0)
            let copy = inputs
            let animatedFrame: Attribute<ViewFrame>
            if !copy.base.options.contains(.supportsVariableFrameDuration) {
                // <+120>
                let attribute = AnimatableFrameAttribute(
                    position: copy.position,
                    size: copy.size,
                    pixelLength: pixelLength,
                    environment: environment,
                    phase: copy.base.phase,
                    time: copy.base.time,
                    transaction: copy.base.transaction,
                    animationsDisabled: true
                )
                animatedFrame = Attribute(attribute)
            } else {
                // <+272>
                let attribute = AnimatableFrameAttributeVFD(
                    position: copy.position,
                    size: copy.size,
                    pixelLength: pixelLength,
                    environment: environment,
                    phase: copy.base.phase,
                    time: copy.base.time,
                    transaction: copy.base.transaction,
                    animationsDisabled: true
                )
                animatedFrame = Attribute(attribute)
            }
            
            // <+468>
            animatedFrame.flags = .unknown1
            self.animatedFrame = animatedFrame
            self.position = copy.position
            self.size = copy.size
            self.pixelLength = pixelLength
            self.time = copy.base.time
            self.transaction = copy.base.transaction
            self.viewPhase = copy.base.phase
            self._animatedPosition = nil
            self._animatedSize = nil
            self._animatedCGSize = nil
        }
        
        fileprivate init(inputs: _ViewInputs, position: Attribute<CGPoint>, size: Attribute<ViewSize>, pixelLength: Attribute<CGFloat>, animatedFrame: Attribute<ViewFrame>, enviromment: Attribute<EnvironmentValues>) {
            fatalError("TODO")
        }
        
        @inlinable
        func animatedPosition() -> Attribute<CGPoint> {
            if let _animatedPosition {
                return _animatedPosition
            } else {
                return animatedFrame[keyPath: \.origin]
            }
        }
        
        @inlinable
        func animatedSize() -> Attribute<ViewSize> {
            if let _animatedSize {
                return _animatedSize
            } else {
                return animatedFrame[keyPath: \.size]
            }
        }
        
        @inlinable
        func animatedCGSize() -> Attribute<CGSize> {
            if let _animatedCGSize {
                return _animatedCGSize
            } else {
                return animatedFrame[keyPath: \.size.value]
            }
        }
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
