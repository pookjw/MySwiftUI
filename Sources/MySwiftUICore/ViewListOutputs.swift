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
    
    init(_ views: _ViewListOutputs.Views, nextImplicitID: Int, staticCount: Int?) {
        self.views = views
        self.nextImplicitID = nextImplicitID
        self.staticCount = staticCount
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
        // inputs -> x19
        // sp + 0xf8
        let copy_1 = self
        
        switch copy_1.views {
        case .staticList(let elements):
            // <+184>
            fatalError("TODO")
        case .dynamicList(let viewList, let listModifier):
            // <+64>
            /*
             viewList -> w20
             listModifier - > x19
             */
            
            guard let listModifier else {
                return viewList
            }
            
            // <+76>
            fatalError("TODO")
        }
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
        let viewGenerator = TypedUnaryViewGenerator(view: weakAttribute.base, viewType: Content.self)
        // sp + 0xa8
        let elements = UnaryElements(body: viewGenerator, baseInputs: inputs.base)
        
        // w25
        let empty = AnyAttribute.empty
        // x23/w22
        let scope: WeakAttribute<_DisplayList_StableIdentityScope>?
        if options.contains(.needsStableDisplayListIDs) {
            let copy_2 = copy_1.base
            scope = copy_2[_DisplayList_StableIdentityScope.self]
        } else {
            scope = nil
        }
        
        // <+304>
        // w26
        let traits = inputs.$traits?.projectedValue
        if traits == nil {
            let shouldTransition = inputs.options.contains(.canTransition) && !inputs.options.contains(.disableTransitions)
            let flag: Bool
            if shouldTransition {
                flag = scope != nil
            } else {
                flag = scope == nil
            }
            
            if flag {
                // <+316>
                let flag: Bool
                switch inputs.contentOffset {
                case nil:
                    // <+688>
                    flag = true
                case .staticCount(_, let needsDynamicView):
                    flag = !needsDynamicView
                default:
                    // <+364>
                    flag = false
                }
                
                if flag {
                    // <+688>
                    let outputs = _ViewListOutputs(
                        .staticList(elements),
                        nextImplicitID: inputs.implicitID &+ 1,
                        staticCount: 1
                    )
                    return outputs
                }
            } else {
                // <+364>
            }
        }
        
        // <+364>
        // sp + 0x18
        let copy_2 = elements
        // x24
        let implicitID = inputs.implicitID
        // w27
        let shouldTransition = inputs.options.contains(.canTransition) && !inputs.options.contains(.disableTransitions)
        
        // <+400>
        // w26
        let optionalTraits: OptionalAttribute<ViewTraitCollection>
        if let traits {
            optionalTraits = OptionalAttribute(traits)
        } else {
            optionalTraits = OptionalAttribute()
        }
        // <+432>
        let rule = BaseViewList.Init(
            elements: elements,
            implicitID: implicitID,
            canTransition: shouldTransition,
            stableIDScope: scope,
            contentOffset: inputs.contentOffset,
            traitKeys: inputs.traitKeys,
            traits: optionalTraits
        )
        let attribute = Attribute(rule)
        
        let outputs = _ViewListOutputs(.dynamicList(attribute, nil), nextImplicitID: implicitID &+ 1, staticCount: 1)
        return outputs
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
    func count(style: _ViewList_IteratorStyle) -> Int
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int
    var traitKeys: ViewTraitKeys? { get }
    var viewIDs: _ViewList_ID_Views? { get }
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator)
    var traits: ViewTraitCollection { get }
    func applyNodes(from: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, consuming _ViewList_TemporarySublistTransform) -> Bool) -> Bool
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit?
    func firstOffset<T: Hashable>(forID: T, style: _ViewList_IteratorStyle) -> Int?
    func print(into: inout SExpPrinter)
}

extension ViewList {
    var count: Int {
        fatalError("TODO")
    }
    
    func applyIDs(from index: inout Int, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_ID) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func applySublists(from index: inout Int, list: Attribute<ViewList>?, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        applySublists(from: &index, style: _ViewList_IteratorStyle(granularity: 1), list: list, to: body)
    }
    
    var allViewIDs: _ViewList_ID_Views {
        fatalError("TODO")
    }
    
    func applyIDs(from: inout Int, listAttribute: Attribute<ViewList>?, to body: (_ViewList_ID) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func firstOffset(of: _ViewList_ID.Canonical) -> Int? {
        fatalError("TODO")
    }
    
    var debugDescription: String {
        fatalError("TODO")
    }
    
    func applyIDs(from index: inout Int, style: _ViewList_IteratorStyle, listAttribute: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_ID) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    var isEmpty: Bool {
        fatalError("TODO")
    }
    
    var estimatedCount: Int {
        fatalError("TODO")
    }
    
    func applySublists(from index: inout Int, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func applySublists(from index: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        return applySublists(
            from: &index,
            style: style,
            list: list,
            transform: _ViewList_TemporarySublistTransform(),
            to: { _ in
                // $s7SwiftUI8ViewListPAAE13applySublists4from5style4list9transform2toSbSiz_AA01_cD14_IteratorStyleV14AttributeGraph0N0VyAaB_pGSgAA01_cD26_TemporarySublistTransformVSbAA01_cd1_Q0VXEtFSbSiz_AkA01_cD5_NodeOARtXEfU_TA
                fatalError("TODO")
            }
        )
    }
    
    func applySublists(from index: inout Int, style: _ViewList_IteratorStyle, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func applySublists(from index: inout Int, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func applyIDs(from: inout Int, listAttribute: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_ID) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func firstOffset(of: _ViewList_ID.Canonical, style: _ViewList_IteratorStyle) -> Int? {
        fatalError("TODO")
    }
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

fileprivate struct BaseViewList: CustomStringConvertible {
    private var elements: any _ViewList_Elements
    private var implicitID: Int
    private(set) var traitKeys: ViewTraitKeys?
    var traits: ViewTraitCollection
    
    var description: String {
        fatalError("TODO")
    }
    
    @inline(__always)
    init(elements: any _ViewList_Elements, implicitID: Int, traitKeys: ViewTraitKeys?, traits: ViewTraitCollection) {
        self.elements = elements
        self.implicitID = implicitID
        self.traitKeys = traitKeys
        self.traits = traits
    }
}

extension BaseViewList: ViewList {
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        fatalError("TODO")
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    var viewIDs: _ViewList_ID_Views? {
        fatalError("TODO")
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        fatalError("TODO")
    }
    
    func applyNodes(from: inout Int, style: _ViewList_IteratorStyle, list: Attribute<any ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, consuming _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        fatalError("TODO")
    }
    
    func print(into: inout SExpPrinter) {
        fatalError("TODO")
    }
}

extension BaseViewList {
    fileprivate struct Init: CustomStringConvertible, Rule, AsyncAttribute {
        private let elements: any _ViewList_Elements
        private let implicitID: Int
        private let canTransition: Bool
        private let stableIDScope: WeakAttribute<_DisplayList_StableIdentityScope>?
        private let contentOffset: ViewContentOffset?
        private let traitKeys: ViewTraitKeys?
        @OptionalAttribute private var traits: ViewTraitCollection?
        
        @inline(__always)
        init(
            elements: _ViewList_Elements,
            implicitID: Int,
            canTransition: Bool,
            stableIDScope: WeakAttribute<_DisplayList_StableIdentityScope>?,
            contentOffset: ViewContentOffset?,
            traitKeys: ViewTraitKeys?,
            traits: OptionalAttribute<ViewTraitCollection>
        ) {
            self.elements = elements
            self.implicitID = implicitID
            self.canTransition = canTransition
            self.stableIDScope = stableIDScope
            self.contentOffset = contentOffset
            self.traitKeys = traitKeys
            self._traits = traits
        }
        
        var description: String {
            fatalError("TODO")
        }
        
        var value: any ViewList {
            // self -> x24
            var list = BaseViewList(elements: elements, implicitID: implicitID, traitKeys: traitKeys, traits: traits ?? ViewTraitCollection())
            
            if canTransition {
                list.traits.canTransition = true
            }
            
            if let stableIDScope {
                list.traits[_DisplayList_StableIdentityScope.self] = stableIDScope
            }
            
            if let contentOffset {
                list.traits[ViewContentOffset.self] = contentOffset
            }
            
            return list
        }
    }
}

struct _ViewList_IteratorStyle: Equatable {
    private var value: UInt
    
    var granularity: Int {
        get {
            return Int(bitPattern: value >> 1)
        }
        set {
            value = (value & 1) | ((UInt(bitPattern: newValue) & ((1 << 63) - 1)) << 1)
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    var applyGranularity: Bool {
        get {
            return (value & 1) != 0
        }
        set {
            value = (value & ~1) | (newValue ? 1 : 0)
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    @inline(__always)
    init(granularity: Int) {
        value = UInt(bitPattern: granularity) << 1
    }
    
    func alignToNextGranularityMultiple(_ other: inout Int) {
        var x9 = value
        var x8 = UInt(bitPattern: granularity)
        
        guard x8 != 1 else {
            return
        }
        
        x9 = UInt(bitPattern: other)
        var x10 = x9 / x8
        x10 = x9 &- (x10 * x8)
        
        guard x10 != 0 else {
            return
        }
        
        x8 -= x10
        x8 += x9
        other = Int(bitPattern: x8)
    }
    
    func alignToPreviousGranularityMultiple(_ other: inout Int) {
        var x8 = other
        
        guard x8 != 0 else {
            return
        }
        
        var x9 = granularity
        
        guard x9 != 1 else {
            return
        }
        
        let x10 = x8 / x9
        x9 = x8 &- (x10 * x9)
        x8 -= x9
        other = x8
    }
    
    func applyGranularity(to other: Int) -> Int {
        guard value & 1 != 0 else {
            return other
        }
        
        return other * granularity
    }
}

struct _ViewList_TemporarySublistTransform: ~Copyable {
    private var storage: _ViewList_TemporarySublistTransform.Storage
    
    init() {
        storage = .node(nil)
    }
    
    func bindID(_ other: _ViewList_ID) {
        fatalError("TODO")
    }
    
    func apply(sublist: inout _ViewList_Sublist) {
        fatalError("TODO")
    }
    
    var isEmpty: Bool {
        fatalError("TODO")
    }
    
    func withPushedItem<T, U: _ViewList_SublistTransform_Item>(_: U, do: (consuming _ViewList_TemporarySublistTransform) -> T) -> T {
        fatalError("TODO")
    }
    
    func wrapSubgraphs(into storage: inout _ViewList_SublistSubgraphStorage) {
        fatalError("TODO")
    }
    
    func copy() -> _ViewList_SublistTransform {
        fatalError("TODO")
    }
}

extension _ViewList_TemporarySublistTransform {
    fileprivate enum Storage {
        case node(UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?)
        case transform(UnsafeMutablePointer<_ViewList_SublistTransform>)
    }
    
    fileprivate struct ItemNode {
        private var next: UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?
        private var value: _ViewList_SublistTransform_Item
        private var subgraphCount: Int
        private var depth: Int
    }
}

struct _ViewList_SublistTransform {
    private var items: [any _ViewList_SublistTransform_Item]
    private var subgraphCount: Int
}

protocol _ViewList_SublistTransform_Item {
    // TODO
}

enum _ViewList_Node {
    // TODO
}

enum _ViewList_Edit {
    case inserted
    case removed
}

extension _ViewList_ID {
    struct Canonical {
        private var _index: Int32
        private var implicitID: Int32
        private var explicitID: AnyHashable2?
    }
}
