internal import AttributeGraph

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
        forEach(.unknown1) { _ in
            // $sSo13AGSubgraphRefa7SwiftUIE10willRemoveyyFySo11AGAttributeaXEfU_Tf4nd_n
            fatalError("TODO")
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
