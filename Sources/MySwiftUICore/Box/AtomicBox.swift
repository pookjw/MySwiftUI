private import Darwin.os

@propertyWrapper
package struct AtomicBox<T> {
    private let buffer: AtomicBuffer<T>
    
    @inline(__always)
    package var wrappedValue: T {
        get {
            unsafe buffer.withUnsafeMutablePointers { pointer, lock in
                let value: T
                unsafe os_unfair_lock_lock(lock)
                value = unsafe pointer.pointee
                unsafe os_unfair_lock_unlock(lock)
                return value
            }
        }
        nonmutating set {
            unsafe buffer.withUnsafeMutablePointers { pointer, lock in
                unsafe os_unfair_lock_lock(lock)
                unsafe pointer.pointee = newValue
                unsafe os_unfair_lock_unlock(lock)
            }
        }
        nonmutating _modify {
            let (pointer, lock) = unsafe buffer.withUnsafeMutablePointers { unsafe ($0, $1) }
            unsafe os_unfair_lock_lock(lock)
            defer {
                unsafe os_unfair_lock_unlock(lock)
            }
            yield unsafe &pointer.pointee
        }
    }
    
    @inline(__always)
    package var projectedValue: AtomicBox<T> {
        return self
    }
    
    package init(wrappedValue: T) {
        buffer = .allocate(value: wrappedValue)
    }
    
    package func access<S>(_ handler: (_ value: inout T) throws -> S) rethrows -> S {
        try unsafe buffer.withUnsafeMutablePointers { pointer, lock in
            let result: Result<S, any Error>
            unsafe os_unfair_lock_lock(lock)
            do {
                result = try unsafe .success(handler(&pointer.pointee))
            } catch {
                result = .failure(error)
            }
            unsafe os_unfair_lock_unlock(lock)
            
            return try result.get()
        }
    }
}

extension AtomicBox {
    fileprivate class AtomicBuffer<S>: ManagedBuffer<S, os_unfair_lock_s> {
        @inlinable
        static func allocate<U>(value: U) -> AtomicBuffer<U> {
            let buffer = ManagedBuffer<U, os_unfair_lock_s>.create(minimumCapacity: 1) { buffer in
                unsafe buffer.withUnsafeMutablePointerToElements { pointer in
                    unsafe pointer.initialize(to: os_unfair_lock_s())
                }
                return value
            }
            
            return unsafe unsafeDowncast(buffer, to: AtomicBuffer<U>.self)
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

extension AtomicBox: @unchecked Sendable {}
