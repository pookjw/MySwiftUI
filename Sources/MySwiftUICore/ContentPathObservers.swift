#warning("TODO")

struct ContentPathObservers {
    fileprivate var observers: [Observer]
    
    @inlinable
    init() {
        observers = []
    }
}

extension ContentPathObservers {
    fileprivate struct Observer {
        weak var value: (any ContentPathObserver)?
    }
}

protocol ContentPathObserver: AnyObject {}
