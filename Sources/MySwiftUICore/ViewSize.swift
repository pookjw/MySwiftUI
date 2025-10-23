#warning("TODO")
internal import CoreGraphics
internal import AttributeGraph

package struct ViewSize {
    package static var zero: ViewSize {
        return ViewSize(value: .zero, _proposal: .zero)
    }
    
    var value: CGSize
    private var _proposal: CGSize
}

extension Attribute where T == ViewSize {
    func size() -> Attribute<CGSize> {
        fatalError("TODO")
    }
}
