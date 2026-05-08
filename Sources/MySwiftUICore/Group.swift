// C1B8B6896BB94C69479F427820712D02

@frozen public struct Group<Content> {
    public typealias Body = Never
    
    @usableFromInline
    package var content: Content
    
    @_disfavoredOverload @inlinable package init(_content: Content) { self.content = _content }
}

@available(*, unavailable)
extension Group : Sendable {
}

extension Group {
    @available(*, deprecated, message: "Do not use this.")
    @_alwaysEmitIntoClient public static func _make(content: Content) -> Group<Content> {
        self.init(_content: content)
    }
}

extension Group : View where Content : View {
    @inlinable nonisolated public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<Group<Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return _VariadicView.Tree<GroupContainer, Content>.makeDebuggableViewList(view: view.unsafeBitCast(to: _VariadicView.Tree<GroupContainer, Content>.self), inputs: inputs)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

extension Group : PrimitiveView, MultiView where Content : View {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Group {
    public init<Base, Result>(subviews view: Base, @ViewBuilder transform: @escaping (SubviewsCollection) -> Result) where Content == GroupElementsOfContent<Base, Result>, Base : View, Result : View {
        self.init { 
            // $s7SwiftUI5GroupV8sections9transformACyAA0C17SectionsOfContentVyqd__qd_0_GGqd___qd_0_AA17SectionCollectionVctcAHRszAA4ViewRd__AaLRd_0_r0_lufcAHyXEfU_TA
            GroupElementsOfContent(subviews: view, content: transform)
        }
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct GroupElementsOfContent<Subviews, Content> : View where Subviews : View, Content : View {
    @safe private nonisolated(unsafe) let storage: GroupElementsOfContent<Subviews, Content>.Storage
    @safe private nonisolated(unsafe) let content: (SubviewsCollection) -> Content
    
    nonisolated init(subviews: Subviews, content: @escaping (SubviewsCollection) -> Content) {
        if let collection = subviews as? SubviewsCollection {
            self.storage = .subviewsCollection(collection)
        } else {
            self.storage = .view(subviews)
        }
        
        self.content = content
    }
    
    @MainActor @preconcurrency public var body: some View {
        switch storage {
        case .subviewsCollection(let collection):
            content(collection)
        case .view(let subviews):
            _VariadicView.Tree(root: SubviewsRoot(content: content), content: subviews)
        }
    }
}

extension GroupElementsOfContent {
    enum Storage {
        case subviewsCollection(SubviewsCollection)
        case view(Subviews)
    }
}

@available(*, unavailable)
extension GroupElementsOfContent : Sendable {
}

fileprivate struct GroupContainer : _VariadicView_MultiViewRoot {
    nonisolated static func _makeView(root: _GraphValue<GroupContainer>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(root: _GraphValue<GroupContainer>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        return body(_Graph(), inputs)
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        return body(inputs)
    }
}
