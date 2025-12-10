// FF3C661D9D8317A1C8FE2B7FD4EDE12C
internal import AttributeGraph

protocol DynamicContainerItem {
    // TODO
}

protocol DynamicContainerAdaptor: DynamicContainerItem {
    associatedtype Item
    associatedtype Items
    associatedtype ItemLayout
    // TODO
}

struct DynamicLayoutViewAdaptor {
    @Attribute private var items: ViewList
    @OptionalAttribute private var childGeometries: [ViewGeometry]?
    private var childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
    private var mutateLayoutMap: ((inout DynamicLayoutMap) -> Void) -> Void
}

extension DynamicLayoutViewAdaptor {
    fileprivate struct MakeTransition {
        private var containerInfo: Attribute<DynamicContainer.Info>
        private var uniqueId: UInt32
        private var item: DynamicViewListItem
        private var inputs: _ViewInputs
        private var makeElt: (_ViewInputs) -> _ViewOutputs
        private var outputs: _ViewOutputs?
        private var isArchived: Bool
    }
    
    struct ItemLayout {
        private var release: _ViewList_SubgraphRelease?
    }
    
    enum ChildDepthData {
        case geometries(Attribute<[ViewDepthGeometry]>)
        case depths(Attribute<[ViewDepth]>)
        case none
    }
}
