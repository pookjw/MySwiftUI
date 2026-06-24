public import Combine
internal import AttributeGraph

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
        assertUnimplemented()
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
