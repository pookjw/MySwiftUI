#warning("TODO")
internal import AttributeGraph

struct LayoutTrace {
    static nonisolated(unsafe) var recorder: LayoutTrace.Recorder? = nil
    
    // TODO
}

extension LayoutTrace {
    class Recorder {
        private var graph: Graph
        private var frameActive: Bool
        private var cacheLookup: (proposal: _ProposedSize, hit: Bool)?
        private var alignmentTypes: [ObjectIdentifier: UInt32]
        
        init(graph: Graph) {
            fatalError("TODO")
        }
    }
}
