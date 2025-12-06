// DC167C463E6601B3880A23A75ACAA63B

public enum _VariadicView {
    public typealias Root = _VariadicView_Root
    public typealias ViewRoot = _VariadicView_ViewRoot
    public typealias Children = _VariadicView_Children
    public typealias UnaryViewRoot = _VariadicView_UnaryViewRoot
    public typealias MultiViewRoot = _VariadicView_MultiViewRoot
    
    @frozen public struct Tree<Root, Content> where Root: _VariadicView_Root {
        public var root: Root
        public var content: Content
        
        @inlinable package init(root: Root, content: Content) {
            self.root = root
            self.content = content
        }
        
        @inlinable public init(_ root: Root, @ViewBuilder content: () -> Content) {
            self.root = root
            self.content = content()
        }
    }
}
@available(*, unavailable)
extension _VariadicView.Tree: Sendable {
}
@available(*, unavailable)
extension _VariadicView: Sendable {
}

public protocol _VariadicView_Root {
    static var _viewListOptions: Int { get }
}

extension _VariadicView_Root {
    public static var _viewListOptions: Int {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}

@preconcurrency @MainActor public protocol _VariadicView_ViewRoot: _VariadicView_Root {
    static nonisolated func _makeView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs
    static nonisolated func _makeViewList(root: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs
    static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int?
    
    associatedtype Body : View
    @ViewBuilder @MainActor @preconcurrency func body(children: _VariadicView.Children) -> Self.Body
}

extension _VariadicView_ViewRoot where Self.Body == Never {
    @MainActor @preconcurrency public func body(children: _VariadicView.Children) -> Never {
        fatalError("TODO")
    }
}

public protocol _VariadicView_UnaryViewRoot: _VariadicView_ViewRoot {
}

public protocol _VariadicView_MultiViewRoot: _VariadicView_ViewRoot {
}

public struct _VariadicView_Children {
}

extension _VariadicView_Children: View, MultiView, PrimitiveView {
    public static nonisolated func _makeViewList(view: _GraphValue<_VariadicView.Children>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public typealias Body = Never
}

extension _VariadicView_Children: RandomAccessCollection {
    public struct Element: View, UnaryView, PrimitiveView, Identifiable {
        public var id: AnyHashable {
            fatalError("TODO")
        }
        
        public func id<ID>(as _: ID.Type = ID.self) -> ID? where ID : Hashable {
            fatalError("TODO")
        }
        
        public subscript<Trait>(key: Trait.Type) -> Trait.Value where Trait : _ViewTraitKey {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
        
        public static nonisolated func _makeView(view: _GraphValue<_VariadicView_Children.Element>, inputs: _ViewInputs) -> _ViewOutputs {
            fatalError("TODO")
        }
        
        public typealias Body = Never
        public typealias ID = AnyHashable
    }
    
    public var startIndex: Int {
        fatalError("TODO")
    }
    
    public var endIndex: Int {
        fatalError("TODO")
    }
    
    public subscript(index: Int) -> _VariadicView_Children.Element {
        fatalError("TODO")
    }
    
    public typealias Index = Int
    public typealias Indices = Range<Int>
    public typealias Iterator = IndexingIterator<_VariadicView_Children>
    public typealias SubSequence = Slice<_VariadicView_Children>
}

@available(*, unavailable)
extension _VariadicView_Children.Element: Sendable {
}

@available(*, unavailable)
extension _VariadicView_Children: Sendable {
}

protocol _VariadicView_ImplicitRootVisitor {
    func visit<T: _VariadicView_ImplicitRoot>(type: T.Type)
}

protocol _VariadicView_ImplicitRoot: _VariadicView_ViewRoot, View {
    var implicitRoot: Self {
        get
    }
}

extension _VariadicView_ImplicitRoot {
    static func visitType<T: _VariadicView_ImplicitRootVisitor>(visitor: inout T) {
        fatalError("TODO")
    }
}

protocol _VariadicView_AnyImplicitRoot: _VariadicView_ImplicitRoot {
    static func visitType<T: _VariadicView_ImplicitRootVisitor>(visitor: inout T)
}

extension View {
    static nonisolated func makeImplicitRoot(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

fileprivate struct MakeViewRoot: _VariadicView_ImplicitRootVisitor {
    private var inputs: _ViewInputs
    private var body: (_Graph, _ViewInputs) -> _ViewListOutputs
    private var outputs: _ViewOutputs?
    
    func visit<T>(type: T.Type) where T : _VariadicView_ImplicitRoot {
        fatalError("TODO")
    }
}

fileprivate struct ImplicitRootType: ViewInput {
    static let defaultValue: any _VariadicView_AnyImplicitRoot.Type = _VStackLayout.self
}

extension _ViewInputs {
    var implicitRootType: any _VariadicView_AnyImplicitRoot.Type {
        get {
            return self[ImplicitRootType.self]
        }
        set {
            self[ImplicitRootType.self] = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
}
