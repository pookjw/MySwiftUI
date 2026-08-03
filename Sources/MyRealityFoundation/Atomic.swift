// DD9CB198B4BF4BF152CFBC3844124A4A
private import os.lock

@propertyWrapper
struct Atomic<T> : Sendable {
    private var lock: OSAllocatedUnfairLock<T>
    
    var wrappedValue: T {
        get {
            return self.load()
        }
        nonmutating set {
            self.store(newValue)
        }
    }
    
    init(wrappedValue: T) {
        self.lock = OSAllocatedUnfairLock(uncheckedState: wrappedValue)
    }
    
    fileprivate func load() -> T {
        return self.lock.withLockUnchecked { value in
            return value
        }
    }
    
    fileprivate func store(_ newValue: T) {
        self.lock.withLockUnchecked { value in
            value = newValue
        }
    }
}
