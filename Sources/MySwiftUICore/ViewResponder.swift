// D16C83991EAE21A87411739F6DC01498
public import Spatial
package import CoreGraphics
private import os.log

@_spi(Internal) open class ViewResponder: ResponderNode {
    static private(set) nonisolated(unsafe) var hitTestKey: UInt32 = 0
    
    static func nextHitTestKey() -> UInt32 {
        let next = unsafe Self.hitTestKey
        unsafe Self.hitTestKey = next &+ 1
        return next
    }
    
    package private(set) weak var host: (any ViewGraphDelegate)?
    private(set) final var serverResponderID: UInt32?
    package private(set) weak var parent: ViewResponder?
    
    @inline(__always)
    package override init() {
        self.host = nil
        self.serverResponderID = nil
        self.parent = nil
        self.host = ViewGraph.current.delegate
    }
    
    @inline(__always)
    package init(host: (any ViewGraphDelegate)?) {
        self.host = nil
        self.serverResponderID = nil
        self.parent = nil
        self.host = host
    }
    
    package var children: [ViewResponder] {
        return []
    }
    
    package var gestureContainer: AnyObject? {
        assertUnimplemented()
    }
    
    package final func hitTest(globalPoint: Point3D, radius: CGFloat, options: ViewResponder.ContainsPointsOptions = .platformDefault, serverHitTest: ServerHitTest?) -> ViewResponder? {
        /*
         globalPoint -> d0, d1, d2 -> d11, d10, d9
         radius -> d3 -> d8
         options -> x0 -> x23
         serverHitTest -> x1 -> x21
         */
        // x24
        let copy_1 = options
        
        if
            let copy_2 = serverHitTest, // x29 - 0xd0
            let responderID = copy_2.responderID,
            let _ = self.lookupResponder(for: responderID, startingFrom: self, searchParentChain: true)
        {
            // <+220>
            assertUnimplemented()
        }
        
        // <+296>
        if 
            let copy_3 = serverHitTest, // x29 - 0xd0
            let responderID = copy_3.responderID
        {
            Log.events.log(level: .default, "Hit testing with a server responder ID (\(responderID) but no responder found")
        }
        
        // <+544>
        if copy_1.contains(.uncached) {
            // <+632>
            assertUnimplemented()
        }
        
        // w23
        let next = Self.nextHitTestKey()
        
        if copy_1.contains(.disablePointCloudHitTesting) {
            // <+600>
            return self.singlePointHitTest(globalPoint: globalPoint, cacheKey: next, options: options)?.0
        }
        
        // <+644>
        assertUnimplemented()
    }
    
    final func lookupResponder(for renderID: UInt64, startingFrom: ViewResponder, searchParentChain: Bool) -> ViewResponder? {
        assertUnimplemented()
    }
    
    fileprivate final func singlePointHitTest(globalPoint: Point3D, cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> (ViewResponder, Double)? {
        /*
         cacheKey -> x0 -> x21
         options -> x1
         */
        // x26 -> sp + 0x38
        let copy_1 = options
        let policy = self.hitTestPolicy(options: copy_1)
        guard policy != .exclude else {
            return nil
        }
        
        let result = self.containsGlobalPoints([globalPoint], cacheKey: cacheKey, options: copy_1)
        
        guard result.mask[0] else {
            return nil
        }
        
        assertUnimplemented()
    }
    
    open func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        assertUnimplemented()
    }
    
    open func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        assertUnimplemented()
    }
}

extension ViewResponder {
    public struct ContainsPointsCache {
        /*
         key -> 0x0
         mask -> 0x8
         priority -> 0x10
         children -> 0x18 (0이면 nil)
         */
        private var storage: (key: UInt32?, value: ContainsPointsResult)?
        
        init() {
            storage = nil
        }
        
        mutating func fetch(key: UInt32?, _ make: () -> ViewResponder.ContainsPointsResult) -> ViewResponder.ContainsPointsResult {
            /*
             self -> x20 -> x21
             key -> x22
             return pointer -> x8 -> x19
             */
            if let storage, storage.key == key {
                return storage.value
            } else {
                let result = make()
                storage = (key, result)
                return result
            }
        }
    }
    
    public struct ContainsPointsOptions: OptionSet {
        static var platformDefault: ViewResponder.ContainsPointsOptions {
            return [useZDistanceAsPriority, .disablePointCloudHitTesting]
        }
        
        static var allowDisabledViews: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 0)
        }
        
        static var useZDistanceAsPriority: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 1)
        }
        
        static var disablePointCloudHitTesting: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 2)
        }
        
        static var allow3DResponders: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 3)
        }
        
        static var crossingServerIDBoundary: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 4)
        }
        
        static var uncached: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 5)
        }
        
        static var includeHoverResponders: ViewResponder.ContainsPointsOptions {
            return ViewResponder.ContainsPointsOptions(rawValue: 1 << 6)
        }
        
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    public enum HitTestPolicy: Hashable {
        case include
        case exclude
        case passthrough
    }
}

extension ViewResponder {
    public struct ContainsPointsResult {
        var mask: BitVector64
        var priority: Double
        var children: [ViewResponder]
        
        public init(mask: BitVector64, priority: Double, children: [ViewResponder]) {
            self.mask = mask
            self.priority = priority
            self.children = children
        }
    }
}

package struct ViewRespondersKey: PreferenceKey {
    package static var defaultValue: [ViewResponder] {
        return []
    }
    
    package static func reduce(value: inout [ViewResponder], nextValue: () -> [ViewResponder]) {
        return value.append(contentsOf: nextValue())
    }
}
