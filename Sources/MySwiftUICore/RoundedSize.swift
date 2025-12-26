internal import AttributeGraph
internal import CoreGraphics

struct RoundedSize: Rule, AsyncAttribute {
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var pixelLength: CGFloat
    
    var value: ViewSize {
        fatalError("TODO")
    }
}
