internal import AttributeGraph

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
        fatalError("TODO")
    }
    
    func didReinsert() {
        apply { 
            // $sSo13AGSubgraphRefa7SwiftUIE11didReinsertyyFySo11AGAttributeaXEfU_
            fatalError("TODO")
        }
    }
    
    func addSecondaryChild(_ subgraph: Subgraph) {
        fatalError("TODO")
    }
}
