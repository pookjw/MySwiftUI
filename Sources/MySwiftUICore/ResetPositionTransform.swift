internal import AttributeGraph
internal import CoreGraphics

struct ResetPositionTransform: Rule, AsyncAttribute {
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var transform: ViewTransform
    
    var value: ViewTransform {
        fatalError("TODO")
    }
}
