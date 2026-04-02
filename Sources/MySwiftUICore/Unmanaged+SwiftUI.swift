internal import Swift

extension Unmanaged {
    @_transparent
    static func == (lhs: Unmanaged<Instance>, rhs: Unmanaged<Instance>) -> Bool {
        return unsafe lhs.toOpaque() == rhs.toOpaque()
    }
    
    @_transparent
    static func != (lhs: Unmanaged<Instance>, rhs: Unmanaged<Instance>) -> Bool {
        return unsafe lhs.toOpaque() != rhs.toOpaque()
    }
    
    @_transparent
    func map<T: AnyObject>(_ transform: ((Instance) -> T)) -> Unmanaged<T> {
        return unsafe _withUnsafeGuaranteedRef { unsafe .passUnretained(transform($0)) }
    }
    
    @_transparent
    func map<T: AnyObject>(_ transform: ((Instance) -> T?)) -> Unmanaged<T>? {
        _ = unsafe _withUnsafeGuaranteedRef(transform)
        return unsafe _withUnsafeGuaranteedRef { instance in
            guard let value = transform(instance) else {
                return nil
            }
            
            return unsafe .passUnretained(value)
        }
    }
}
