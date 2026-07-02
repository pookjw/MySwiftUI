// 1BEC77534769ADF54BD6111359D32D97
public import Combine
private import AttributeGraph

@frozen @propertyWrapper @preconcurrency @MainActor public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : Combine::ObservableObject {
    @dynamicMemberLookup @frozen @preconcurrency @MainActor public struct Wrapper {
        @MainActor @preconcurrency internal let root: ObjectType
        
        @MainActor @preconcurrency public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            assertUnimplemented()
        }
    }
    
    @inlinable @MainActor @preconcurrency public var wrappedValue: ObjectType {
        get {
            guard let store = _store else { error() }
            return store
        }
    }
    
    @inlinable @MainActor @preconcurrency package var optionalWrappedValue: ObjectType? {
        get {
            _store
        }
    }
    
    @usableFromInline
    nonisolated(unsafe) package var _store: ObjectType?
    
    @usableFromInline
    @MainActor @preconcurrency internal var _seed: Int = 0
    
    @MainActor @preconcurrency public var projectedValue: EnvironmentObject<ObjectType>.Wrapper {
        assertUnimplemented()
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal func error() -> Never {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public init() {
        unsafe self._store = nil
    }
    
    nonisolated public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        // w24
        let attribute = Attribute(value: ())
        let host = GraphHost.currentHost
        
        let box = StoreBox<ObjectType>(
            host: host,
            environment: GraphHost.currentHost.data.$environment,
            signal: WeakAttribute(attribute)
        )
        
        buffer.append(box, fieldOffset: fieldOffset)
        
        if Subgraph.shouldRecordTree {
            addTreeValueSlow(attribute.identifier, as: ObjectType.self, in: V.self, fieldOffset: fieldOffset, flags: .environmentObjectSignal)
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EnvironmentObject {
    nonisolated public static var _propertyBehaviors: UInt32 {
        return 2
    }
}

extension EnvironmentObject : Sendable {}
extension EnvironmentObject.Wrapper : Sendable {}

fileprivate struct StoreBox<ObjectType : Combine::ObservableObject> : DynamicPropertyBox {
    @Attribute private(set) var environment: EnvironmentValues // 0x0
    let signal: WeakAttribute<Void> // 0x4
    let subscriber: AttributeInvalidatingSubscriber<ObjectType.ObjectWillChangePublisher> // 0x10
    let lifetime = SubscriptionLifetime<ObjectType.ObjectWillChangePublisher>() // 0x18
    private(set) var seed: Int // 0x20
    private(set) var oldStore: ObjectType? // 0x28
    
    init(host: GraphHost, environment: Attribute<EnvironmentValues>, signal: WeakAttribute<()>) {
        self._environment = environment
        self.signal = signal
        self.subscriber = AttributeInvalidatingSubscriber(host: host, attribute: signal)
        self.seed = 0
        self.oldStore = nil
    }
    
    mutating func reset() {
        self.oldStore = nil
    }
    
    func update(property: inout EnvironmentObject<ObjectType>, phase: _GraphInputs.Phase) -> Bool {
        assertUnimplemented()
    }
}
