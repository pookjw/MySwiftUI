private import Darwin.os

@propertyWrapper
package struct AtomicBox<T> {
    private let buffer: AtomicBuffer<T>
    
    @inlinable
    package var wrappedValue: T {
        get {
            buffer.withUnsafeMutablePointers { pointer, lock in
                let value: T
                os_unfair_lock_lock(lock)
                value = pointer.pointee
                os_unfair_lock_unlock(lock)
                return value
            }
        }
        nonmutating set {
            buffer.withUnsafeMutablePointers { pointer, lock in
                os_unfair_lock_lock(lock)
                pointer.pointee = newValue
                os_unfair_lock_unlock(lock)
            }
        }
        nonmutating _modify {
            let (pointer, lock) = buffer.withUnsafeMutablePointers { ($0, $1) }
            os_unfair_lock_lock(lock)
            defer {
                os_unfair_lock_unlock(lock)
            }
            yield unsafe &pointer.pointee
        }
    }
    
    @inlinable
    package init(wrappedValue: T) {
        buffer = .allocate(value: wrappedValue)
    }
    
    @inlinable
    package func access<S>(_ handler: (_ value: inout T) throws -> S) rethrows -> S {
        try buffer.withUnsafeMutablePointers { pointer, lock in
            let result: Result<S, any Error>
            os_unfair_lock_lock(lock)
            do {
                result = try .success(handler(&pointer.pointee))
            } catch {
                result = .failure(error)
            }
            os_unfair_lock_unlock(lock)
            
            return try result.get()
        }
    }
}

extension AtomicBox {
    fileprivate class AtomicBuffer<S>: ManagedBuffer<S, os_unfair_lock_s> {
        @inlinable
        static func allocate<U>(value: U) -> AtomicBuffer<U> {
            let buffer = ManagedBuffer<U, os_unfair_lock_s>.create(minimumCapacity: 1) { buffer in
                buffer.withUnsafeMutablePointerToElements { pointer in
                    pointer.initialize(to: os_unfair_lock_s())
                }
                return value
            }
            
            return _unsafeReferenceCast(buffer, to: AtomicBuffer<U>.self)
        }
    }
}

extension AtomicBox where T: ExpressibleByNilLiteral {
    @inlinable
    package init() {
        self.init(wrappedValue: nil)
    }
}

extension AtomicBox: Equatable where T: Equatable {
    @inlinable
    package static func ==(lhs: AtomicBox<T>, rhs: AtomicBox<T>) -> Bool {
        return lhs.wrappedValue == rhs.wrappedValue
    }
} 

extension AtomicBox: Hashable where T: Hashable {
    @inlinable
    package func hash(into hasher: inout Hasher) {
        wrappedValue.hash(into: &hasher)
    }
}
