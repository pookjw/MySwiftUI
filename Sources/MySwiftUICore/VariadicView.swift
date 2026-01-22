// DC167C463E6601B3880A23A75ACAA63B
private import AttributeGraph

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

extension _VariadicView.Tree: View where Root: _VariadicView_ViewRoot, Content: View {
    public typealias Body = Never
    
    public static nonisolated func _makeView(view: _GraphValue<_VariadicView.Tree<Root, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        // sp + 0x260
        let copy_1 = inputs
        // view -> w28
        // sp + 0x200
        var copy_2 = inputs
        // sp + 0x1a0
        let copy_3 = copy_1
        
        copy_2[ViewListOptionsInput.self] = Root._viewListOptions
        
        // <+188>
        // sp + 0xc8
        let root: _GraphValue<Root> = view[{ tree in
            return .of(&tree.root)
        }]
        
        // <+276>
        // sp + 0x70
        let copy_4 = copy_2
        return Root._makeView(root: root, inputs: copy_4) { [view] graph, inputs in
            // $s7SwiftUI13_VariadicViewO4TreeVA2A01_cd1_D4RootRzAA0D0R_rlE05_makeD04view6inputsAA01_D7OutputsVAA11_GraphValueVyAEy_xq_GG_AA01_D6InputsVtFZAA01_d4ListJ0VAA01_K0V_ARtXEfU0_TA
            let content: _GraphValue<Content> = view[{ tree in
                return .of(&tree.content)
            }]
            
            return Content.makeDebuggableViewList(
                view: content,
                inputs: _ViewListInputs(
                    inputs.base,
                    options: _ViewListInputs.Options(rawValue: inputs[ViewListOptionsInput.self])
                )
            )
        }
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<_VariadicView.Tree<Root, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension _VariadicView.Tree: PrimitiveView where Root: _VariadicView_ViewRoot, Content: View {}

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
        return 0
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

extension _VariadicView_ViewRoot {
    public static nonisolated func _makeView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(root: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
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
    mutating func visit<T: _VariadicView_ImplicitRoot>(type: T.Type)
}

protocol _VariadicView_ImplicitRoot: _VariadicView_ViewRoot, _VariadicView_AnyImplicitRoot {
    static nonisolated var implicitRoot: Self {
        get
    }
}

extension _VariadicView_ImplicitRoot {
    static nonisolated func visitType<T: _VariadicView_ImplicitRootVisitor>(visitor: inout T) {
        visitor.visit(type: Self.self)
    }
}

protocol _VariadicView_AnyImplicitRoot {
    static nonisolated func visitType<T: _VariadicView_ImplicitRootVisitor>(visitor: inout T)
}

extension View {
    static nonisolated func makeImplicitRoot(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        var visitor = MakeViewRoot(
            inputs: inputs,
            body: { [view] graph, inputs in
                // $s7SwiftUI4ViewPAAE16makeImplicitRoot4view6inputsAA01_C7OutputsVAA11_GraphValueVyxG_AA01_C6InputsVtFZAA01_c4ListI0VAA01_J0V_AMtcfU_
                let listInputs = inputs.implicitRootBodyInputs
                // x23 register는 활용하지 않음
                _ = Self._makeViewList(view: view, inputs: listInputs)
                
                return MainActor.assumeIsolated { [unchecked = UncheckedSendable((view, listInputs))] in
                    return UncheckedSendable(Self.Body.makeDebuggableViewList(view: unchecked.value.0, inputs: unchecked.value.1))
                }.value
            },
            outputs: nil
        )
        inputs.implicitRootType.visitType(visitor: &visitor)
        
        return visitor.outputs!
    }
}

fileprivate struct MakeViewRoot: _VariadicView_ImplicitRootVisitor {
    var inputs: _ViewInputs
    var body: (_Graph, _ViewInputs) -> _ViewListOutputs
    var outputs: _ViewOutputs?
    
    mutating func visit<T>(type: T.Type) where T : _VariadicView_ImplicitRoot {
        // sp + 0x220
        let copy_1 = inputs
        // sp + 0x2e0
        var copy_2 = inputs
        // sp + 0x280
        let copy_3 = copy_1
        // x25
        let implicitRoot = type.implicitRoot
        // x24
        let attribute = copy_2.intern(implicitRoot, id: .implicitViewRoot)
        _ = consume copy_3
        
        copy_2 = inputs
        // sp + 0x1c0
        let copy_4 = inputs
        // sp + 0x160
        let _ = copy_2
        copy_2[ViewListOptionsInput.self] = T._viewListOptions
        // sp + 0x7c
        let graphValue = _GraphValue<T>(attribute)
        
        // sp + 0x90
        let copy_6 = copy_4
        // sp + 0x20
        let copy_7 = copy_4
        // sp + 0x160
        let _ = copy_6
        
        self.outputs = T._makeView(root: graphValue, inputs: copy_7, body: body)
    }
}

fileprivate struct ImplicitRootType: ViewInput {
    @safe static nonisolated(unsafe) let defaultValue: any _VariadicView_AnyImplicitRoot.Type = _VStackLayout.self
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

struct ViewListOptionsInput: ViewInput {
    static var defaultValue: Int {
        return 0
    }
}
