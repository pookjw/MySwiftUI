public import Spatial

@_spi(Internal) open class MultiViewResponder : ViewResponder {
    private var _children: [ViewResponder] = []
    package override var children: [ViewResponder] {
        get {
            return _children
        }
        set {
            _children = newValue
        }
        _modify {
            yield &_children
        }
    }
    
    var cache = ViewResponder.ContainsPointsCache()
    var observers = ContentPathObservers()
    
    @inline(__always)
    package override init() {
        super.init()
    }
    
    open override func bindEvent(_ type: any EventType) {
        assertUnimplemented()
    }
    
    open override func visit(applying: (ResponderNode) -> ResponderVisitorResult) -> ResponderVisitorResult {
        let result = applying(self)
        guard result != .next else {
            return result
        }
        
        for child in children {
            let result = child.visit(applying: applying)
            guard result != .cancel else {
                return result
            }
        }
        
        return .next
    }
    
    open override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        if (self.serverResponderID != nil) && !options.contains(.crossingServerIDBoundary) {
            return .exclude
        }
        
        if HitTestPassThroughFeature.isEnabled {
            return .passthrough
        } else {
            return .include
        }
    }
    
    open override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        /*
         self -> x20 -> x21
         points -> x0 -> x22
         cackeKey -> x1 -> x24
         options -> x2 -> x27 -> sp + 0x18
         return pointer -> x8 -> x19
         */
        let policy = self.hitTestPolicy(options: options)
        
        guard policy != .exclude else {
            return ViewResponder.ContainsPointsResult(mask: BitVector64(), priority: 0, children: self.children)
        }
        
        return cache.fetch(key: cacheKey) { 
            let children = self.children
            var mask = BitVector64()
            var priority: Double = 0
            
            for child in children {
                let policy = child.hitTestPolicy(options: options)
                
                guard policy != .exclude else {
                    continue
                }
                
                let result = child.containsGlobalPoints(points, cacheKey: cacheKey, options: options)
                mask = result.mask.union(mask)
                priority = (priority <= result.priority) ? result.priority : priority
            }
            
            return ContainsPointsResult(
                mask: mask,
                priority: priority,
                children: self.children
            )
        }
    }
}
