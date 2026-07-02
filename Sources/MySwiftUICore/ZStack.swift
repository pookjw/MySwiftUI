public import CoreGraphics
internal import Spatial

@frozen public struct ZStack<Content> : View where Content : View {
    @usableFromInline
    package var _tree: _VariadicView.Tree<_ZStackLayout, Content>
    
    @inlinable public init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        _tree = .init(_ZStackLayout(alignment: alignment)) { content() }
    }
    
    nonisolated public static func _makeView(view: _GraphValue<ZStack<Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        // sp + 0x20
        let copy_1 = inputs
        // view -> x0 -> x29 - 0x34
        // x29 - 0x38
        let tree = view[{ .of(&$0._tree) }]
        return _VariadicView.Tree<_ZStackLayout, Content>.makePlatformSubstitutableView(view: tree, inputs: copy_1)
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension ZStack : Sendable {
}

extension ZStack : UnaryView, PrimitiveView {}

@frozen public struct _ZStackLayout : _VariadicView.UnaryViewRoot, Animatable {
    public var alignment: Alignment
    
    @inlinable public init(alignment: Alignment = .center) {
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension _ZStackLayout : @preconcurrency Layout {
    public static var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: _ZStackLayout.Subviews, cache: inout Void) {
        assertUnimplemented()
    }
    
    public func spacing(subviews: _ZStackLayout.Subviews, cache: inout Void) -> ViewSpacing {
        assertUnimplemented()
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: _ZStackLayout.Subviews, cache: inout Void) -> CGSize {
        assertUnimplemented()
    }
    
    public typealias Cache = Void
}

extension _ZStackLayout : BitwiseCopyable {}

extension _ZStackLayout : @preconcurrency Layout3D {
    func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Void) -> CGFloat {
        assertUnimplemented()
    }
    
    func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout Void) {
        assertUnimplemented()
    }
}

extension _ZStackLayout : _VariadicView_ImplicitRoot {
    static var implicitRoot: _ZStackLayout {
        assertUnimplemented()
    }
}

extension _ZStackLayout : DerivedSpatialLayout {
    typealias SpatialBase = Never // TODO
    typealias Cache3D = Never // TODO
}

extension _VariadicView.Tree where Root == _ZStackLayout, Content : View {
    static func makePlatformSubstitutableView(view: _GraphValue<_VariadicView.Tree<_ZStackLayout, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        if let smuggler = Content.self as? ZStackParameterSmuggler.Type {
            return smuggler.makeParameterSmuggledZStackView(view: view, inputs: inputs)
        }
        
        assertUnimplemented()
    }
}

package protocol ZStackParameterSmuggler {
    static func makeParameterSmuggledZStackView<C : View>(view: _GraphValue<_VariadicView.Tree<_ZStackLayout, C>>, inputs: _ViewInputs) -> _ViewOutputs
}
