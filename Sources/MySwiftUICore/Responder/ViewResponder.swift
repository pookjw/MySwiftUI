package import Spatial
package import CoreGraphics

@_spi(Internal) open class ViewResponder: ResponderNode {
    package private(set) weak var host: (any ViewGraphDelegate)?
    private var serverResponderID: UInt32?
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
        fatalError("TODO")
    }
    
    package final func hitTest(globalPoint: Point3D, radius: CGFloat, options: ViewResponder.ContainsPointsOptions = .platformDefault, serverHitTest: ServerHitTest?) -> ViewResponder? {
        /*
         globalPoint -> d0, d1, d2 -> d11, d10, d9
         radius -> d3 -> d8
         options -> x0 -> x23
         serverHitTest -> x1 -> x21
         */
        // x29 - 0xd0
        let copy_1 = serverHitTest
        
        if let copy_1, let responderID = copy_1.responderID {
            // <+200>
            fatalError("TODO")
        } else {
            // <+296>
            fatalError("TODO")
        }
        
        fatalError("TODO")
    }
    
    final func lookupResponder(for renderID: UInt64, startingFrom: ViewResponder, searchParentChain: Bool) -> ViewResponder? {
        fatalError("TODO")
    }
}

extension ViewResponder {
    public struct ContainsPointsCache {
        var storage: (key: UInt32, value: ContainsPointsResult)?
    }
    
    package struct ContainsPointsOptions: OptionSet {
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
        
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension ViewResponder {
    public struct ContainsPointsResult {
        var mask: BitVector64
        var priority: Double
        var children: [ViewResponder]
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
