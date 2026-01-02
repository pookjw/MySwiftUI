internal import CoreGraphics
internal import AttributeGraph

package struct ViewSize: Equatable {
    package static var zero: ViewSize {
        return ViewSize(value: .zero, _proposal: .zero)
    }
    
    var value: CGSize
    private var _proposal: CGSize
    
    // TODO
}
