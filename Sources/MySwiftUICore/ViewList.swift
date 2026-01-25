// E479C0E92CDD045BAF2EF653123E2E0B
internal import AttributeGraph

final class _ViewList_SubgraphRelease {
    private let subgraphs: ArraySlice<_ViewList_Subgraph>
    
    @inline(__always)
    fileprivate init(subgraphs: ArraySlice<_ViewList_Subgraph>) {
        self.subgraphs = subgraphs
    }
    
    deinit {
        Update.ensure {
            for subgrah in subgraphs {
                subgrah.refcount &-= 1
                
                if subgrah.refcount == 0 {
                    subgrah.invalidate()
                    
                    let _subgrah = subgrah.subgraph
                    if _subgrah.isValid {
                        _subgrah.willInvalidate(isInserted: true)
                        _subgrah.invalidate()
                    }
                }
            }
        }
    }
}

class _ViewList_Subgraph {
    final let subgraph: Subgraph
    final var refcount: UInt32
    
    init(subgraph: Subgraph) {
        self.refcount = 1
        self.subgraph = subgraph
    }
    
    final func wrapping(_ vistList: ViewList) -> _ViewList_Subgraph {
        fatalError("TODO")
    }
    
    func invalidate() {
        /*
         UnsafeRawPointer(bitPattern: Int(bitPattern: ObjectIdentifier(_ViewList_Subgraph.self)))!
             .advanced(by: 0x68)
             .assumingMemoryBound(to: UnsafeRawPointer.self)
             .pointee
         */
        // nop
    }
}

struct _ViewList_ID: Hashable {
    var _index: Int32
    var implicitID: Int32
    var explicitIDs: [_ViewList_ID.Explicit]
    
    init(implicitID: Int) {
        self._index = 0
        self.explicitIDs = []
        self.implicitID = Int32(implicitID)
    }
    
    init() {
        self._index = 0
        self.implicitID = 0
        self.explicitIDs = []
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: 0)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, reuseID: Int) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: reuseID)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool) {
        bind(explicitID: explicitID, owner: owner, isUnary: isUnary, reuseID: 0)
    }
    
    mutating func bind<H: Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool, reuseID: Int) {
        /*
         owner -> x21
         isUnary -> x22
         reuseID -> x19
         */
        let explicitID = _ViewList_ID.Explicit(
            id: AnyHashable2(explicitID),
            reuseID: reuseID,
            owner: owner,
            isUnary: isUnary
        )
        explicitIDs.append(explicitID)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_index)
        hasher.combine(implicitID)
        fatalError("TODO")
    }
}

extension _ViewList_ID {
    struct Explicit: Equatable {
        let id: AnyHashable2
        let reuseID: Int
        let owner: AnyAttribute
        let isUnary: Bool
    }
}

struct _ViewList_SubgraphElements {
    var base: any _ViewList_Elements
    var subgraphs: _ViewList_SublistSubgraphStorage
    
    @inline(__always)
    init(base: any _ViewList_Elements, subgraphs: _ViewList_SublistSubgraphStorage) {
        self.base = base
        self.subgraphs = subgraphs
    }
}

struct _ViewList_SublistSubgraphStorage {
    var subgraphs: [_ViewList_Subgraph]
    
    var isValid: Bool {
        guard !subgraphs.isEmpty else {
            return true
        }
        
        for subgraph in subgraphs {
            guard subgraph.subgraph.isValid else {
                return false
            }
        }
        
        return true
    }
    
    func retain() -> _ViewList_SubgraphRelease? {
        guard !subgraphs.isEmpty else {
            return nil
        }
        
        // x22
        let count = subgraphs.count
        // x21
        var index = subgraphs.count
        repeat {
            // x23
            let _index = index - 1
            
            let subgraph = subgraphs[_index]
            
            guard
                subgraph.refcount != 0,
                subgraph.subgraph.isValid
            else {
                break
            }
            subgraph.refcount &+= 1
            index = _index
        } while index != 0
        
        guard index != count else {
            return nil
        }
        
        let slice = subgraphs[index..<subgraphs.endIndex]
        return _ViewList_SubgraphRelease(subgraphs: slice)
    }
}

struct _ViewList_Sublist {
    var start: Int
    var count: Int
    var id: _ViewList_ID
    var elements: _ViewList_SubgraphElements
    var traits: ViewTraitCollection
    var list: Attribute<ViewList>?
    
    @inline(__always)
    init(start: Int, count: Int, id: _ViewList_ID, elements: _ViewList_SubgraphElements, traits: ViewTraitCollection, list: Attribute<ViewList>?) {
        self.start = start
        self.count = count
        self.id = id
        self.elements = elements
        self.traits = traits
        self.list = list
    }
}

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
    
    static func emptyViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    func makeAttribute(inputs: _ViewListInputs) -> Attribute<ViewList> {
        // inputs -> x19
        // sp + 0xf8
        let copy_1 = self
        
        switch copy_1.views {
        case .staticList(_):
            // <+184>
            fatalError("TODO")
        case .dynamicList(let viewList, let listModifier):
            // <+64>
            /*
             viewList -> w20
             listModifier - > x19
             */
            
            guard listModifier != nil else {
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
        _ = AnyAttribute.empty
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
        _ = elements
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
    
    static func concat(_ outputs: [_ViewListOutputs], inputs: _ViewListInputs) -> _ViewListOutputs {
        // inputs -> x24
        // return register -> sp + 0x10
        if !outputs.isEmpty {
            // <+60>
            // outputs -> x19 -> sp + 0x18
            let x26 = outputs.count
            var x22: [Attribute<any ViewList>] = []
            var x19 = 0
            var w23 = false
            var x20 = 0
            var x27 = 0
            var x28_index = 0
            var x28: _ViewListOutputs
            // sp
            let firstOutput = outputs[0]
            // inputs -> x24
            var x21: Int
            
            func mergeStatic(from: Int, to: Int) -> _ViewListOutputs {
                /*
                 x2 -> outputs
                 x4 -> inputs
                 */
                fatalError("TODO")
            }
            
            repeat {
                x28 = outputs[x28_index]
                // <+208>
                x21 = x27 &+ 1
                // sp + 0xb0
                let copy_1 = x28
                if !w23 {
                    var x8 = copy_1.staticCount ?? 0
                    let x9 = (copy_1.staticCount == nil) ? 0 : x19
                    x8 &+= x9
                    x19 = x8
                }
                
                // <+252>
                // sp + 0x80
                let copy_2 = copy_1.views
                
                switch copy_2 {
                case .staticList(_):
                    // <+172>
                    // <+188>
                    break
                case .dynamicList(let listAttribute, let listModifier):
                    if x20 < x27 {
                        // <+288>
                        // sp + 0x38
                        let outputs_2 = mergeStatic(from: x20, to: x27)
                        let attribute_1 = outputs_2.makeAttribute(inputs: inputs)
                        x22.append(attribute_1)
                    }
                    
                    // <+384>
                    let attribute_2 = copy_1.makeAttribute(inputs: inputs)
                    x22.append(attribute_2)
                    // <+188>
                    break
                }
                
                // <+188>
                w23 = w23 || (copy_1.staticCount == nil)
                x28_index &+= 1
                x27 = x21
            } while x21 != x26
            
            // <+592>
            let flag: Bool // false -> <+692>, true -> <+936>
            if x20 < x26 {
                // <+600>
                if x20 == 0 {
                    // <+936>
                    flag = true
                } else {
                    // <+604>
                    // sp + 0xb0
                    let outputs_2 = mergeStatic(from: x20, to: x26)
                    let attribute = outputs_2.makeAttribute(inputs: inputs)
                    x22.append(attribute)
                    // <+692>
                    flag = false
                }
            } else {
                // <+692>
                flag = false
            }
            
            if flag {
                // <+936>
                if x26 == 1 {
                    return firstOutput
                } else {
                    // <+1028>
                    // sp + 0x20
                    let elements = MergedElements(outputs: outputs[0..<x26])
                    // x21
                    let views = _ViewListOutputs.Views.staticList(elements)
                    // <+908>
                    return _ViewListOutputs(views, nextImplicitID: x20, staticCount: w23 == true ? nil : x19)
                }
            } else {
                // <+692>
                return _ViewListOutputs.emptyViewList(inputs: inputs)
            }
        } else {
            // <+724>
            let elements = EmptyViewListElements()
            return _ViewListOutputs(.staticList(elements), nextImplicitID: inputs.implicitID, staticCount: 0)
            // <+972>
        }
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
    func applyNodes(from: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, transform: borrowing _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool) -> Bool
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
        return applyNodes(
            from: &index,
            style: style,
            list: list,
            transform: _ViewList_TemporarySublistTransform(),
            to: { index, style, node, transform in
                // $s7SwiftUI8ViewListPAAE13applySublists4from5style4list9transform2toSbSiz_AA01_cD14_IteratorStyleV14AttributeGraph0N0VyAaB_pGSgAA01_cD26_TemporarySublistTransformVSbAA01_cd1_Q0VXEtFSbSiz_AkA01_cD5_NodeOARtXEfU_TA
                return node.applySublists(from: &index, style: style, transform: transform, to: body)
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
    func makeElements(from index: inout Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool)
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
}

extension _ViewList_Elements {
    func makeAllElements(inputs: _ViewInputs, body: @escaping (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        return makeAllElements(inputs: inputs, indirectMap: nil, body: body)
    }
    
    func makeAllElements(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        return withoutActuallyEscaping(body) { escapingClosure in
            var index = 0
            let (outputs, _) = makeElements(from: &index, inputs: inputs, indirectMap: indirectMap) { inputs, transform in
                let outputs = escapingClosure(inputs, transform)
                return (outputs, true)
            }
            
            return outputs
        }
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
        // sp
        let copy_1 = inputs
        
        let view = view.attribute
        guard view != .empty else {
            return _ViewOutputs()
        }
        
        func project<U: View>(type: U.Type) -> _ViewOutputs {
            var casted = Attribute<U>(identifier: view)
            if let indirectMap {
                casted.makeReusable(indirectMap: indirectMap)
            }
            
            return U.makeDebuggableView(view: _GraphValue(casted), inputs: copy_1)
        }
        
        return _openExistential(viewType, do: project)
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
    
    func makeElements(from index: inout Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool) {
        // $s7SwiftUI13UnaryElements33_E479C0E92CDD045BAF2EF653123E2E0BLLV04makeD04from6inputs11indirectMap4bodyAA12_ViewOutputsVSg_SbtSiz_AA01_S6InputsVAA017IndirectAttributeQ0CSgAL_SbtAN_AkNctXEtF
        /*
         _ViewOutputs return pointer -> x0
         index -> x1 -> x19
         inputs -> x2
         indirectMap -> x3 -> x22
         body -> x4 -> x21
         */
        guard index == 0 else {
            return (nil, true)
        }
        
        // <+120>
        // sp + 0x60
        let copy_1 = inputs
        // _ViewOutputs return pointer -> sp + 0x58
        // x23
        let copy_2 = self
        
        return body(copy_1) { [copy_2, indirectMap] inputs in
            // $s7SwiftUI13UnaryElements33_E479C0E92CDD045BAF2EF653123E2E0BLLV04makeD04from6inputs11indirectMap4bodyAA12_ViewOutputsVSg_SbtSiz_AA01_S6InputsVAA017IndirectAttributeQ0CSgAL_SbtAN_AkNctXEtFAkNcfU_TA
            // sp + 0x240
            let copy_3 = inputs
            // sp + 0x2a0
            let copy_4 = copy_2.baseInputs
            // sp + 0x210
            let copy_5 = copy_2.baseInputs
            // sp + 0x180
            let copy_6 = copy_4
            
            if let indirectMap {
                copy_5.makeReusable(indirectMap: indirectMap)
            }
            
            // sp + 0x60
            var copy_7 = copy_3
            // sp + 0x120
            let copy_8 = copy_5
            // sp + 0x180
            let copy_9 = copy_3
            
            copy_7.base.merge(copy_8, ignoringPhase: false)
            
            // sp + 0xc0
            let copy_10 = copy_7
            // sp
            let copy_11 = copy_7
            // sp + 0x180
            let copy_12 = copy_10
            
            return copy_2.body.makeView(inputs: copy_11, indirectMap: indirectMap)
        }
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
        return elements.count
    }
    
    var viewIDs: _ViewList_ID_Views? {
        fatalError("TODO")
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        fatalError("TODO")
    }
    
    func applyNodes(from index: inout Int, style: _ViewList_IteratorStyle, list: Attribute<any ViewList>?, transform: borrowing _ViewList_TemporarySublistTransform, to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        // $s7SwiftUI12BaseViewList33_E479C0E92CDD045BAF2EF653123E2E0BLLV10applyNodes4from5style4list9transform2toSbSiz_AA01_dE14_IteratorStyleV14AttributeGraph0W0VyAA0dE0_pGSgAA01_dE26_TemporarySublistTransformVSbSiz_AlA01_dE5_NodeOATtXEtF
        // sp + 0x88
        let sublist = _ViewList_Sublist(
            start: index,
            count: count(style: style),
            id: _ViewList_ID(implicitID: implicitID),
            elements: _ViewList_SubgraphElements(
                base: elements,
                subgraphs: _ViewList_SublistSubgraphStorage(subgraphs: [])
            ),
            traits: traits,
            list: list
        )
        
        return block(&index, style, .sublist(sublist), transform)
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

@safe struct _ViewList_TemporarySublistTransform: ~Copyable {
    private var storage: _ViewList_TemporarySublistTransform.Storage
    
    init() {
        unsafe storage = unsafe .node(nil)
    }
    
    func bindID(_ other: _ViewList_ID) {
        fatalError("TODO")
    }
    
    func apply(sublist: inout _ViewList_Sublist) {
        // sublist -> x19
        switch storage {
        case .node(let pointer):
            guard let pointer else {
                return
            }
            
            sublist.elements.subgraphs.subgraphs.reserveCapacity(pointer.pointee.subgraphCount)
            pointer.pointee.value.apply(sublist: &sublist)
        case .transform(_):
            // SwiftUI._ViewList_SublistTransform.apply(sublist: inout SwiftUI._ViewList_Sublist)의 inline일 수도 있음
            fatalError("TODO")
        }
    }
    
    var isEmpty: Bool {
        fatalError("TODO")
    }
    
    func withPushedItem<T, U: _ViewList_SublistTransform_Item>(_ item: U, do block: (borrowing _ViewList_TemporarySublistTransform) -> T) -> T {
        let flags = U.flags
        
        switch storage {
        case .node(let node):
            // <+196>
            var subgraphCount: Int
            // x20
            let depth: Int
            if let node {
                subgraphCount = node.pointee.subgraphCount
                depth = node.pointee.depth &+ 1
            } else {
                subgraphCount = 0
                depth = 0
            }
            
            if flags.contains(.graphDependent) {
                subgraphCount &+= 1
            }
            
            var node = _ViewList_TemporarySublistTransform.ItemNode(next: node, value: item, subgraphCount: subgraphCount, depth: depth)
            return withUnsafePointer(to: &node) { pointer in
                var transform = _ViewList_TemporarySublistTransform()
                transform.storage = .node(UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>(mutating: pointer))
                return block(transform)
            }
        case .transform(_):
            // <+120>
            push(item, flags: flags)
            let result = block(self)
            pop(flags: flags)
            return result
        }
    }
    
    func wrapSubgraphs(into storage: inout _ViewList_SublistSubgraphStorage) {
        fatalError("TODO")
    }
    
    func copy() -> _ViewList_SublistTransform {
        fatalError("TODO")
    }
    
    fileprivate func push(_ item: any _ViewList_SublistTransform_Item, flags: _ViewList_SublistTransform_ItemFlags) {
        fatalError("TODO")
    }
    
    fileprivate func pop(flags: _ViewList_SublistTransform_ItemFlags) {
        fatalError("TODO")
    }
}

extension _ViewList_TemporarySublistTransform {
    @unsafe fileprivate enum Storage {
        case node(UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?)
        case transform(UnsafeMutablePointer<_ViewList_SublistTransform>)
    }
    
    @unsafe fileprivate struct ItemNode {
        fileprivate private(set) var next: UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?
        fileprivate private(set) var value: _ViewList_SublistTransform_Item
        fileprivate private(set) var subgraphCount: Int
        fileprivate private(set) var depth: Int
    }
}

struct _ViewList_SublistTransform {
    private var items: [any _ViewList_SublistTransform_Item]
    private var subgraphCount: Int
}

protocol _ViewList_SublistTransform_Item {
    static var flags: _ViewList_SublistTransform_ItemFlags { get }
    func apply(sublist: inout _ViewList_Sublist)
    func bindID(_ id: inout _ViewList_ID)
    func wrapSubgraph(into storage: inout _ViewList_SublistSubgraphStorage)
}

extension _ViewList_SublistTransform_Item {
    static var flags: _ViewList_SublistTransform_ItemFlags {
        return []
    }
    
    func applyIDs(from index: inout Int, style: _ViewList_IteratorStyle, listAttribute: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_ID) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func applySublists(from: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_Sublist) -> Bool) -> Bool {
        fatalError("TODO")
    }
}

enum _ViewList_Node {
    case list(Attribute<any ViewList>?)
    case sublist(_ViewList_Sublist)
    case group(_ViewList_Group)
    case section(_ViewList_Section)
    
    func applySublists(from index: inout Int, style: _ViewList_IteratorStyle, transform: borrowing _ViewList_TemporarySublistTransform, to block: (_ViewList_Sublist) -> Bool) -> Bool {
        /*
         index -> x21
         block -> x23/x27
         style -> x22
         transform -> sp + 0x30
         */
        // sp + 0xd0
        let copy_1 = self
        
        // <+84>
        switch self {
        case .list(_):
            fatalError("TODO")
        case .sublist(let sublist):
            // <+580>
            // sp + 0x40
            var copy_2 = sublist
            let granularity = style.applyGranularity(to: sublist.count)
            // x20
            let offset = index &- granularity
            
            if index >= granularity {
                index = offset
                return true
            }
            
            // <+652>
            transform.apply(sublist: &copy_2)
            let result = block(copy_2)
            _ = consume copy_2
            index = 0
            return result
        case .group(_):
            fatalError("TODO")
        case .section(_):
            fatalError("TODO")
        }
    }
    
    func applySublists(from index: inout Int, transform: borrowing _ViewList_TemporarySublistTransform, to: (_ViewList_Sublist) -> Bool) -> Bool {
        fatalError("TODO")
    }
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

struct _ViewList_SublistTransform_ItemFlags: OptionSet {
    let rawValue: UInt8
    
    static var graphDependent: _ViewList_SublistTransform_ItemFlags {
        return _ViewList_SublistTransform_ItemFlags(rawValue: 1 << 0)
    }
}

struct _ViewList_Group {
    // TODO
}

struct _ViewList_Section {
    // TODO
}

fileprivate struct MergedElements: _ViewList_Elements {
    var outputs: ArraySlice<_ViewListOutputs>
    
    var count: Int {
        var x19 = 0
        
        for output in outputs {
            // sp + 0x68
            let copy_1 = output
            // sp + 0x10
            let copy_2 = copy_1.views
            
            switch copy_2 {
            case .staticList(let elements):
                // <+100>
                x19 &+= elements.count
            case .dynamicList(_, _):
                fatalError()
            }
        }
        
        return x19
    }
    
    func makeElements(
        from index: inout Int,
        inputs: _ViewInputs,
        indirectMap: IndirectAttributeMap?,
        body: (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)
    ) -> (_ViewOutputs?, Bool) {
        /*
         index -> x1 -> sp + 0x18
         indirectMap -> x3 -> sp + 0x20
         body -> x4/x5 -> sp + 0x28/0x30
         */
        // sp + 0x140
        let copy_1 = inputs
        
        // <+80>
        fatalError("TODO")
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
    
    func findElement(at index: Int) -> (_ViewList_Elements, Int)? {
        fatalError("TODO")
    }
}
