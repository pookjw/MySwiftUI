package import CoreGraphics
package import MySwiftUICore

extension View {
    package func frame(
        minWidth: CGFloat?,
        idealWidth: CGFloat?,
        maxWidth: CGFloat?,
        minHeight: CGFloat?,
        idealHeight: CGFloat?,
        maxHeight: CGFloat?,
        minDepth: CGFloat?,
        idealDepth: CGFloat?,
        maxDepth: CGFloat?,
        alignment: Alignment3D
    ) -> some View {
        assertUnimplemented()
    }
}

struct _FlexFrameLayout3D : ViewModifier {
    private let minWidth: CGFloat?
    private let idealWidth: CGFloat?
    private let maxWidth: CGFloat?
    private let minHeight: CGFloat?
    private let idealHeight: CGFloat?
    private let maxHeight: CGFloat?
    private let minDepth: CGFloat?
    private let idealDepth: CGFloat?
    private let maxDepth: CGFloat?
    private let alignment: Alignment3D
    
    init(
        minWidth: CGFloat?,
        idealWidth: CGFloat?,
        maxWidth: CGFloat?,
        minHeight: CGFloat?,
        idealHeight: CGFloat?,
        maxHeight: CGFloat?,
        minDepth: CGFloat?,
        idealDepth: CGFloat?,
        maxDepth: CGFloat?,
        alignment: Alignment3D
    ) {
        assertUnimplemented()
    }
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}
