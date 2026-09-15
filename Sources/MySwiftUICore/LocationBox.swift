// 3C10A6E9BB0D4644A364890A9BD57D68

package final class LocationBox<T : Location> : AnyLocation<T.Value> {
    package private(set) var location: T
    @AtomicBox private var cache = LocationProjectionCache()
    
    package init(location: T) {
        self.location = location
    }
    
    package override var wasRead: Bool {
        get {
            return location.wasRead
        }
        set {
            location.wasRead = newValue
        }
    }
    
    package override func get() -> T.Value {
        return location.get()
    }
    
    package override func set(_ newValue: T.Value, transaction: Transaction) {
        location.set(newValue, transaction: transaction)
    }
    
    override func projecting<P>(_ projection: P) -> AnyLocation<P.Projected> where T.Value == P.Base, P : Projection {
        return self.$cache.access { cache in
            return cache.reference(for: projection, on: self)
        }
    }
    
    package override func update() -> (T.Value, Bool) {
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

extension LocationBox : Location {}
extension LocationBox : @unchecked Sendable {}

struct LocationProjectionCache {
    private var cache: [AnyHashable2: WeakBox<AnyLocationBase>]
    
    mutating func reference<T : Projection, U : Location>(for projection: T, on location: U) -> AnyLocation<T.Projected> where T.Base == U.Value {
        /*
         projection -> x0 -> x27
         location -> x1 -> x29 - 0xb8
         */
        // <+256>
        let hashable = AnyHashable2(projection)
        
        if
            let existing = self.cache[hashable],
            let base = existing.base,
            let casted = base as? AnyLocation<T.Projected>
        {
            return casted
        }
        
        // <+472>
        let box = LocationBox(
            location: ProjectedLocation(
                location: location,
                projection: projection
            )
        )
        
        self.cache[hashable] = WeakBox(box)
        return box
    }
    
    mutating func reset() {
        cache = [:]
    }
    
    init() {
        cache = [:]
    }
}

fileprivate struct ProjectedLocation<T : Location, U : Projection> : Equatable, Location {
    private(set) var location: T
    private(set) var projection: U
    
    var wasRead: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    func get() -> U.Projected {
        assertUnimplemented()
    }
    
    func set(_ newValue: U.Projected, transaction: Transaction) {
        assertUnimplemented()
    }
    
    func update() -> (U.Projected, Bool) {
        assertUnimplemented()
    }
}
