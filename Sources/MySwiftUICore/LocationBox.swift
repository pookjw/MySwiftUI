#warning("TODO")

package final class LocationBox<T: Location>: AnyLocation<T.Value>, @unchecked Sendable {
    package private(set) var location: T
    @AtomicBox private var cache = LocationProjectionCache()
    
    package init(location: T) {
        self.location = location
    }
}

struct LocationProjectionCache {
    private var cache: [AnyHashable2: WeakBox<AnyLocationBase>] = [:]
}
