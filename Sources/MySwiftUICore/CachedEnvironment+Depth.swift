// 7214E2C550579269A419DBAA85AE8A10
internal import AttributeGraph
private import CoreGraphics

extension CachedEnvironment {
    mutating func animatedDepth(for inputs: _ViewInputs) -> Attribute<ViewDepth> {
        if !inputs.base.options.contains(.viewNeedsGeometry) {
            // <+72>
            let transform = inputs.transform
            return transform[keyPath: \.depth]
        } else {
            // <+112>
            var transaction = inputs.base.transaction
            if let _transaction = inputs.savedTransactions.first {
                transaction = _transaction
            }
            
            let pixelLength: Attribute<CGFloat> = self.attribute(id: .pixelLength) { environment in
                // $s7SwiftUI17CachedEnvironmentV17withAnimatedFrame33_B62A4B04AF9F1325924A089D63071424LL3for4bodyxAA11_ViewInputsV_xAC0fG0VzXEtlF12CoreGraphics7CGFloatVAA0D6ValuesVcfU_
                assertUnimplemented()
            }
            
            if
                let cache = self.platformCache.animatedDepth,
                cache.transform == inputs.transform,
                cache.pixelLength == pixelLength,
                cache.time == inputs.time,
                cache.transaction == transaction,
                cache.viewPhase == inputs.viewPhase
            {
                return cache.animatedDepth
            }
            
            let depth = AnimatedDepth(inputs: inputs, pixelLength: pixelLength, environment: self.environment)
            self.platformCache = CachedEnvironment.PlatformCache(animatedDepth: depth)
            return depth!.animatedDepth
        }
    }
}

fileprivate struct AnimatedDepth {
    let transform: Attribute<ViewTransform>
    let pixelLength: Attribute<CGFloat>
    let time: Attribute<Time>
    let transaction: Attribute<Transaction>
    let viewPhase: Attribute<_GraphInputs.Phase>
    let animatedDepth: Attribute<ViewDepth>
    
    init?(inputs: _ViewInputs, pixelLength: Attribute<CGFloat>, environment: Attribute<EnvironmentValues>) {
        // sp + 0x60
        let transform = inputs.transform
        let viewPhase = inputs.viewPhase
        let time = inputs.time
        let transaction = inputs.transaction
        let rule = AnimatableDepthAttribute(
            transform: transform,
            pixelLength: pixelLength,
            environment: environment,
            helper: AnimatableAttributeHelper<ViewDepth>(
                phase: viewPhase,
                time: time,
                transaction: transaction
            ),
            cachedDepth: .invalidValue,
            animationsDisabled: false
        )
        let animatedDepth = Attribute(rule)
        animatedDepth.flags = .unknown0
        
        self.transform = transform
        self.pixelLength = pixelLength
        self.time = time
        self.transaction = transaction
        self.viewPhase = viewPhase
        self.animatedDepth = animatedDepth
    }
}

extension CachedEnvironment {
    struct PlatformCache {
        fileprivate var animatedDepth: AnimatedDepth? = nil
    }
}

struct AnimatableDepthAttribute: ObservedAttribute, StatefulRule, AsyncAttribute {
    @Attribute fileprivate private(set) var transform: ViewTransform
    @Attribute fileprivate private(set) var pixelLength: CGFloat
    @Attribute fileprivate private(set) var environment: EnvironmentValues
    fileprivate private(set) var helper: AnimatableAttributeHelper<ViewDepth>
    fileprivate private(set) var cachedDepth: ViewDepth
    fileprivate let animationsDisabled: Bool
    
    typealias Value = ViewDepth
    
    func updateValue() {
        assertUnimplemented()
    }
    
    mutating func destroy() {
        assertUnimplemented()
    }
}
