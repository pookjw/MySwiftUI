// C212C242BFEB175E53A59438AB276A7C
public import Combine
internal import AttributeGraph
private import _DarwinFoundation3.pthread
private import os.log

@propertyWrapper @preconcurrency @MainActor @frozen public struct ObservedObject<ObjectType> : DynamicProperty where ObjectType : ObservableObject {
    @dynamicMemberLookup @preconcurrency @MainActor @frozen public struct Wrapper {
        @MainActor @preconcurrency internal let root: ObjectType
        @MainActor @preconcurrency public subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<ObjectType, Subject>) -> Binding<Subject> {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal var _seed: Int = 0
    
    @_alwaysEmitIntoClient @MainActor @preconcurrency public init(initialValue: ObjectType) {
        self.init(wrappedValue: initialValue)
    }
    
    @MainActor @preconcurrency public init(wrappedValue: ObjectType) {
        self.wrappedValue = wrappedValue
    }
    
    @MainActor @preconcurrency public var wrappedValue: ObjectType
    
    @MainActor @preconcurrency public var projectedValue: ObservedObject<ObjectType>.Wrapper {
        assertUnimplemented()
    }
    
    nonisolated static func makeBoxAndSignal<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int) -> Attribute<Void> {
        let attribute = Attribute(value: ())
        let box = ObservedObjectPropertyBox<ObjectType>(
            host: .currentHost,
            invalidation: WeakAttribute(attribute)
        )
        
        buffer.append(box, fieldOffset: fieldOffset)
        return attribute
    }
}

extension ObservedObject {
    nonisolated public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        let attribute = makeBoxAndSignal(in: &buffer, container: container, fieldOffset: fieldOffset)
        
        if Subgraph.shouldRecordTree {
            addTreeValueSlow(attribute.identifier, as: ObjectType.self, in: V.self, fieldOffset: fieldOffset, flags: .stateSignal)
        }
    }
}

extension ObservedObject {
    nonisolated public static var _propertyBehaviors: UInt32 {
        return 2
    }
}

fileprivate struct ObservedObjectPropertyBox<ObjectType : ObservableObject> : DynamicPropertyBox {
    private let subscriber: AttributeInvalidatingSubscriber<ObservableObjectPublisher> // 0x0
    private let lifetime = SubscriptionLifetime<ObservableObjectPublisher>() // 0x8
    private var seed: Int = 0 // 0x10
    private var lastObject: ObjectType? = nil // 0x18
    
    init(host: GraphHost, invalidation: WeakAttribute<Void>) {
        self.subscriber = AttributeInvalidatingSubscriber<ObservableObjectPublisher>(host: host, attribute: invalidation)
    }
    
    mutating func update(property: inout ObservedObject<ObjectType>, phase: _GraphInputs.Phase) -> Bool {
        if pthread_main_np() == 0 {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Updating ObservedObject<\(_typeName(ObjectType.self, qualified: false))> from background threads will cause undefined behavior; make sure to update it from the main thread.")
        }
        
        // <+296>
        MainActor.assumeIsolated { 
            // $s7SwiftUI25ObservedObjectPropertyBox33_C212C242BFEB175E53A59438AB276A7CLLV6update8property5phaseSbAA0cD0VyxGz_AA12_GraphInputsV5PhaseVtFyyScMYcXEfU_
            /*
             property -> x0 -> x19
             self -> x1 -> x22
             */
            assertUnimplemented()
        }
        
        let changed = self.subscriber.attribute.changedValue(options: [])?.changed ?? false
        
        var seed = self.seed
        if changed {
            seed &+= 1
            self.seed = seed
        }
        property._seed = seed
        
        return changed
    }
}
