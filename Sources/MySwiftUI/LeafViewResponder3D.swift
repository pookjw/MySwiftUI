@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph
private import Spatial
internal import CoreGraphics

final class LeafViewResponder3D : ViewResponder {
    private let inputs: _ViewInputs
    private let viewSubgraph: Subgraph
    private var helper = ContentResponder3DHelper(size: .zero, transform: ViewTransform())
    private var cache = ViewResponder.ContainsPointsCache()
    private var _children: [UInt64 : WeakBox<EntityGestureResponder>] = [:]
    
    @inline(__always) // 원래 없음
    init(inputs: _ViewInputs, viewSubgraph: Subgraph) {
        self.inputs = inputs
        self.viewSubgraph = viewSubgraph
        super.init()
    }
}

struct ContentResponder3DHelper {
    fileprivate private(set) var size: Size3D
    fileprivate private(set) var transform: ViewTransform
}

final class EntityGestureResponder : ViewResponder {
    // TODO
}

struct LeafResponder3DFilter : StatefulRule {
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var depth: ViewDepth
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var transform: ViewTransform
    let identity: _DisplayList_Identity
    let responder: LeafViewResponder3D
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        assertUnimplemented()
    }
}
