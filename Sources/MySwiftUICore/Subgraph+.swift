#warning("TODO")
internal import AttributeGraph

extension Subgraph {
    func willInvalidate(isInserted: Bool) {
        self.apply2(flags: isInserted ? 6 : 4) { _ in
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
