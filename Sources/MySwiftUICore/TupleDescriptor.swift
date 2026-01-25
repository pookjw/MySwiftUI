internal import AttributeGraph
private import os.log

protocol TupleDescriptor: ProtocolDescriptor {
    static var typeCache: [ObjectIdentifier: TupleTypeDescription<Self>] {
        get set
    }
}

extension TupleDescriptor {
    static func tupleDescription(_ tupleType: TupleType) -> TupleTypeDescription<Self> {
        let key = ObjectIdentifier(tupleType.type)
        if let existing = typeCache[key] {
            return existing
        }
        
        let description = TupleTypeDescription<Self>(tupleType)
        typeCache[key] = description
        return description
    }
}

struct TupleTypeDescription<T: ProtocolDescriptor> {
    let contentTypes: [(Int, TypeConformance<T>)]
    
    init(_ tupleType: TupleType) {
        /*
         T -> x22/x23
         tupleType -> x24
         return register -> x28
         */
        // x19
        var contentTypes = Array<(Int, TypeConformance<T>)>()
        // x28
        for index in tupleType.indices {
            // x19
            let type = tupleType.type(at: index)
            // sp + 0x60
            guard let conformance = T.conformance(of: type) else {
                let message = "Ignoring invalid type at index \(index), type \(type)"
                unsafe Log.unlocatedIssuesLog.fault("\(message, privacy: .public)")
                continue
            }
            
            contentTypes.append((index, conformance))
        }
        
        self.contentTypes = contentTypes
    }
}
