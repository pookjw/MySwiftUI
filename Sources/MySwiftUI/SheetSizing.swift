internal import MySwiftUICore
internal import CoreGraphics

struct SheetSizing {
    private(set) var presentationSizing: PresentationSizing
    private(set) var sizeContext: PresentationSizingContext
    
    func sheetSizeThatFits<T : View>(host: _UIHostingView<T>, subview: PresentationSizingRoot) -> CGSize {
        assertUnimplemented()
    }
}
