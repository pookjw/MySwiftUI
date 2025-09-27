internal import Swift

extension Unmanaged {
    @_transparent
    static func == (lhs: Unmanaged<Instance>, rhs: Unmanaged<Instance>) -> Bool {
        return lhs.toOpaque() == rhs.toOpaque()
    }
    
    @_transparent
    static func != (lhs: Unmanaged<Instance>, rhs: Unmanaged<Instance>) -> Bool {
        return lhs.toOpaque() != rhs.toOpaque()
    }
    
    @_transparent
    func map<T: AnyObject>(_ transform: ((Instance) -> T)) -> Unmanaged<T> {
        return _withUnsafeGuaranteedRef { .passUnretained(transform($0)) }
    }
    
    @_transparent
    func map<T: AnyObject>(_ transform: ((Instance) -> T?)) -> Unmanaged<T>? {
        let value = _withUnsafeGuaranteedRef(transform)
        return _withUnsafeGuaranteedRef { instance in
            guard let value = transform(instance) else {
                return nil
            }
            
            return .passUnretained(value)
        }
    }
}
