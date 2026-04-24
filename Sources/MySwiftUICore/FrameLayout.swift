// 73C64038119BBD0A6D8557B14379A404
public import CoreGraphics
private import os.log

extension View {
    @inlinable nonisolated public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        return modifier(
            _FrameLayout(width: width, height: height, alignment: alignment))
    }
    
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @inlinable nonisolated public func frame() -> some View {
        return frame(width: nil, height: nil, alignment: .center)
    }
}

@frozen public struct _FrameLayout {
    internal let width: CGFloat?
    internal let height: CGFloat?
    internal let alignment: Alignment
    
    @usableFromInline
    package init(width: CGFloat?, height: CGFloat?, alignment: Alignment) {
        /*
         width -> x0/x1 -> x24/x22
         height -> x2/x3 -> x23/x25
         alignment -> x4/x5 -> x20/x19
         return pointer -> x8 -> x21
         */
        if isLinkedOnOrAfter(.v2) {
            // <+176>
            assertUnimplemented()
        }
        
        // <+400>
        self.width = width
        self.height = height
        self.alignment = alignment
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
    
    public nonisolated static func _makeView(modifier: _GraphValue<_FrameLayout>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self.makeViewImpl(modifier: modifier, inputs: inputs, body: body)
    }
    
    public nonisolated static func _makeViewList(modifier: _GraphValue<_FrameLayout>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

extension _FrameLayout : Animatable {}
extension _FrameLayout : ViewModifier {}
extension _FrameLayout : Sendable {}
extension _FrameLayout : BitwiseCopyable {}

extension _FrameLayout : UnaryLayout {
    func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        assertUnimplemented()
    }
    
    func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
}

extension _FrameLayout : FrameLayoutCommon {}

fileprivate protocol FrameLayoutCommon {
    // TODO
}
