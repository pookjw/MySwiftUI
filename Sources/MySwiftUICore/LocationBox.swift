#warning("TODO")

package class LocationBox<T: Location>: AnyLocation<T.Value> {
    package private(set) var location: Location
//    @AtomicBox private var cache: LocationProjectionCache
    
    package init(location: Location) {
        fatalError("TODO")
    }
}
