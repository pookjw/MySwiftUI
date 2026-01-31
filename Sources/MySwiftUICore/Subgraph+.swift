// 372497ED4F569296C4450147CA418CD0
internal import AttributeGraph
private import _MySwiftUIShims

// AGSubgraphApply는 Subgraph.apply(_:)가 아니라 Subgraph.forEach(_:_:)다.

extension Subgraph {
    func willInvalidate(isInserted: Bool) {
        self.forEach(isInserted ? [.unknown1, .unknown2] : [.unknown2]) { attribte in
            // $sSo13AGSubgraphRefa7SwiftUIE14willInvalidate10isInsertedySb_tFySo11AGAttributeaXEfU_TA
            // _bodyType이 호출될 것 (내부적으로 AGGraphGetAttributeInfo 호출함)
            print(attribte._bodyType)
            fatalError("TODO")
        }
    }
    
    func willRemove() {
        forEach(.unknown1) { attribute in
            // $sSo13AGSubgraphRefa7SwiftUIE10willRemoveyyFySo11AGAttributeaXEfU_Tf4nd_n
            let bodyType = attribute._bodyType
            
            guard let conformance = RemovableAttributeDescriptor.cachedConformance(of: bodyType) else {
                return
            }
            
            conformance
                .unsafeExistentialMetatype((any RemovableAttribute.Type).self)
                .willRemove(attribute: attribute)
        }
    }
    
    func didReinsert() {
        forEach(.unknown1) { _ in
            // $sSo13AGSubgraphRefa7SwiftUIE11didReinsertyyFySo11AGAttributeaXEfU_
            fatalError("TODO")
        }
    }
    
    func addSecondaryChild(_ subgraph: Subgraph) {
        fatalError("TODO")
    }
}

fileprivate struct RemovableAttributeDescriptor: ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer {
        return _removableAttributeProtocolDescriptor()
    }
    
    static nonisolated(unsafe) var typeCache: [ObjectIdentifier: TypeConformance<RemovableAttributeDescriptor>] = [:]
    
    static func cachedConformance(of type: Any.Type) -> TypeConformance<RemovableAttributeDescriptor>? {
        Update.assertIsLocked()
        
        if let conformance = typeCache[ObjectIdentifier(type)] {
            return conformance
        }
        
        // <+196>
        let conformance = conformance(of: type)
        typeCache[ObjectIdentifier(type)] = conformance
        return conformance
    }
}
