// 8C82E31DBCFF23E23B8937F47207F4D1
#warning("TODO")
internal import AttributeGraph

extension DisplayList {
    func applyViewGraphTransform(time: Attribute<Time>, version: DisplayList.Version) {
        guard features.isSuperset(of: [.interpolatorRoots, .stateEffects]) else {
            return
        }
        
        fatalError("TODO")
    }
}
