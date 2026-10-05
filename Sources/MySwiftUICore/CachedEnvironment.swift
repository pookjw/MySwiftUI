// B62A4B04AF9F1325924A089D63071424
package import AttributeGraph
private import CoreGraphics

package struct CachedEnvironment {
    var environment: Attribute<EnvironmentValues>
    private var mapItems: [MapItem] = []
    private var animatedFrame: AnimatedFrame?
    private var resolvedShapeStyles: [ResolvedShapeStyles: Attribute<_ShapeStyle_Pack>] = [:]
    var platformCache = CachedEnvironment.PlatformCache()
    
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
        
        guard copy_1.base.options.contains(.viewNeedsGeometry) else {
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
    
    mutating func resolvedShapeStyles(for inputs: _ViewInputs, role: ShapeRole, mode: Attribute<_ShapeStyle_ResolverMode>?) -> Attribute<_ShapeStyle_Pack> {
        /*
         self -> x20 -> x19
         inputs -> x0 -> x20
         role -> x1 -> w25
         mode -> x2 -> x22
         */
        if inputs.preferences.contains(DisplayList.Key.self) {
            // <+96>
            let key = ResolvedShapeStyles(
                environment: self.environment,
                time: inputs.time,
                transaction: inputs.transaction,
                viewPhase: inputs.viewPhase,
                mode: OptionalAttribute(mode),
                role: role,
                substrate: inputs.materialSubstrate,
                animationsDisabled: inputs.base.options.contains(.animationsDisabled)
            )
            
            if let existing = self.resolvedShapeStyles[key] {
                return existing
            }
            
            // <+376>
            let result = key.makeStyles()
            
            if mode == nil {
                self.resolvedShapeStyles[key] = result
            }
            
            return result
        } else {
            // <+308>
            return GraphHost.currentHost.intern(
                _ShapeStyle_Pack.defaultValue,
                for: _ShapeStyle_Pack.self,
                id: .defaultValue
            )
        }
    }
    
    fileprivate mutating func withAnimatedFrame<T>(for inputs: _ViewInputs, body: (inout CachedEnvironment.AnimatedFrame) -> T) -> T {
        let pixelLength = attribute(id: .pixelLength) { environment in
            return environment.pixelLength
        }
        
        var animatedFrame: CachedEnvironment.AnimatedFrame
        if
            let _animatedFrame = self.animatedFrame,
            _animatedFrame.position == inputs.position,
            _animatedFrame.size == inputs.size,
            _animatedFrame.pixelLength == pixelLength,
            _animatedFrame.time == inputs.time,
            _animatedFrame.transaction == inputs.base.transaction,
            _animatedFrame.viewPhase == inputs.viewPhase
        {
            animatedFrame = _animatedFrame
        } else {
            animatedFrame = CachedEnvironment.AnimatedFrame(inputs: inputs, pixelLength: pixelLength, environment: environment)
        }
        let result = body(&animatedFrame)
        self.animatedFrame = animatedFrame
        return result
    }
}

extension CachedEnvironment {
    package struct ID : Equatable {
        static let layoutDirection = CachedEnvironment.ID()
        static let pixelLength = CachedEnvironment.ID()
        
        var base: UniqueID
        
        package init() {
            self.base = UniqueID()
        }
    }
}

extension _GraphInputs {
    var pixelLength: Attribute<CGFloat> {
        return self.cachedEnvironment.value.attribute(id: .pixelLength) { environmentValues in
            // $s7SwiftUI17CachedEnvironmentV17withAnimatedFrame33_B62A4B04AF9F1325924A089D63071424LL3for4bodyxAA11_ViewInputsV_xAC0fG0VzXEtlF12CoreGraphics7CGFloatVAA0D6ValuesVcfU_
            return environmentValues.pixelLength
        }
    }
}

extension CachedEnvironment {
    struct AnimatedFrame {
        fileprivate let position: Attribute<CGPoint>
        fileprivate let size: Attribute<ViewSize>
        fileprivate let pixelLength: Attribute<CGFloat>
        fileprivate let time: Attribute<Time>
        fileprivate let transaction: Attribute<Transaction>
        fileprivate let viewPhase: Attribute<_GraphInputs.Phase>
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
            let animationsDisabled = copy.animationsDisabled
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
                    animationsDisabled: animationsDisabled
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
                    animationsDisabled: animationsDisabled
                )
                animatedFrame = Attribute(attribute)
            }
            
            // <+468>
            animatedFrame.flags = .unknown0
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
            assertUnimplemented()
        }
        
        @inlinable
        mutating func animatedPosition() -> Attribute<CGPoint> {
            if let _animatedPosition {
                return _animatedPosition
            } else {
                let result = animatedFrame[keyPath: \.origin]
                self._animatedPosition = result
                return result
            }
        }
        
        @inlinable
        mutating func animatedSize() -> Attribute<ViewSize> {
            if let _animatedSize {
                return _animatedSize
            } else {
                let result = animatedFrame[keyPath: \.size]
                self._animatedSize = result
                return result
            }
        }
        
        @inlinable
        mutating func animatedCGSize() -> Attribute<CGSize> {
            if let _animatedCGSize {
                return _animatedCGSize
            } else {
                let result = animatedFrame[keyPath: \.size.value]
                self._animatedCGSize = result
                return result
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

fileprivate struct ResolvedShapeStyles : Hashable {
    let environment: Attribute<EnvironmentValues>
    let time: Attribute<Time>
    let transaction: Attribute<Transaction>
    let viewPhase: Attribute<_GraphInputs.Phase>
    let mode: OptionalAttribute<_ShapeStyle_ResolverMode>
    let role: ShapeRole
    let substrate: Material.Substrate?
    let animationsDisabled: Bool
    
    func makeStyles() -> Attribute<_ShapeStyle_Pack> {
        let resolver = ShapeStyleResolver<AnyShapeStyle>(
            style: OptionalAttribute(),
            mode: self.mode,
            environment: self.environment,
            role: self.role,
            substrate: self.substrate,
            animationsDisabled: self.animationsDisabled,
            helper: AnimatableAttributeHelper<_ShapeStyle_Pack>(
                phase: self.viewPhase,
                time: self.time,
                transaction: self.transaction
            )
        )
        
        let attribute = Attribute(resolver)
        attribute.flags = [.unknown0]
        
        return attribute
    }
}
