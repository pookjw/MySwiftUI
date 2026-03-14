package struct WeakBox<T: AnyObject> {
    package weak var base: T?
    
    package init(_ base: T?) {
        self.base = base
    }
}

extension WeakBox : Sendable where T : Sendable {}
