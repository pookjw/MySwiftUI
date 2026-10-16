// 8C82E31DBCFF23E23B8937F47207F4D1
internal import AttributeGraph

extension DisplayList {
    func applyViewGraphTransform(time: Attribute<Time>, version: DisplayList.Version) {
        guard !features.isDisjoint(with: [.interpolatorRoots, .stateEffects]) else {
            return
        }
        
        assertUnimplemented()
    }
}
