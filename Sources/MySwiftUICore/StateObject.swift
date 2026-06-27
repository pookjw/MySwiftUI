// BDD24532CFCFEBA7264ABA5DE20A4002
public import Combine
private import AttributeGraph
private import _DarwinFoundation3.pthread
private import os.log

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
        return self.objectValue.wrappedValue
    }
    
    @MainActor @preconcurrency public var projectedValue: ObservedObject<ObjectType>.Wrapper {
        return self.objectValue.projectedValue
    }
    
    nonisolated public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        var other = _DynamicPropertyBuffer()
        let attribute = ObservedObject<ObjectType>.makeBoxAndSignal(
            in: &other,
            container: container,
            fieldOffset: 0
        )
        
        let box = StateObject<ObjectType>.Box(links: other, object: nil)
        buffer.append(box, fieldOffset: fieldOffset)
        
        if Subgraph.shouldRecordTree {
            addTreeValueSlow(attribute.identifier, as: ObjectType.self, in: V.self, fieldOffset: fieldOffset, flags: .stateObjectSignal)
        }
    }
    
    @MainActor @preconcurrency var objectValue: ObservedObject<ObjectType> {
        switch self.storage {
        case .initially(let block):
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Accessing StateObject<\(_typeName(ObjectType.self, qualified: false))>'s object without being installed on a View. This will create a new instance each time.")
            return ObservedObject<ObjectType>(wrappedValue: block())
        case .object(let object):
            return object
        }
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

extension StateObject {
    fileprivate struct Box : DynamicPropertyBox {
        private(set) var links: _DynamicPropertyBuffer // 0x0
        private(set) var object: ObservedObject<ObjectType>? // 0x10
        
        func destroy() {
            assertUnimplemented()
        }
        
        func reset() {
            assertUnimplemented()
        }
        
        mutating func update(property: inout StateObject<ObjectType>, phase: _GraphInputs.Phase) -> Bool {
            /*
             property -> x0 -> x19
             phase -> x1 -> w28
             ObjectType -> x2 -> x21
             */
            var object: ObservedObject<ObjectType>
            var updated = false
            if let _object = self.object {
                object = _object
                // <+532>
            } else {
                let _object: ObservedObject<ObjectType>?
                
                switch property.storage {
                case .initially(let block):
                    // <+112>
                    if pthread_main_np() == 0 {
                        unsafe os_log(.fault, log: .runtimeIssuesLog, "Updating StateObject<\(_typeName(ObjectType.self, qualified: false))> from background\nthreads will cause undefined behavior; make sure to update it from the main thread.")
                    }
                    
                    // <+400>
                    var unchecked = UncheckedSendable<ObservedObject<ObjectType>?>(nil)
                    MainActor.assumeIsolated {
                        let result = block()
                        unchecked.value = ObservedObject(wrappedValue: result)
                    }
                    
                    _object = unchecked.value
                    self.object = _object
                    updated = true
                case .object(let __object):
                    _object = __object
                    self.object = __object
                    updated = true
                }
                
                object = _object!
            }
            
            // <+532>
            updated = withUnsafeMutablePointer(to: &object) { pointer in
                let result = unsafe self.links.update(container: pointer, phase: phase)
                return updated || result
            }
            
            property.storage = .object(object)
            return updated
        }
    }
}
