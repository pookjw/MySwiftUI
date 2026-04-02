public import Spatial
public import CoreGraphics

@_spi(Internal) open class PlatformViewResponderBase<T : AnyObject, U : ContentResponder>: ViewResponder {
    package final weak var hostView: T? = nil // 0x30
    package final weak var representedView: T? = nil // 0x38
    package final var helper = ContentResponderHelper<U>()
    final var lastResult: PlatformViewResponderBase<T, U>.PlatformHitTestResult? = nil
    package final weak var preferredFocusableView: T? = nil
    
    open var platformViewIsEnabled: Bool {
        assertUnimplemented()
    }
    
    public override init() {
        super.init()
    }
    
    override init(host: ViewGraphDelegate?) {
        assertUnimplemented()
    }
    
    open override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        if platformViewIsEnabled || options.contains(.allowDisabledViews) {
            if options.contains(.crossingServerIDBoundary) {
                return (serverResponderID != nil) ? .include : .exclude
            } else {
                return .include
            }
        } else {
            return .exclude
        }
    }
    
    open override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        /*
         self -> x20 -> x19
         points -> x0 -> x24
         cacheKey -> x1 -> x23
         return pointer -> x8 -> x21
         */
        guard UnifiedHitTestingFeature.isEnabled else {
            return ViewResponder.ContainsPointsResult(mask: BitVector64(), priority: 0, children: [])
        }
        
        let policy = self.hitTestPolicy(options: options)
        
        // x21
        let result = ViewResponder.ContainsPointsResult(mask: BitVector64(), priority: 0, children: [])
        
        guard policy != .exclude else {
            return result
        }
        
        let point = points[0]
        // x26
        let hitView: T?
        if
            let lastResult = self.lastResult, // sp + 0x60 -> sp + 0xc0
            let cacheKey,
            lastResult.key == cacheKey
        {
            // <+500>
            hitView = lastResult.hitView
            // <+608>
        } else {
            // <+572>
            hitView = self.platformViewHitTest(globalPoint: point, cacheKey: cacheKey)
        }
        
        // <+608>
        guard hitView != nil else {
            // <+884>
            if let cacheKey {
                self.lastResult = PlatformViewResponderBase<T, U>.PlatformHitTestResult(key: cacheKey, globalPoint: point, hitView: hitView)
            }
            
            return result
        }
        
        assertUnimplemented()
    }
    
    open func platformViewHitTest(globalPoint: CGPoint, cacheKey: UInt32?) -> T? {
        assertUnimplemented()
    }
    
    open func platformViewHitTest(globalPoint: Point3D, cacheKey: UInt32?) -> T? {
        assertUnimplemented()
    }
    
    // TODO
}

extension PlatformViewResponderBase {
    struct PlatformHitTestResult {
        var key: UInt32
        var globalPoint: Point3D
        weak var hitView: T?
    }
}
