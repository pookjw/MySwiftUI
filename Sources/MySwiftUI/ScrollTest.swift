internal import MySwiftUICore
private import CoreGraphics

final class ScrollTest {
    private let parameters: ScrollTest.Parameters
    
    init(parameters: ScrollTest.Parameters) {
        self.parameters = parameters
    }
    
    func run<Content : View>(in view: _UIHostingView<Content>, completion: @escaping () -> Void) {
        assertUnimplemented()
    }
}

extension ScrollTest {
    struct Parameters {
        private var startOffset: CGFloat
        private var iterations: Int
        private var delta: CGFloat
        private var length: CGFloat
        private var axis: Axis
    }
}
