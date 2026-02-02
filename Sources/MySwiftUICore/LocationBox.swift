
package final class LocationBox<T: Location>: AnyLocation<T.Value>, @unchecked Sendable {
    package private(set) var location: T
    @AtomicBox private var cache = LocationProjectionCache()
    
    package init(location: T) {
        self.location = location
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
