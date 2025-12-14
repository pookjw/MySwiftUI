// E479C0E92CDD045BAF2EF653123E2E0B
internal import AttributeGraph

public struct _ViewListOutputs {
    var views: _ViewListOutputs.Views
    var nextImplicitID: Int
    var staticCount: Int?
    
    init(_ views: _ViewListOutputs.Views, nextImplicitID: Int) {
        self.views = views
        self.nextImplicitID = nextImplicitID
        self.staticCount = nil
    }
}

extension _ViewListOutputs {
    static func sectionListOutputs(_: [_ViewListOutputs], inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    static func groupViewList<Parent: View, Footer: View>(parent: _GraphValue<Parent>, footer: Attribute<Footer>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    static func groupViewListCount<Content: View, Header: View, Footer: View>(inputs: _ViewListCountInputs, contentType: Content.Type, headerType: Header.Type, footerType: Footer.Type) -> Int? {
        fatalError("TODO")
    }
    
    static func emptyParentViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    static func nonEmptyParentViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    func makeAttribute(inputs: _ViewListInputs) -> Attribute<ViewList> {
        fatalError("TODO")
    }
    
    func makeAttribute(viewInputs: _ViewInputs) -> Attribute<ViewList> {
        fatalError("TODO")
    }
}

extension _ViewListOutputs {
    static func unaryViewList<Content: View>(view: _GraphValue<Content>, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         inputs -> x20
         */
        // x23
        let weakAttribute = WeakAttribute(view.value)
        // x29 - 0x90
        let copy_1 = inputs
        // w25
        let options = copy_1.base.options
        let viewGenerator = TypedUnaryViewGenerator.init(view: weakAttribute.base, viewType: Content.self)
        // sp + 0xa8
        let elements = UnaryElements(body: viewGenerator, baseInputs: inputs.base)
        
        let scope: WeakAttribute<_DisplayList_StableIdentityScope>
        if options.contains(.needsStableDisplayListIDs) {
            let copy_2 = copy_1.base
            scope = copy_2[_DisplayList_StableIdentityScope.self]
        } else {
            scope = WeakAttribute()
        }
        
        // <+304>
        fatalError("TODO")
    }
}

extension _ViewListOutputs {
    enum Views {
        case staticList(any _ViewList_Elements)
        case dynamicList(Attribute<ViewList>, _ViewListOutputs.ListModifier?)
    }
    
    class ListModifier {
    }
    
    fileprivate struct ApplyModifiers {
        @Attribute private var base: any ViewList
        private let modifier: _ViewListOutputs.ListModifier
    }
}

@available(*, unavailable)
extension _ViewListOutputs: Sendable {
}

protocol ViewList {
    // TODO
}

protocol _ViewList_Elements {
    var count: Int { get }
    func makeElements(from index: inout Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool)
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
}

extension _ViewList_Elements {
    func makeAllElements(inputs: _ViewInputs, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        fatalError("TODO")
    }
    
    func makeAllElements(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        fatalError("TODO")
    }
    
    func makeOneElement(at index: Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        fatalError("TODO")
    }
    
    func makeOneElement(at index: Int, inputs: _ViewInputs, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        fatalError("TODO")
    }
}

class _ViewList_ID_Views {
    private let isDataDependent: Bool
    
    init() {
        fatalError("TODO")
    }
    
    // TODO
}

fileprivate protocol UnaryViewGenerator {
    func tryToReuse(by other: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
    func makeView(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?) -> _ViewOutputs
}

fileprivate struct TypedUnaryViewGenerator: UnaryViewGenerator {
    private let view: AnyWeakAttribute
    private let viewType: any View.Type
    
    @inline(__always)
    init(view: AnyWeakAttribute, viewType: any View.Type) {
        self.view = view
        self.viewType = viewType
    }
    
    func tryToReuse(by other: TypedUnaryViewGenerator, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
    
    func makeView(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?) -> _ViewOutputs {
        fatalError("TODO")
    }
}

fileprivate struct UnaryElements<T: UnaryViewGenerator>: _ViewList_Elements {
    private var body: T
    private var baseInputs: _GraphInputs
    
    @inline(__always)
    init(body: T, baseInputs: _GraphInputs) {
        self.body = body
        self.baseInputs = baseInputs
    }
    
    var count: Int {
        return 1
    }
    
    func makeElements(from index: inout Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool) {
        fatalError("TODO")
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
}
