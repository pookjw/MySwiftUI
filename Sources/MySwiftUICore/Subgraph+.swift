#warning("TODO")
internal import AttributeGraph

extension Subgraph {
    func willInvalidate(isInserted: Bool) {
        self.forEach(isInserted ? [.unknown1, .unknown2] : [.unknown2]) { _ in
            // $sSo13AGSubgraphRefa7SwiftUIE14willInvalidate10isInsertedySb_tFySo11AGAttributeaXEfU_TA
            fatalError("TODO")
        }
    }
    
    func willRemove() {
        fatalError("TODO")
    }
    
    func didReinsert() {
        fatalError("TODO")
    }
    
    func addSecondaryChild(_ subgraph: Subgraph) {
        fatalError("TODO")
    }
}
