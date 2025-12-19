internal import AttributeGraph

final class _ViewList_SubgraphRelease {
    private let subgraphs: ArraySlice<_ViewList_Subgraph>
    
    init() {
        fatalError("TODO")
    }
}

class _ViewList_Subgraph {
    final let subgraph: Subgraph
    final var refcount: UInt32
    
    init(subgraph: Subgraph) {
        self.refcount = 1
        self.subgraph = subgraph
    }
    
    final func wrapping(_ vistList: ViewList) -> _ViewList_Subgraph {
        fatalError("TODO")
    }
    
    func invalidate() {
        fatalError("TODO")
    }
}

struct _ViewList_ID {
    private var _index: Int32
    private var implicitID: Int32
    private var explicitIDs: [_ViewList_ID.Explicit]
}

extension _ViewList_ID {
    struct Explicit {
        private let id: AnyHashable2
        private let reuseID: Int
        private let owner: AnyAttribute
        private let isUnary: Bool
    }
}

struct _ViewList_SubgraphElements {
    private var base: _ViewList_Elements
    private var subgraphs: _ViewList_SublistSubgraphStorage
}

struct _ViewList_SublistSubgraphStorage {
    private var subgraphs: [_ViewList_Subgraph]
}

struct _ViewList_Sublist {
    var start: Int
    var count: Int
    var id: _ViewList_ID
    var elements: _ViewList_SubgraphElements
    var traits: ViewTraitCollection
    var list: Attribute<ViewList>?
    
    @inline(__always)
    init(start: Int, count: Int, id: _ViewList_ID, elements: _ViewList_SubgraphElements, traits: ViewTraitCollection, list: Attribute<ViewList>?) {
        self.start = start
        self.count = count
        self.id = id
        self.elements = elements
        self.traits = traits
        self.list = list
    }
}
