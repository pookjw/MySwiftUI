// E479C0E92CDD045BAF2EF653123E2E0B
internal import AttributeGraph

final class _ViewList_SubgraphRelease {
    private let subgraphs: ArraySlice<_ViewList_Subgraph>
    
    @inline(__always)
    fileprivate init(subgraphs: ArraySlice<_ViewList_Subgraph>) {
        self.subgraphs = subgraphs
    }
    
    deinit {
        Update.ensure {
            for subgrah in subgraphs {
                let _subgrah = subgrah.subgraph
                if _subgrah.isValid {
                    _subgrah.willInvalidate(isInserted: true)
                    _subgrah.invalidate()
                }
            }
        }
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

struct _ViewList_ID: Hashable {
    var _index: Int32
    var implicitID: Int32
    var explicitIDs: [_ViewList_ID.Explicit]
    
    init(implicitID: Int) {
        self._index = 0
        self.explicitIDs = []
        self.implicitID = Int32(implicitID)
    }
    
    init() {
        self._index = 0
        self.implicitID = 0
        self.explicitIDs = []
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: 0)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, reuseID: Int) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: reuseID)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool) {
        bind(explicitID: explicitID, owner: owner, isUnary: isUnary, reuseID: 0)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool, reuseID: Int) {
        /*
         owner -> x21
         isUnary -> x22
         reuseID -> x19
         */
        let explicitID = _ViewList_ID.Explicit(
            id: AnyHashable2(explicitID),
            reuseID: reuseID,
            owner: owner,
            isUnary: isUnary
        )
        explicitIDs.append(explicitID)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_index)
        hasher.combine(implicitID)
        fatalError("TODO")
    }
}

extension _ViewList_ID {
    struct Explicit: Equatable {
        let id: AnyHashable2
        let reuseID: Int
        let owner: AnyAttribute
        let isUnary: Bool
    }
}

struct _ViewList_SubgraphElements {
    var base: any _ViewList_Elements
    var subgraphs: _ViewList_SublistSubgraphStorage
    
    @inline(__always)
    init(base: any _ViewList_Elements, subgraphs: _ViewList_SublistSubgraphStorage) {
        self.base = base
        self.subgraphs = subgraphs
    }
}

struct _ViewList_SublistSubgraphStorage {
    var subgraphs: [_ViewList_Subgraph]
    
    var isValid: Bool {
        guard !subgraphs.isEmpty else {
            return true
        }
        
        for subgraph in subgraphs {
            guard subgraph.subgraph.isValid else {
                return false
            }
        }
        
        return true
    }
    
    func retain() -> _ViewList_SubgraphRelease? {
        guard !subgraphs.isEmpty else {
            return nil
        }
        
        // x22
        let count = subgraphs.count
        // x21
        var index = subgraphs.count
        repeat {
            // x23
            let _index = index - 1
            
            let subgraph = subgraphs[_index]
            
            guard
                subgraph.refcount != 0,
                subgraph.subgraph.isValid
            else {
                break
            }
            subgraph.refcount &+= 1
            index = _index
        } while index != 0
        
        guard index != count else {
            return nil
        }
        
        let slice = subgraphs[index..<subgraphs.endIndex]
        for subgraph in slice {
            let unamanged = Unmanaged.passUnretained(subgraph)
            unamanged.retain()
        }
        
        return _ViewList_SubgraphRelease(subgraphs: slice)
    }
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
