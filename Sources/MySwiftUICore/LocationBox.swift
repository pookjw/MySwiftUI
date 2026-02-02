package final class LocationBox<T: Location>: AnyLocation<T.Value>, @unchecked Sendable {
    package private(set) var location: T
    @AtomicBox private var cache = LocationProjectionCache()
    
    package init(location: T) {
        self.location = location
    }
    
    override var wasRead: Bool {
        get {
            return location.wasRead
        }
        set {
            location.wasRead = newValue
        }
    }
    
    override func get() -> T.Value {
        return location.get()
    }
    
    override func set(_ newValue: T.Value, transaction: Transaction) {
        location.set(newValue, transaction: transaction)
    }
    
    override func projecting<P>(_ projection: P) -> AnyLocation<P.Projected> where T.Value == P.Base, P : Projection {
        fatalError("TODO")
    }
    
    override func update() -> (T.Value, Bool) {
        return location.update()
    }
    
    override func isEqual(to other: AnyLocation<T.Value>) -> Bool {
        // other -> x24
        guard isLinkedOnOrAfter(.v5) else {
            return other === self
        }
        
        // <+240>
        guard let casted = other as? Self else {
            return false
        }
        
        // <+256>
        return location == casted.location
    }
}

struct LocationProjectionCache {
    private var cache: [AnyHashable2: WeakBox<AnyLocationBase>]
    
    init() {
        cache = [:]
    }
    
    func reference<T: Projection, U: Location>(for: T, on: U) -> AnyLocation<T.Projected> where T.Base == U.Value {
        fatalError("TODO")
    }
    
    mutating func reset() {
        cache = [:]
    }
}
