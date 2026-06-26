public import Combine

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen @propertyWrapper @preconcurrency @MainActor public struct StateObject<ObjectType> : DynamicProperty where ObjectType : Combine::ObservableObject {
    @usableFromInline
    @preconcurrency @MainActor @frozen internal enum Storage {
        case initially(() -> ObjectType)
        case object(ObservedObject<ObjectType>)
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal var storage: StateObject<ObjectType>.Storage
    
    @inlinable nonisolated public init(wrappedValue thunk: @autoclosure @escaping () -> ObjectType) {
        storage = .initially(thunk)
    }
    
    @MainActor @preconcurrency public var wrappedValue: ObjectType {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var projectedValue: ObservedObject<ObjectType>.Wrapper {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension StateObject {
    nonisolated public static var _propertyBehaviors: UInt32 {
        return 2
    }
}

extension StateObject : Sendable {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension StateObject.Storage : Sendable {}
