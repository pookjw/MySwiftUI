// 1ABF77B82C037C602A176AE349787FED
private import _MySwiftUIShims
internal import AttributeGraph

struct ViewDescriptor: TupleDescriptor{
    static var descriptor: UnsafeRawPointer {
        return unsafe _viewProtocolDescriptor()
    }
    
    static nonisolated(unsafe) var typeCache: [ObjectIdentifier: TupleTypeDescription<ViewDescriptor>] = [:]
}

protocol ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer { get }
}

extension ProtocolDescriptor {
    static func conformance(of type: Any.Type) -> TypeConformance<Self>? {
        let descriptor = unsafe descriptor
        
        guard let conformance = unsafe swift_conformsToProtocol(type, descriptor) else {
            return nil
        }
        
        return unsafe TypeConformance(storage: (type: type, conformance: conformance))
    }
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
    static var typeCache: [ObjectIdentifier: TupleTypeDescription<Self>] {
        get set
    }
}

extension TupleDescriptor {
    static func tupleDescription(_ tupleType: TupleType) -> TupleTypeDescription<Self> {
        fatalError("TODO")
    }
}

struct TupleTypeDescription<T: TupleDescriptor> {
    let contentTypes: [(Int, TypeConformance<T>)]
    
    init(_ tupleType: TupleType) {
        /*
         T -> x22/x23
         tupleType -> x24
         return register -> x28
         */
        // x19
        var contentTypes = Array<(Int, TypeConformance<T>)>()
        // x21
        let count = tupleType.count
        // x28
        for index in 0..<count {
            fatalError("TODO")
        }
        
        self.contentTypes = contentTypes
    }
}
