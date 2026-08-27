@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph
internal import Spatial
internal import CoreGraphics

final class LeafViewResponder3D : ViewResponder {
    private let inputs: _ViewInputs
    private let viewSubgraph: Subgraph
    var helper = ContentResponder3DHelper(size: .zero, transform: ViewTransform())
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
    var size: Size3D
    var transform: ViewTransform
}

final class EntityGestureResponder : ViewResponder {
    // TODO
}

struct LeafResponder3DFilter : StatefulRule {
    @Attribute private(set) var size: ViewSize // 0x0
    @Attribute private(set) var depth: ViewDepth // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var transform: ViewTransform // 0xc
    let identity: _DisplayList_Identity // 0x20 (field)
    let responder: LeafViewResponder3D // 0x24 (field)
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        // <+580>
        // x21
        let responder = self.responder
        // x25 / w19 (x29 - 0xc8)
        let (size, sizeChanged) = self.$size.changedValue(options: [])
        // x29 - 0xc0 / x29 - 0x138
        let (depth, depthChanged) = self.$depth.changedValue(options: [])
        
        // w22
        let positionChanged: Bool
        let d8: CGFloat
        let d9: CGFloat
        do {
            let (position, changed) = self.$position.changedValue(options: [])
            d8 = position.x
            d9 = position.y
            positionChanged = changed
        }
        
        // x27 (x29 - 0xb0) / w28
        let (transform, transformChanged) = self.$transform.changedValue(options: [])
        let x290x14c = (transformChanged || positionChanged)
        
        // <+844>
        if x290x14c {
            responder.helper.transform = transform
            responder.helper.transform.appendPosition(CGPoint(x: d8, y: d9))
        }
        
        // <+1148>
        if sizeChanged || depthChanged {
            // <+1232>
            responder.helper.size = Size3D(size.value, depth: depth.value)
        } else {
            // <+1476>
        }
        
        // <+1552>
        responder.serverResponderID = self.identity.value
        
        if !self.hasValue {
            self.value = [responder]
        }
    }
}
