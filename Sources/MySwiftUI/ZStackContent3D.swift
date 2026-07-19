public import MySwiftUICore
public import CoreGraphics
internal import AttributeGraph

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ZStack {
    @inlinable public init<V>(alignment: Alignment = .center, spacing: CGFloat?, @ViewBuilder content: () -> V) where Content == ZStackContent3D<V>, V : View {
        self.init(alignment: alignment) {
            ZStackContent3D(spacing: spacing, content: content())
        }
    }
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct ZStackContent3D<Content> where Content : View {
    public var spacing: CGFloat?
    public var content: Content
    
    @inlinable public init(spacing: CGFloat?, content: Content) {
        self.spacing = spacing
        self.content = content
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<ZStackContent3D<Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    @available(visionOS 2.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias Body = Never
}

@available(*, unavailable)
extension ZStackContent3D : Sendable {
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ZStackContent3D : View, PrimitiveView, MultiView {}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ZStackContent3D : ZStackParameterSmuggler {
    package nonisolated static func makeParameterSmuggledZStackView<C>(view: _GraphValue<_VariadicView.Tree<_ZStackLayout, C>>, inputs: _ViewInputs) -> _ViewOutputs where C : View {
        /*
         view -> x0 -> x20
         return pointer -> x8 -> x29 - 0x80
         inputs -> x1 -> x29 - 0x78
         */
        // <+260>
        // x28
        let casted = view
            .unsafeBitCast(to: _VariadicView.Tree<_ZStackLayout, Self>.self)
        // w25
        let alignment = view.value[offset: { .of(&$0.root.alignment) }]
        // w19
        let spacing = casted.value[offset: { .of(&$0.content.spacing) }]
        // <+440>
        let content = casted.value[offset: { .of(&$0.content.content) }]
        
        let stack = Self._SpacedZStack(
            alignment: alignment,
            spacing: spacing,
            content: content
        )
        
        let stackValue = _GraphValue(stack)
        return _VariadicView.Tree<ZStackLayout3D, Content>
            .makeDebuggableView(view: stackValue, inputs: inputs)
    }
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ZStackContent3D {
    struct _SpacedZStack : Rule {
        @Attribute fileprivate private(set) var alignment: Alignment
        @Attribute fileprivate private(set) var spacing: CGFloat?
        @Attribute fileprivate private(set) var content: Content
        
        var value: _VariadicView.Tree<ZStackLayout3D, Content> {
            let layout = ZStackLayout3D(
                alignment: self.alignment,
                spacing: self.spacing
            )
            
            return _VariadicView.Tree(root: layout, content: self.content)
        }
    }
}
