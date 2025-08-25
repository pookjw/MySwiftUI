#warning("TODO")
private import CoreGraphics

package struct ViewTransform {
    private var head: AnyElement?
    private var spaces: CoordinateSpaceNode?
    private var positionAdjustment: CGSize
    private var pendingTranslation: CGSize
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
    }
}

fileprivate class AnyElement {
    var next: AnyElement?
    let depth: Int
    
    init() {
        fatalError("TODO")
    }
}

fileprivate class CoordinateSpaceNode {
    var next: CoordinateSpaceNode?
    var space: CoordinateSpace
    let depth: Int
    
    init() {
        fatalError("TODO")
    }
}
