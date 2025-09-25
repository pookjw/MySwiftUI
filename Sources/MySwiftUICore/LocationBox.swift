#warning("TODO")

package class LocationBox<T: Location>: AnyLocation<T.Value>, @unchecked Sendable {
    package private(set) var location: any Location
//    @AtomicBox private var cache: LocationProjectionCache
    
    package init(location: any Location) {
        fatalError("TODO")
    }
}
