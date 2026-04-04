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

struct AnimatableDepthAttribute : ObservedAttribute, StatefulRule, AsyncAttribute {
    @Attribute fileprivate private(set) var transform: ViewTransform // 0x0
    @Attribute fileprivate private(set) var pixelLength: CGFloat // 0x4
    @Attribute fileprivate private(set) var environment: EnvironmentValues // 0x8
    fileprivate private(set) var helper: AnimatableAttributeHelper<ViewDepth> // 0x10
    fileprivate private(set) var cachedDepth: ViewDepth // 0x40
    fileprivate let animationsDisabled: Bool // 0x50
    
    typealias Value = ViewDepth
    
    mutating func updateValue() {
        // (head = x19, spaces = x21, depth = d8, d10), (w23)
        let (transform, tChanged) = self.$transform.changedValue(options: [])
        // (d9, w22)
        let (pixelLength, pChanged) = self.$pixelLength.changedValue(options: [])
        
        var sp0x10: CGFloat
        var sp0x18: CGFloat
        var sp0x20: Bool
        if tChanged {
            // <+140>
            sp0x10 = transform.depth.value
            sp0x18 = transform.depth._proposal
            
            if transform.depth == self.cachedDepth {
                self.cachedDepth = transform.depth
                // <+168>
                sp0x20 = pChanged
                // <+184>
            } else {
                self.cachedDepth = transform.depth
                // <+176>
                sp0x20 = true
                // <+184>
            }
        } else {
            // <+132>
            sp0x18 = transform.depth._proposal
            // <+168>
            sp0x20 = pChanged
            // <+184>
        }
        
        // <+184>
        var d0: CGFloat = 1
        if pixelLength == d0 {
            d0 = round(transform.depth.value)
        } else {
            d0 = transform.depth.value / pixelLength
            d0 = round(d0)
            d0 = pixelLength * d0
        }
        
        // <+216>
        sp0x10 = d0
        
        if !animationsDisabled {
            // sp + 0x10
            var value = (
                value: ViewDepth(sp0x10, proposal: sp0x18),
                changed: sp0x20
            )
            
            helper.update(value: &value, defaultAnimation: nil, environment: $environment)
            
            sp0x10 = value.value.value
            sp0x18 = value.value._proposal
            sp0x20 = value.changed
        }
        
        // <+248>
        if !sp0x20 && hasValue {
            // <+256>
        } else {
            // <+340>
            self.value = ViewDepth(sp0x10, proposal: sp0x18)
        }
    }
    
    mutating func destroy() {
        self.helper.removeListeners()
    }
}
