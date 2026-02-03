public import Observation
public import Combine

extension View {
    public nonisolated func environment<T>(_ object: T?) -> some View where T : AnyObject, T : Observable {
        let key = EnvironmentObjectKey<T>()
        return environment(\EnvironmentValues[key], object)
    }
    
    @inlinable public nonisolated func environmentObject<T>(_ object: T) -> some View where T : ObservableObject {
//        environment(T.environmentStore, object)
        fatalError("TODO")
    }
}

struct EnvironmentObjectKey<Value: AnyObject>: EnvironmentKey, Hashable {
    init() {}
    
    static var defaultValue: Value? {
        return nil
    }
    
    static func == (lhs: EnvironmentObjectKey<Value>, rhs: EnvironmentObjectKey<Value>) -> Bool {
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(Value.self))
    }
}

extension EnvironmentValues {
    subscript<T: AnyObject>(objectType: T.Type) -> T? {
        get {
            return self[EnvironmentObjectKey<T>.self]
        }
        set {
            self[EnvironmentObjectKey<T>.self] = newValue
        }
    }
    
    subscript<T: AnyObject>(_ key: EnvironmentObjectKey<T>) -> T? {
        get {
            return self[T.self]
        }
        set {
            self[forceUnwrapping: key] = newValue.unsafelyUnwrapped
        }
    }
    
    subscript<T: AnyObject>(forceUnwrapping key: EnvironmentObjectKey<T>) -> T {
        get {
            guard let value = self[T.self] else {
                fatalError("No Observable object of type \(T.self) found. A View.environmentObject(_:) for Model may be missing as an ancestor of this view.")
            }
            
            return value
        }
        set {
            self[T.self] = newValue
        }
    }
}
