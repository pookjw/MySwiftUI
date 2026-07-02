// 1BEC77534769ADF54BD6111359D32D97
public import Combine
private import AttributeGraph

@frozen @propertyWrapper @preconcurrency @MainActor public struct EnvironmentObject<ObjectType> : DynamicProperty where ObjectType : Combine::ObservableObject {
    @dynamicMemberLookup @frozen @preconcurrency @MainActor public struct Wrapper {
        @MainActor @preconcurrency internal let root: ObjectType
        
        @MainActor @preconcurrency public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            return Binding(
                self.root,
                keyPath: keyPath,
                isolation: nil
            )
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
        if let store = unsafe _store {
            return EnvironmentObject<ObjectType>.Wrapper(root: store)
        } else {
            error()
        }
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal func error() -> Never {
        preconditionFailure("No ObservableObject of type \(_typeName(ObjectType.self, qualified: false)) found. A View.environmentObject(_:) for \(_typeName(ObjectType.self, qualified: false)) may be missing as an ancestor of this view.")
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
            environment: inputs.environment,
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
    
    mutating func update(property: inout EnvironmentObject<ObjectType>, phase: _GraphInputs.Phase) -> Bool {
        /*
         self -> x20 -> x19
         property -> x0 -> x29 - 0x98
         */
        // <+136>
        // x29 - 0x68 / x29 - 0x58
        var (environment, envChanged) = self.$environment.changedValue(options: [])
        // x22
        let oldStore = self.oldStore
        // x25
        let value: ObjectType?
        
        // true -> <+436> / false -> <+804>
        if let oldStore, !envChanged {
            // <+196>
            unsafe property._store = oldStore
            value = oldStore
            // <+436>
        } else {
            // <+260>
            let keyPath: KeyPath<EnvironmentValues, ObjectType?> = \EnvironmentValues.[EnvironmentObjectKey<ObjectType>()]
            // x25
            value = environment[keyPath: keyPath]
            unsafe property._store = value
            
            if oldStore === value {
                envChanged = false
            }
            
            // <+424>
            if value == nil {
                // <+804>
            } else {
                // <+436>
            }
        }
        
        if let value {
            // <+436>
            let w27: Bool
            if isLinkedOnOrAfter(.v6) {
                w27 = false
            } else {
                w27 = !ObjectType.hasDefaultPublisher
            }
            
            // <+584>
            let isUninitialized = self.lifetime.isUninitialized
            if
                let oldStore,
                !isUninitialized,
                oldStore === value,
                !w27
            {
                // <+612>
                // <+804>
            } else {
                // <+628>
                // x28 (x29 - 0xd8)
                self.lifetime.subscribe(subscriber: self.subscriber, to: value.objectWillChange)
                // <+804>
            }
        }
        
        // <+804>
        var w23: Bool
        if let (_, changed) = self.signal.changedValue(options: []) {
            // <+832>
            if changed || envChanged {
                // <+896>
                self.seed &+= 1
                w23 = changed || envChanged
                // <+908>
            } else {
                w23 = false
                // <+908>
            }
        } else {
            // <+868>
            w23 = false
            
            if envChanged {
                self.seed &+= 1
                w23 = true
            }
            // <+908>
        }
        
        // <+908>
        property._seed = self.seed
        self.oldStore = value
        return w23
    }
}
