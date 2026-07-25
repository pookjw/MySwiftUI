enum ImplicitAnimationStack {
    static func withModifier<T>(_ modifier: any EntityChangeModifier, operation: () throws -> T) rethrows -> T {
        return try ImplicitAnimationStack.$current.withValue(modifier) { 
            try operation()
        }
    }
    
    @TaskLocal static var current: (any EntityChangeModifier)?
}

protocol EntityChangeModifier : Sendable {
    func setComponent<T : _ImplicitlyAnimatableBuiltinComponent>(entity: MyRealityFoundation.Entity, component: T, from: ComponentAnimatableData<T>, to: ComponentAnimatableData<T>)
}

struct ComponentAnimatableData<T> {
    private var propertyMapping: [AnyKeyPath : _Proto_AnyAnimatableProperty_v1<T>]
    
    init(propertyMapping: [AnyKeyPath : _Proto_AnyAnimatableProperty_v1<T>]) {
        self.propertyMapping = propertyMapping
    }
    
    func hasValues() -> Bool {
        return !self.propertyMapping.isEmpty
    }
    
    func debugPrintProperties() {
        assertUnimplemented()
    }
    
    func assignProperties(toComponent: inout T) {
        assertUnimplemented()
    }
}

struct _Proto_AnyAnimatableProperty_v1<T> {
    private var storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage
    
    init() {
        self.storage = _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage()
    }
    
    init<U : RealityKitVectorArithmetic & Equatable>(_ value: U, _ keyPath: WritableKeyPath<T, U>) {
        self.storage = _Proto_AnyAnimatableProperty_v1<T>.PropertyStorage<U>(value, keyPath)
    }
}

extension _Proto_AnyAnimatableProperty_v1 {
    class TypeErasedStorage {
        init() {}
        
        func debugPrintValue() {
            assertUnimplemented()
        }
        
        func assignProperty(toComponent: inout T) {
            assertUnimplemented()
        }
        
        func processAddAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        func processSubtractAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        func processAdd(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processSubtract(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processScale(_ scale: Double) {
            assertUnimplemented()
        }
        
        func processScaled(_ scale: Double) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processMagnitudeSquared() -> Double {
            assertUnimplemented()
        }
        
        func processEqual(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> Bool {
            assertUnimplemented()
        }
    }
    
    final class PropertyStorage<U : RealityKitVectorArithmetic & Equatable> : _Proto_AnyAnimatableProperty_v1.TypeErasedStorage {
        private var value: U
        private let keyPath: WritableKeyPath<T, U>
        
        init(_ value: U, _ keyPath: WritableKeyPath<T, U>) {
            self.value = value
            self.keyPath = keyPath
        }
        
        override func debugPrintValue() {
            assertUnimplemented()
        }
        
        override func assignProperty(toComponent: inout T) {
            assertUnimplemented()
        }
        
        override func processAddAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        override func processSubtractAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        override func processAdd(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        override func processSubtract(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        override func processScale(_ scale: Double) {
            assertUnimplemented()
        }
        
        override func processMagnitudeSquared() -> Double {
            assertUnimplemented()
        }
        
        override func processEqual(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> Bool {
            assertUnimplemented()
        }
    }
}

protocol RealityKitVectorArithmetic {
    mutating func scale(by scale: Double)
    var magnitudeSquared: Double { get }
}
