internal import AttributeGraph
internal import CoreGraphics

struct UpdateScrollStateRequestKey : PreferenceKey {
    static var defaultValue: [ScrollStateRequest] {
        return []
    }
    
    static func reduce(value: inout [any ScrollStateRequest], nextValue: () -> [any ScrollStateRequest]) {
        assertUnimplemented()
    }
}

protocol ScrollStateRequest {
    // TODO
}

struct ScrollStateRequestTransform : StatefulRule {
    @Attribute private var position: CGPoint // 0x0
    @Attribute private var transform: ViewTransform // 0x4
    @Attribute private var phase: _GraphInputs.Phase // 0x8
    @Attribute private var collection: ScrollableCollection // 0xc
    @Attribute private var layoutDirection: LayoutDirection // 0x10
    private var inputs: _GraphInputs // 0x18
    private var oldRequest: (any ScrollStateRequest)? = nil // 0x48
    private var oldResetSeed: UInt32 = 0
    
    init(collection: Attribute<any ScrollableCollection>, inputs: _ViewInputs) {
        self._position = inputs.position
        self._transform = inputs.transform
        self._phase = inputs.base.phase
        self._collection = collection
        self._layoutDirection = inputs.layoutDirection
        self.inputs = inputs.base
    }
    
    typealias Value = (inout [ScrollStateRequest]) -> Void
    
    func updateValue() {
        assertUnimplemented()
    }
}
