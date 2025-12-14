// 1ABF77B82C037C602A176AE349787FED
private import _MySwiftUIShims

struct ViewDescriptor {
    static var descriptor: UnsafeRawPointer {
        return _viewProtocolDescriptor()
    }
}

protocol ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer { get }
}

extension ProtocolDescriptor {
    static func conformance(of type: Any.Type) -> TypeConformance<Self>? {
        let descriptor = descriptor
        
        guard let conformance = swift_conformsToProtocol(type, descriptor) else {
            return nil
        }
        
        return TypeConformance(storage: (type: type, conformance: conformance))
    }
}

extension ViewDescriptor: TupleDescriptor {
}

extension ViewDescriptor: ConditionalProtocolDescriptor {
    fileprivate static nonisolated(unsafe) var conditionalCache: [ObjectIdentifier: ConditionalTypeDescriptor<ViewDescriptor>] = [:]
    
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<ViewDescriptor>? {
        return unsafe conditionalCache[key]
    }
    
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<ViewDescriptor>) {
        unsafe conditionalCache[key] = value
    }
}

protocol TupleDescriptor: ProtocolDescriptor {
}
