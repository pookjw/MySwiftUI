// E479C0E92CDD045BAF2EF653123E2E0B
package import AttributeGraph

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
    final let subgraph: Subgraph // 0x10
    final var refcount: UInt32 // 0x18
    
    init(subgraph: Subgraph) {
        self.refcount = 1
        self.subgraph = subgraph
    }
    
    final func wrapping(_ vistList: ViewList) -> _ViewList_Subgraph {
        assertUnimplemented()
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
    
    @inline(always) // 원래 없음
    final func invalidate(isInserted: Bool) {
        self.refcount &-= 1
        if self.refcount == 0 {
            self.invalidate()
            let subgraph = self.subgraph
            if subgraph.isValid {
                subgraph.willInvalidate(isInserted: isInserted)
                subgraph.invalidate()
            }
        }
    }
}

package struct _ViewList_ID : Hashable {
    private var _index: Int32
    private(set) var implicitID: Int32
    private(set) var explicitIDs: [_ViewList_ID.Explicit]
    
    init(implicitID: Int) {
        self._index = 0
        self.explicitIDs = []
        self.implicitID = Int32(implicitID)
    }
    
    @inline(always) // 원래 없음
    fileprivate init(index: Int32, implicitID: Int32, explicitIDs: [_ViewList_ID.Explicit]) {
        self._index = index
        self.implicitID = implicitID
        self.explicitIDs = explicitIDs
    }
    
    init() {
        self._index = 0
        self.implicitID = 0
        self.explicitIDs = []
    }
    
    mutating func bind<H : Hashable>(explicitID: H, owner: AnyAttribute) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: 0)
    }
    
    mutating func bind<H : Hashable>(explicitID: H, owner: AnyAttribute, reuseID: Int) {
        bind(explicitID: explicitID, owner: owner, isUnary: false, reuseID: reuseID)
    }
    
    mutating func bind<H : Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool) {
        bind(explicitID: explicitID, owner: owner, isUnary: isUnary, reuseID: 0)
    }
    
    mutating func bind<H : Hashable>(explicitID: H, owner: AnyAttribute, isUnary: Bool, reuseID: Int) {
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
    
    package func hash(into hasher: inout Hasher) {
        hasher.combine(_index)
        hasher.combine(implicitID)
        
        for explicitID in explicitIDs {
            explicitID.id.hash(into: &hasher)
            hasher.combine(explicitID.owner)
        }
    }
}

extension _ViewList_ID {
    struct Explicit : Equatable {
        let id: AnyHashable2 // 0x0
        let reuseID: Int // 0x8
        let owner: AnyAttribute // 0x10
        let isUnary: Bool // 0x14
    }
    
    struct ElementCollection : Equatable, RandomAccessCollection {
        var id: _ViewList_ID
        var count: Int
        
        init(id: _ViewList_ID, count: Int) {
            self.id = id
            self.count = count
        }
        
        var startIndex: Int {
            return 0
        }
        
        subscript(index: Int) -> _ViewList_ID {
            return _ViewList_ID(
                index: Int32(index),
                implicitID: self.id.implicitID,
                explicitIDs: self.id.explicitIDs
            )
        }
        
        var endIndex: Int {
            return self.count
        }
    }
}

struct _ViewList_SubgraphElements {
    var base: any _ViewList_Elements
    var subgraphs: _ViewList_SublistSubgraphStorage
    
    @inline(always)
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
    var start: Int // 0x0
    var count: Int // 0x8
    var id: _ViewList_ID // 0x10
    var elements: _ViewList_SubgraphElements // 0x20
    var traits: ViewTraitCollection // 0x50
    var list: Attribute<any ViewList>? // 0x58
    
    func appendViewIDs(into accumulator: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    init(
        start: Int,
        count: Int,
        id: _ViewList_ID,
        elements: _ViewList_SubgraphElements,
        traits: ViewTraitCollection,
        list: Attribute<ViewList>?
    ) {
        self.start = start
        self.count = count
        self.id = id
        self.elements = elements
        self.traits = traits
        self.list = list
    }
}

public struct _ViewListOutputs {
    var views: _ViewListOutputs.Views // 0x0
    var nextImplicitID: Int // 0x30
    var staticCount: Int? // 0x38
    
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
    static func nonEmptyParentViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    package static func emptyViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         inputs -> x20
         return pointer -> x19
         */
        let w27 = inputs.options
        // x23/w22
        let attribute: WeakAttribute<_DisplayList_StableIdentityScope>?
        // sp + 0xa8
        let elements: any _ViewList_Elements
        if !inputs.options.contains(.isNonEmptyParent) {
            // <+64>
            elements = EmptyViewListElements()
            if !inputs.options.contains(.requiresSections) {
                // <+92>
                attribute = nil
                // <+224>
            } else {
                // <+180>
                let _attribute: WeakAttribute<_DisplayList_StableIdentityScope> = inputs.base[_DisplayList_StableIdentityScope.self]
                if _attribute.attribute == nil {
                    attribute = nil
                } else {
                    attribute = _attribute
                }
            }
        } else {
            // <+116>
            return _ViewListOutputs.nonEmptyParentViewList(inputs: inputs)
        }
        
        // <+224>
        let _ = AnyAttribute.empty
        let w26 = inputs.$traits
        let needsDynamicView: Bool // true -> <+280> / false -> <+596>
        if (w26 == nil) && !((w27.contains(.canTransition) && !w27.contains(.disableTransitions)) || (attribute != nil)) {
            // <+256>
            
            switch inputs.contentOffset {
            case .staticCount(let _, let _needsDynamicView):
                // <+272>
                if _needsDynamicView {
                    // <+280>
                    needsDynamicView = true
                } else {
                    // <+596>
                    needsDynamicView = false
                }
            case .dynamic(let _, let _):
                // <+280>
                needsDynamicView = true
            case nil:
                // <+596>
                needsDynamicView = false
            }
        } else {
            needsDynamicView = true
        }
        
        if needsDynamicView {
            // <+280>
            // x24
            let implicitID = inputs.implicitID
            let list = Attribute(
                BaseViewList.Init(
                    elements: elements, // sp + 0x18
                    implicitID: implicitID, // sp + 0x68
                    canTransition: (w27.contains(.canTransition) && !w27.contains(.disableTransitions)), // sp + 0x70
                    stableIDScope: attribute, // sp + 0x74
                    contentOffset: inputs.contentOffset, // sp + 0x80
                    traitKeys: inputs.traitKeys, // sp + 0x98
                    traits: OptionalAttribute(w26)
                )
            )
            
            return _ViewListOutputs(
                .dynamicList(list, nil),
                nextImplicitID: implicitID,
                staticCount: 0
            )
        } else {
            // <+596>
            return _ViewListOutputs(
                .staticList(elements),
                nextImplicitID: inputs.implicitID,
                staticCount: 0
            )
        }
    }
    
    func makeAttribute(inputs: _ViewListInputs) -> Attribute<any ViewList> {
        // inputs -> x19
        // sp + 0xf8
        let copy_1 = views
        
        switch copy_1 {
        case .staticList(let elements):
            // <+184>
            // sp + 0xd0
            let copy_2 = elements
            // sp + 0x58
            let _ = copy_2
            
            // x20
            let options = inputs.options.intersection([.canTransition, .disableTransitions])
            
            // x19, w21
            let scope: WeakAttribute<_DisplayList_StableIdentityScope>?
            if !inputs.base.options.contains(.needsStableDisplayListIDs) {
                // <+280>
                scope = nil
            } else {
                // <+236>
                let attribute = inputs.base[_DisplayList_StableIdentityScope.self]
                if attribute.attribute != nil {
                    scope = attribute
                } else {
                    scope = nil
                }
            }
            
            // <+280>
            var traits = ViewTraitCollection()
            
            if options == .canTransition {
                traits[CanTransitionTraitKey.self] = true
            }
            
            if let scope {
                traits[_DisplayList_StableIdentityScope.self] = scope
            }
            
            let baseViewList = BaseViewList(
                elements: elements,
                implicitID: inputs.implicitID, // sp + 0x38
                traitKeys: ViewTraitKeys(),
                traits: traits
            )
            
            return Attribute(value: baseViewList)
        case .dynamicList(let viewList, let modifier):
            // <+64>
            /*
             viewList -> w20
             modifier - > x19
             */
            
            guard let modifier else {
                return viewList
            }
            
            // <+76>
            // sp + 0x80
            let applyModifiers = _ViewListOutputs.ApplyModifiers(base: viewList, modifier: modifier)
            
            return Attribute(applyModifiers)
        }
    }
    
    func makeAttribute(viewInputs: _ViewInputs) -> Attribute<ViewList> {
        assertUnimplemented()
    }
    
    mutating func multiModifier<T : ViewModifier>(_ value: _GraphValue<T>, inputs: _ViewListInputs) {
        /*
         value -> w22
         inputs -> x23
         */
        // x29 - 0x78
        let views = views
        
        switch views {
        case .staticList(let elements):
            // <+192>
            // sp + 0xd8
            let copy_1 = elements
            // sp + 0x38
            let copy_2 = copy_1
            // x29 - 0xb0
            let copy_3 = inputs.base
            // sp
            let copy_4 = inputs.base
            // sp + 0x60
            let _ = copy_3
            // sp + 0x60
            let modifiedElements = ModifiedElements(base: copy_2, modifier: value.value, baseInputs: copy_4)
            self.views = .staticList(modifiedElements)
        case .dynamicList(let attribute, let modifier):
            // <+64>
            /*
             attribute -> w25
             modifier -> x26
             */
            // sp + 0x60
            let copy_1 = inputs.base
            // x29 - 0xb0
            let copy_2 = copy_1
            
            let listModifier = ModifiedViewList.ListModifier(
                pred: modifier,
                modifierType: T.self,
                modifier: AnyWeakAttribute(value.value.identifier),
                inputs: copy_2
            )
            
            self.views = .dynamicList(attribute, listModifier)
        }
        
        // <+380>
    }
}

extension _ViewListOutputs {
    package static func unaryViewList<Content : View>(view: _GraphValue<Content>, inputs: _ViewListInputs) -> _ViewListOutputs {
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
                flag = false
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
        var inputsImplicitID = inputs.implicitID
        
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
                 from -> x0 -> x23
                 to -> x1
                 outputs -> x2 -> x21
                 inputsImplicitID -> x3 -> x22
                 inputs -> x4 -> x20
                 */
                let x8 = to - from
                // sp + 0x20
                let elements: any _ViewList_Elements
                // x25/w23
                var staticCount: Int?
                
                let views: _ViewListOutputs.Views 
                if x8 == 1 {
                    // <+120>
                    switch outputs[from].views {
                    case .staticList(let _elements):
                        elements = _elements
                    case .dynamicList(_, _):
                        preconditionFailure()
                    }
                    
                    // <+528>
                    staticCount = outputs[from].staticCount
                } else if x8 != 0 {
                    // <+220>
                    // to -> x1 -> x24
                    let mergedElements = MergedElements(outputs: outputs[from..<to])
                    elements = mergedElements
                    
                    if from != to {
                        // <+348>
                        for i in from..<to {
                            // sp + 0x80
                            let output = mergedElements.outputs[i]
                            
                            if let _staticCount = output.staticCount {
                                // <+440>
                                staticCount = (staticCount ?? 0) + _staticCount
                            } else {
                                staticCount = nil
                                break
                            }
                        }
                        
                        // <+528>
                    } else {
                        staticCount = 0
                        // <+528>
                    }
                } else {
                    // <+88>
                    elements = EmptyViewListElements()
                    staticCount = 0
                    // <+528>
                }
                
                // <+528>
                // sp + 0x58
                let copy_1 = elements
                // inputsImplicitID -> x22 -> x26
                let x24 = inputs.options.intersection([.canTransition, .disableTransitions])
                // x21/w27
                let scope: WeakAttribute<_DisplayList_StableIdentityScope>?
                if inputs.base.options.contains(.needsStableDisplayListIDs) {
                    // <+572>
                    let _scope = inputs[_DisplayList_StableIdentityScope.self]
                    if _scope.projectedValue != nil {
                        scope = _scope
                    } else {
                        scope = nil
                    }
                    // <+616>
                } else {
                    // <+560>
                    scope = nil
                    // <+616>
                }
                
                // <+616>
                var list = BaseViewList(
                    elements: copy_1,
                    implicitID: inputsImplicitID,
                    traitKeys: ViewTraitKeys(),
                    traits: ViewTraitCollection()
                )
                
                if x24 == .canTransition {
                    list.traits[CanTransitionTraitKey.self] = true
                }
                
                if let scope {
                    list.traits[_DisplayList_StableIdentityScope.self] = scope
                }
                
                // <+748>
                let listAttribute = Attribute(value: list as (any ViewList))
                inputsImplicitID &+= 1
                
                return _ViewListOutputs(
                    .dynamicList(listAttribute, nil),
                    nextImplicitID: inputsImplicitID,
                    staticCount: staticCount
                )
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
                case .dynamicList(let _, let _):
                    if x20 >= x27 {
                    } else {
                        // <+288>
                        // sp + 0x38
                        let outputs_2 = mergeStatic(from: x20, to: x27)
                        let attribute_1 = outputs_2.makeAttribute(inputs: inputs)
                        x22.append(attribute_1)
                    }
                    
                    // <+384>
                    let attribute_2 = copy_1.makeAttribute(inputs: inputs)
                    x22.append(attribute_2)
                    x20 = x21
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
                    return _ViewListOutputs(views, nextImplicitID: inputsImplicitID, staticCount: w23 == true ? nil : x19)
                }
            } else {
                // <+692>
                let count = x22.count
                if count == 1 {
                    // <+764>
                    x20 = inputsImplicitID
                    return _ViewListOutputs(
                        .dynamicList(x22[0], nil),
                        nextImplicitID: x20,
                        staticCount: x19
                    )
                } else if count != 0 {
                    // <+772>
                    // x22 -> sp + 0xb0
                    let rule = _ViewList_Group.Init(lists: x22)
                    // x21
                    let attribute = Attribute(rule)
                    x20 = inputsImplicitID
                    return _ViewListOutputs(
                        .dynamicList(attribute, nil),
                        nextImplicitID: x20,
                        staticCount: w23 == true ? nil : x19
                    )
                } else {
                    return _ViewListOutputs.emptyViewList(inputs: inputs)
                }
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
        case dynamicList(Attribute<any ViewList>, _ViewListOutputs.ListModifier?)
    }
    
    class ListModifier {
        init() {}
        
        func apply(to list: inout ViewList) {
        }
    }
    
    fileprivate struct ApplyModifiers : Rule, AsyncAttribute {
        @Attribute var base: any ViewList
        let modifier: _ViewListOutputs.ListModifier
        
        var value: ViewList {
            var list = base
            modifier.apply(to: &list)
            return list
        }
    }
}

@available(*, unavailable)
extension _ViewListOutputs : Sendable {
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
    func firstOffset<T : Hashable>(forID: T, style: _ViewList_IteratorStyle) -> Int?
    func print(into: inout SExpPrinter)
}

extension ViewList {
    var count: Int {
        return self.count(style: _ViewList_IteratorStyle(granularity: 1))
    }
    
    func applyIDs(from index: inout Int, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_ID) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    func applySublists(from index: inout Int, list: Attribute<ViewList>?, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        applySublists(from: &index, style: _ViewList_IteratorStyle(granularity: 1), list: list, to: body)
    }
    
    var allViewIDs: _ViewList_ID_Views {
        assertUnimplemented()
    }
    
    func applyIDs(from: inout Int, listAttribute: Attribute<ViewList>?, to body: (_ViewList_ID) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    func firstOffset(of: _ViewList_ID.Canonical) -> Int? {
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    func applyIDs(from index: inout Int, style: _ViewList_IteratorStyle, listAttribute: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_ID) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    var isEmpty: Bool {
        assertUnimplemented()
    }
    
    var estimatedCount: Int {
        assertUnimplemented()
    }
    
    func applySublists(from index: inout Int, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        return self.applyNodes(
            from: &index,
            style: _ViewList_IteratorStyle(granularity: 1),
            list: list,
            transform: transform,
            to: { index, style, node, transform in
                // $s7SwiftUI8ViewListPAAE13applySublists4from5style4list9transform2toSbSiz_AA01_cD14_IteratorStyleV14AttributeGraph0N0VyAaB_pGSgAA01_cD26_TemporarySublistTransformVSbAA01_cd1_Q0VXEtFSbSiz_AkA01_cD5_NodeOARtXEfU_TA
                node.applySublists(
                    from: &index,
                    style: style,
                    transform: transform,
                    to: body
                )
            }
        )
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
        assertUnimplemented()
    }
    
    func applySublists(from index: inout Int, to body: (_ViewList_Sublist) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    func applyIDs(from: inout Int, listAttribute: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to body: (_ViewList_ID) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    func firstOffset(of: _ViewList_ID.Canonical, style: _ViewList_IteratorStyle) -> Int? {
        assertUnimplemented()
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
        var index = index
        return self.makeElements(from: &index, inputs: inputs, indirectMap: indirectMap) { inputs, transform in
            // $s7SwiftUI18_ViewList_ElementsPAAE14makeOneElement2at6inputs11indirectMap4bodyAA01_C7OutputsVSgSi_AA01_C6InputsVAA017IndirectAttributeL0CSgAkM_AjMctXEtFA2kM_AjMctcXEfU_AK_SbtAM_AjMctXEfU_TA
            return (body(inputs, transform), false)
        }.0
    }
    
    func makeOneElement(at index: Int, inputs: _ViewInputs, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? {
        assertUnimplemented()
    }
}

class _ViewList_ID_Views : Equatable, RandomAccessCollection {
    final let isDataDependent: Bool
    
    init(isDataDependent: Bool) {
        self.isDataDependent = isDataDependent
    }
    
    final var startIndex: Int {
        return 0
    }
    
    func withDataDependency() -> _ViewList_ID_Views {
        if self.isDataDependent {
            return self
        } else {
            return _ViewList_ID_Views(isDataDependent: true)
        }
    }
    
    static func == (lhs: _ViewList_ID_Views, rhs: _ViewList_ID_Views) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
    var endIndex: Int {
        preconditionFailure() // abstract
    }
    
    subscript(index: Int) -> _ViewList_ID {
        preconditionFailure() // abstract
    }
    
    func isEqual(to other: _ViewList_ID_Views) -> Bool {
        preconditionFailure() // abstract
    }
}

extension _ViewList_ID {
    final class _Views<T : Collection> : _ViewList_ID_Views where T.Index == Int {
        let base: T
        
        init(_ base: T, isDataDependent: Bool) {
            self.base = base
            super.init(isDataDependent: isDataDependent)
        }
        
        override var endIndex: Int {
            return self.base.endIndex
        }
        
        override subscript(index: Int) -> _ViewList_ID {
            assertUnimplemented()
        }
        
        override func isEqual(to other: _ViewList_ID_Views) -> Bool {
            assertUnimplemented()
        }
    }
    
    final class JoinedViews : _ViewList_ID_Views {
        let views: [(views: _ViewList_ID_Views, endOffset: Int)]
        let count: Int
        
        init(_ views: [_ViewList_ID_Views], isDataDependent: Bool) {
            /*
             self -> x20 -> x19
             views -> x0 -> x22
             isDataDependent -> w1 -> sp + 0xc
             */
            var _views: [(views: _ViewList_ID_Views, endOffset: Int)] = []
            var count = 0
            
            for view in views {
                let endIndex = view.endIndex
                assert(endIndex >= 0)
                assert(view.endIndex >= endIndex)
                count += view.endIndex
                _views.append((views: view, endOffset: count))
            }
            
            self.views = _views
            self.count = count
            super.init(isDataDependent: isDataDependent)
        }
        
        override subscript(index: Int) -> _ViewList_ID {
            assertUnimplemented()
        }
        
        override func isEqual(to other: _ViewList_ID_Views) -> Bool {
            assertUnimplemented()
        }
        
        override var endIndex: Int {
            assertUnimplemented()
        }
    }
}

fileprivate protocol UnaryViewGenerator {
    func tryToReuse(by other: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
    func makeView(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?) -> _ViewOutputs
}

fileprivate struct TypedUnaryViewGenerator : UnaryViewGenerator {
    private let view: AnyWeakAttribute
    private let viewType: any View.Type
    
    @inline(always)
    init(view: AnyWeakAttribute, viewType: any View.Type) {
        self.view = view
        self.viewType = viewType
    }
    
    func tryToReuse(by other: TypedUnaryViewGenerator, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
    
    func makeView(inputs: _ViewInputs, indirectMap: IndirectAttributeMap?) -> _ViewOutputs {
        // sp
        let copy_1 = inputs
        
        guard let view = view.attribute else {
            return _ViewOutputs()
        }
        
        func project<U : View>(type: U.Type) -> _ViewOutputs {
            var casted = Attribute<U>(identifier: view)
            if let indirectMap {
                casted.makeReusable(indirectMap: indirectMap)
            }
            
            return U.makeDebuggableView(view: _GraphValue(casted), inputs: copy_1)
        }
        
        return _openExistential(viewType, do: project)
    }
}

fileprivate struct UnaryElements<T : UnaryViewGenerator>: _ViewList_Elements {
    private(set) var body: T
    private(set) var baseInputs: _GraphInputs
    
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
            let _ = copy_4
            
            if let indirectMap {
                copy_5.makeReusable(indirectMap: indirectMap)
            }
            
            // sp + 0x60
            var copy_7 = copy_3
            // sp + 0x120
            let copy_8 = copy_5
            // sp + 0x180
            let _ = copy_3
            
            copy_7.base.merge(copy_8, ignoringPhase: false)
            
            // sp + 0xc0
            let copy_10 = copy_7
            // sp
            let copy_11 = copy_7
            // sp + 0x180
            let _ = copy_10
            
            return copy_2.body.makeView(inputs: copy_11, indirectMap: indirectMap)
        }
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
}

fileprivate struct BaseViewList : CustomStringConvertible {
    private(set) var elements: any _ViewList_Elements
    private(set) var implicitID: Int
    private(set) var traitKeys: ViewTraitKeys?
    var traits: ViewTraitCollection
    
    var description: String {
        assertUnimplemented()
    }
}

extension BaseViewList : ViewList {
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        assertUnimplemented()
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        let count = self.elements.count
        return style.applyGranularity(to: count)
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        let count = self.elements.count
        return style.applyGranularity(to: count)
    }
    
    var viewIDs: _ViewList_ID_Views? {
        return _ViewList_ID._Views(
            _ViewList_ID.ElementCollection(
                id: _ViewList_ID(implicitID: self.implicitID),
                count: self.elements.count
            ),
            isDataDependent: false
        )
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<any ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        // $s7SwiftUI12BaseViewList33_E479C0E92CDD045BAF2EF653123E2E0BLLV10applyNodes4from5style4list9transform2toSbSiz_AA01_dE14_IteratorStyleV14AttributeGraph0W0VyAA0dE0_pGSgAA01_dE26_TemporarySublistTransformVSbSiz_AlA01_dE5_NodeOATtXEtF
        /*
         self -> x20 -> x24
         index -> x0 -> x19
         style -> x1 -> x21
         list -> x2 -> x23
         transform -> x3 -> x27/w28
         block -> x4/x5 -> sp + 0x8 / x22
         */
        // x20
        let count = count(style: style)
        // x8
        var x8 = style.applyGranularity(to: count)
        x8 = index &- x8
        
        guard x8 < 0 else {
            index = x8
            return true
        }
        
        let sublist = _ViewList_Sublist(
            start: index,
            count: count,
            id: _ViewList_ID(implicitID: implicitID),
            elements: _ViewList_SubgraphElements(
                base: elements,
                subgraphs: _ViewList_SublistSubgraphStorage(subgraphs: [])
            ),
            traits: traits,
            list: list
        )
        
        let result = block(&index, style, .sublist(sublist), transform)
        index = 0
        return result
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
}

extension BaseViewList {
    fileprivate struct Init : CustomStringConvertible, Rule, AsyncAttribute {
        let elements: any _ViewList_Elements
        let implicitID: Int
        let canTransition: Bool
        let stableIDScope: WeakAttribute<_DisplayList_StableIdentityScope>?
        let contentOffset: ViewContentOffset?
        let traitKeys: ViewTraitKeys?
        @OptionalAttribute var traits: ViewTraitCollection?
        
        var description: String {
            assertUnimplemented()
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

struct _ViewList_IteratorStyle : Equatable {
    private var value: UInt
    
    var granularity: Int {
        get {
            return Int(bitPattern: value &>> 1)
        }
        set {
            value = (value & 1) | ((UInt(bitPattern: newValue) & ((1 &<< 63) - 1)) &<< 1)
        }
        _modify {
            assertUnimplemented()
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
            assertUnimplemented()
        }
    }
    
    @inline(always)
    init(granularity: Int) {
        value = UInt(bitPattern: granularity) &<< 1
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

@safe struct _ViewList_TemporarySublistTransform : ~Copyable {
    fileprivate private(set) var storage: _ViewList_TemporarySublistTransform.Storage
    
    init() {
        unsafe self.storage = unsafe .node(nil)
    }
    
    @inline(always) // 원래 없음
    fileprivate init(storage: _ViewList_TemporarySublistTransform.Storage) {
        unsafe self.storage = storage
    }
    
    func bindID(_ other: inout _ViewList_ID) {
        switch self.storage {
        case .node(let pointer):
            // <+84>
            var ptr = pointer
            
            while let _ptr = ptr {
                _ptr.pointee.value.bindID(&other)
                ptr = _ptr.pointee.next
            }
        case .transform(let pointer):
            // <+44>
            pointer.pointee.bindID(&other)
        }
    }
    
    func apply(sublist: inout _ViewList_Sublist) {
        // sublist -> x19
        switch unsafe storage {
        case .node(let pointer):
            // <+200>
            guard let pointer = unsafe pointer else {
                return
            }
            
            unsafe sublist.elements.subgraphs.subgraphs.reserveCapacity(pointer.pointee.subgraphCount)
            
            var next: _ViewList_TemporarySublistTransform.ItemNode? = unsafe pointer.pointee
            while let _next = unsafe next {
                unsafe _next.value.apply(sublist: &sublist)
                unsafe next = unsafe _next.next?.pointee
            }
        case .transform(let pointer):
            // inlined
            pointer.pointee.apply(sublist: &sublist)
        }
    }
    
    var isEmpty: Bool {
        switch self.storage {
        case .node(let pointer):
            return pointer == nil
        case .transform(let pointer):
            return pointer.pointee.isEmpty
        }
    }
    
    func withPushedItem<T, U : _ViewList_SublistTransform_Item>(_ item: U, do block: (borrowing _ViewList_TemporarySublistTransform) -> T) -> T {
        let flags = U.flags
        
        switch unsafe storage {
        case .node(let node):
            // <+196>
            var subgraphCount: Int
            // x20
            let depth: Int
            if let node = unsafe node {
                subgraphCount = unsafe node.pointee.subgraphCount
                depth = unsafe node.pointee.depth &+ 1
            } else {
                subgraphCount = 0
                depth = 0
            }
            
            if flags.contains(.graphDependent) {
                subgraphCount &+= 1
            }
            
            var node = unsafe _ViewList_TemporarySublistTransform.ItemNode(next: node, value: item, subgraphCount: subgraphCount, depth: depth)
            return unsafe withUnsafeMutablePointer(to: &node) { pointer in
                let transform = _ViewList_TemporarySublistTransform(
                    storage: .node(pointer)
                )
                
                return block(transform)
            }
        case .transform(let sublist):
            // <+120>
            sublist.pointee.push(item, flags: flags)
            let result = block(self)
            sublist.pointee.items.removeLast()
            return result
        }
    }
    
    func wrapSubgraphs(into storage: inout _ViewList_SublistSubgraphStorage) {
        switch self.storage {
        case .node(let pointer):
            // <+200>
            if let pointer {
                // <+204>
                storage.subgraphs.reserveCapacity(pointer.pointee.subgraphCount)
                
                var ptr: UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>? = pointer
                while let _ptr = ptr {
                    _ptr.pointee.value.wrapSubgraph(into: &storage)
                    ptr = _ptr.pointee.next
                }
            } else {
                // <+292>
                storage.subgraphs.reserveCapacity(0)
            }
        case .transform(let pointer):
            // <+48>
            storage.subgraphs.reserveCapacity(pointer.pointee.subgraphCount)
            
            for item in pointer.pointee.items {
                item.wrapSubgraph(into: &storage)
            }
        }
    }
    
    func copy() -> _ViewList_SublistTransform {
        switch self.storage {
        case .node(let pointer):
            // <+68>
            var transform = _ViewList_SublistTransform()
            
            var ptr = pointer
            while let unwrapped = ptr {
                // sp + 0x10
                transform.push(unwrapped.pointee.value, flags: [])
                ptr = unwrapped.pointee.next
            }
            
            transform.items.reverse()
            return transform
        case .transform(let pointer):
            // <+40>
            let transform = pointer.pointee
            return _ViewList_SublistTransform(
                items: transform.items,
                subgraphCount: transform.subgraphCount
            )
        }
    }
}

extension _ViewList_TemporarySublistTransform {
    @unsafe fileprivate enum Storage {
        case node(UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?)
        case transform(UnsafeMutablePointer<_ViewList_SublistTransform>)
    }
    
    @unsafe fileprivate struct ItemNode {
        fileprivate private(set) var next: UnsafeMutablePointer<_ViewList_TemporarySublistTransform.ItemNode>?
        fileprivate private(set) var value: any _ViewList_SublistTransform_Item
        fileprivate private(set) var subgraphCount: Int
        fileprivate private(set) var depth: Int
    }
}

struct _ViewList_SublistTransform {
    var items: [any _ViewList_SublistTransform_Item] = []
    fileprivate private(set) var subgraphCount: Int = 0
    
    init() {
    }
    
    @inline(always) // 원래 없음
    fileprivate init(items: [any _ViewList_SublistTransform_Item], subgraphCount: Int) {
        self.items = items
        self.subgraphCount = subgraphCount
    }
    
    var isEmpty: Bool {
        return self.items.isEmpty
    }
    
    func apply(sublist: inout _ViewList_Sublist) {
        /*
         sublist -> x0 -> x19
         */
        // x24
        let items = self.items
        sublist.elements.subgraphs.subgraphs.reserveCapacity(self.subgraphCount)
        
        for item in items {
            item.apply(sublist: &sublist)
        }
    }
    
    func bindID(_ listID: inout _ViewList_ID) {
        for item in self.items {
            item.bindID(&listID)
        }
    }
    
    func wrapSubgraphs(into storage: inout _ViewList_SublistSubgraphStorage) {
        let items = self.items
        storage.subgraphs.reserveCapacity(self.subgraphCount)
        
        for item in items {
            item.wrapSubgraph(into: &storage)
        }
    }
    
    mutating func withTemporaryTransform<T>(do block: (consuming _ViewList_TemporarySublistTransform) -> T) -> T {
        return withUnsafeMutablePointer(to: &self) { pointer in
            // $s7SwiftUI26_ViewList_SublistTransformV013withTemporaryF02doxxAA01_cd1_heF0VXE_tlFxSpyACGXEfU_TA
            return block(_ViewList_TemporarySublistTransform(storage: .transform(pointer)))
        }
    }
    
    fileprivate mutating func push(
        _ item: any _ViewList_SublistTransform_Item,
        flags: _ViewList_SublistTransform_ItemFlags
    ) {
        self.items.append(item)
        
        var subgraphCount = self.subgraphCount
        subgraphCount &+= flags.contains(.graphDependent) ? 1 : 0
        self.subgraphCount = subgraphCount
    } 
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
        assertUnimplemented()
    }
    
    func applySublists(from: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_Sublist) -> Bool) -> Bool {
        assertUnimplemented()
    }
}

enum _ViewList_Node {
    case list(any ViewList, Attribute<any ViewList>?)
    case sublist(_ViewList_Sublist)
    case group(_ViewList_Group)
    case section(_ViewList_Section)
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        /*
         self -> x20
         index -> x0 -> x19
         style -> x1 -> x21
         transform -> x2 -> x27/w25
         block -> x3/x4 -> sp + 0x10 / sp + 0x18
         */
        // x29 - 0xc0
        let copy_1 = self
        
        switch copy_1 {
        case .list(let list, let attribute):
            // <+80>
            return list.applyNodes(
                from: &index,
                style: style,
                list: attribute,
                transform: transform,
                to: block
            )
        case .sublist(let sublist):
            // <+380>
            // sp + 0x80
            let copy_2 = sublist
            var count = copy_2.count
            style.alignToPreviousGranularityMultiple(&count)
            
            let x20 = index &- count
            if x20 >= 0 {
                return true
            }
            
            // <+456>
            // sp + 0x20
            let copy_3 = copy_2
            return block(
                &index,
                style,
                .sublist(copy_3),
                transform
            )
        case .group(let group):
            // <+192>
            return group.applyNodes(
                from: &index,
                style: style,
                transform: transform,
                to: block
            )
        case .section(let section):
            // <+540>
            if section.isHierarchical {
                // <+556>
                let list = section.base.lists[0]
                return list.list.applyNodes(
                    from: &index,
                    style: style,
                    list: list.attribute,
                    transform: transform,
                    to: block
                )
            } else {
                // <+732>
                for list in section.base.lists {
                    let result = list.list.applyNodes(
                        from: &index,
                        style: style,
                        list: list.attribute,
                        transform: transform,
                        to: block
                    )
                    
                    guard result else {
                        return false
                    }
                }
                
                return true
            }
        }
    }
    
    func applyNodes(
        from index: inout Int,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        assertUnimplemented()
    }
    
    func applyIDs(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (_ViewList_ID) -> Bool
    ) -> Bool {
        assertUnimplemented()
    }
    
    func applySublists(from index: inout Int, style: _ViewList_IteratorStyle, transform: borrowing _ViewList_TemporarySublistTransform, to block: (_ViewList_Sublist) -> Bool) -> Bool {
        /*
         index -> x21
         block -> x23/x27
         style -> x22
         transform -> sp + 0x30
         */
        // sp + 0xd0
        let _ = self
        
        // <+84>
        switch self {
        case .list(_):
            // <+100>
            assertUnimplemented()
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
        case .group(let group):
            // <+244>
            // group -> x12 -> sp + 0x18
            // index -> x26
            // inlined
            return group.applyNodes(from: &index, style: style, transform: transform) { index, style, node, transform in
                return node.applySublists(from: &index, style: style, transform: transform, to: block)
            }
        case .section(_):
            // <+712>
            assertUnimplemented()
        }
    }
    
    func applySublists(from index: inout Int, transform: borrowing _ViewList_TemporarySublistTransform, to: (_ViewList_Sublist) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    func firstOffset<T : Hashable>(forID: T, style: _ViewList_IteratorStyle) -> Int? {
        assertUnimplemented()
    }
}

enum _ViewList_Edit {
    case inserted
    case removed
}

extension _ViewList_ID {
    package struct Canonical : Hashable {
        private(set) var _index: Int32
        private(set) var implicitID: Int32
        private(set) var explicitID: AnyHashable2?
    }
}

struct _ViewList_SublistTransform_ItemFlags : OptionSet {
    let rawValue: UInt8
    
    static var graphDependent: _ViewList_SublistTransform_ItemFlags {
        return _ViewList_SublistTransform_ItemFlags(rawValue: 1 << 0)
    }
}

struct _ViewList_Group : ViewList, CustomDebugStringConvertible {
    var lists: [(list: any ViewList, attribute: Attribute<ViewList>)]
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        guard !lists.isEmpty else {
            return 0
        }
        
        var count = 0
        for list in lists {
            count += list.list.count(style: style)
        }
        
        return count
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func applyNodes(from index: inout Int, style: _ViewList_IteratorStyle, transform: borrowing _ViewList_TemporarySublistTransform, to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        for value in lists {
            let result = value.list.applyNodes(from: &index, style: style, list: value.attribute, transform: transform, to: block)
            guard result else {
                return false
            }
        }
        
        return true
    }
    
    func applyIDs(from: inout Int, style: _ViewList_IteratorStyle, transform: borrowing _ViewList_TemporarySublistTransform, to: (_ViewList_ID) -> Bool) -> Bool {
        assertUnimplemented()
    }
    
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        assertUnimplemented()
    }
    
    var traitKeys: ViewTraitKeys? {
        let lists = self.lists
        var results = ViewTraitKeys()
        
        guard !lists.isEmpty else {
            return results
        }
        
        for list in lists {
            guard let keys = list.list.traitKeys else {
                return nil
            }
            
            results.formUnion(keys)
        }
        
        return results
    }
    
    var viewIDs: _ViewList_ID_Views? {
        // sp + 0x58 / x19
        var array: [_ViewList_ID_Views] = []
        // w25
        var isDataDependent = false
        
        for list in self.lists {
            guard let viewIDs = list.list.viewIDs else {
                return nil
            }
            
            guard !viewIDs.isEmpty else {
                continue
            }
            
            array.append(viewIDs)
            
            if !isDataDependent {
                isDataDependent = viewIDs.isDataDependent
            }
        }
        
        // <+328>
        let count = array.count
        
        if count == 1 {
            // <+484>
            return array[0]
        } else if count != 0 {
            // <+416>
            return _ViewList_ID.JoinedViews(array, isDataDependent: isDataDependent)
        } else {
            // <+356>
            return _ViewList_ID._Views(
                EmptyCollection<_ViewList_ID>(),
                isDataDependent: false
            )
        }
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        return block(&index, style, .group(self), transform)
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
    
    var traits: ViewTraitCollection {
        return ViewTraitCollection()
    }
}

extension _ViewList_Group {
    struct Init : Rule, AsyncAttribute, CustomStringConvertible {
        fileprivate(set) var lists: [Attribute<any ViewList>]
        
        var value: ViewList {
            // 실제로는 $s14AttributeGraph0A0VyACyxGqd__c5ValueQyd__RszAA4RuleRd__lufcADSPyqd__GXEfU_ySv_So11AGAttributeatcyXEfU_ySv_AJtcfu_7SwiftUI8ViewList_p_AK01_hI6_GroupV4InitVTt1g5가 불림
            // lists -> x23
            var result = _ViewList_Group(lists: [])
            result.lists.reserveCapacity(lists.count)
            
            for list in lists {
                result.lists.append((list: list.value, attribute: list))
            }
            
            return result
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
}

struct _ViewList_Section : ViewList {
    var id: UInt32 // 0x0
    var base: _ViewList_Group // 0x8
    var traits: ViewTraitCollection // 0x10
    var isHierarchical: Bool // 0x18
    
    func appendViewIDs(into accumulator: inout HeterogeneousViewIDsAccumulator) {
        /*
         self -> x20
         accumulator -> x0 -> x19
         */
        if self.isHierarchical {
            // <+48>
            self.header.list.appendViewIDs(into: &accumulator)
        } else {
            // <+140>
            for list in self.base.lists {
                list.list.appendViewIDs(into: &accumulator)
            }
        }
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        /*
         self -> x20
         style -> x0 -> x24
         */
        if self.isHierarchical {
            // <+48>
            var style = style
            style.applyGranularity = (style.granularity != 1)
            return self.header.list.count(style: style)
        } else {
            // <+152>
            // x19
            var count = self.content.list.count(style: style)
            // inlined
            style.alignToNextGranularityMultiple(&count)
            // <+300>
            count += self.header.list.count(style: style)
            count += self.footer.list.count(style: style)
            
            return count
        }
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        if self.isHierarchical {
            // <+48>
            return self.base.lists.first!.list.estimatedCount(style: style)
        } else {
            // <+140>
            var count = self.content.list.estimatedCount(style: style)
            // inlined
            style.alignToNextGranularityMultiple(&count)
            count += self.header.list.estimatedCount(style: style)
            count += self.footer.list.estimatedCount(style: style)
            
            return count
        }
    }
    
    var header: (list: ViewList, attribute: Attribute<any ViewList>) {
        return self.base.lists[0]
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, _ViewList_Section.Info, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        /*
         self -> x20
         index -> x0 -> x24
         style -> x1 -> x29 - 0xd0
         transform -> x2 -> x23/w25
         block -> x3/x4 -> x29 - 0xe0
         */
        style.alignToPreviousGranularityMultiple(&index)
        // <+116>
        assertUnimplemented()
    }
    
    func firstOffset<T : Hashable>(forID: T, style: _ViewList_IteratorStyle) -> Int? {
        assertUnimplemented()
    }
    
    var content: (list: any ViewList, attribute: Attribute<any ViewList>) {
        return self.base.lists[1]
    }
    
    var footer: (list: any ViewList, attribute: Attribute<any ViewList>) {
        return self.base.lists[2]
    }
    
    var traitKeys: ViewTraitKeys? {
        return self.base.traitKeys
    }
    
    var viewIDs : _ViewList_ID_Views? {
        if self.isHierarchical {
            // <+36>
            return self.content.list.viewIDs
        } else {
            // <+132>
            return self.base.viewIDs
        }
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<any ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        // $s7SwiftUI17_ViewList_SectionV10applyNodes4from5style4list9transform2toSbSiz_AA01_cD14_IteratorStyleV14AttributeGraph0O0VyAA0cD0_pGSgAA01_cD26_TemporarySublistTransformVSbSiz_AkA01_cD5_NodeOAStXEtF
        return block(
            &index,
            style,
            .section(self),
            transform
        )
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        return self.base.edit(forID: forID, since: since)
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
}

extension _ViewList_Section {
    struct Info {
        var id: UInt32
        var isHeader: Bool
        var isFooter: Bool
    }
}

fileprivate struct MergedElements : _ViewList_Elements {
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
         왜인지 모르겠으나 self -> x29 (sp + 0x1e0)
         return pointer -> x0 -> sp + 0x10
         index -> x1 -> sp + 0x18
         indirectMap -> x3 -> sp + 0x20
         body -> x4/x5 -> sp + 0x28/0x30
         outputs.start -> x8
         outputs.end << 1 -> x9
         */
        // sp + 0x140
        let copy_1 = inputs
        // x22
        let preferencesKeys = inputs.preferences.keys
        
        // <+80>
        // sp + 0x38
        var results: [_ViewOutputs] = []
        var w23 = true
        // x28
        r1: for output in outputs {
            // sp + 0xd8
            let copy_2 = output
            // <+216>
            // sp + 0x40
            let copy_3 = copy_2.views
            
            switch copy_3 {
            case .staticList(let elements):
                // <+240>
                // sp + 0xb0
                let copy_4 = elements
                // sp + 0x40
                let copy_5 = copy_1
                // sp + 0xa0
                let (output, x27): (_ViewOutputs?, Bool) = copy_4.makeElements(from: &index, inputs: copy_5, indirectMap: indirectMap, body: body)
                
                guard let output else {
                    continue r1
                }
                
                results.append(output)
                w23 = x27
                
                guard w23 else {
                    break r1
                }
            case .dynamicList(_, _):
                fatalError()
            }
        }
        
        // <+116>
        // x24
        let count = results.count
        if count == 1 {
            // <+540>
            return (results[0], w23)
        } else if count != 0 {
            // <+576>
            // w23 -> sp + 0x30
            // sp + 0x40
            var array: [PreferencesOutputs] = []
            array.reserveCapacity(count)
            for result in results {
                array.append(result.preferences)
            }
            
            // <+724>
            // sp + 0x40
            var visitor = MultiPreferenceCombinerVisitor(outputs: array, result: PreferencesOutputs())
            for key in preferencesKeys {
                key.visitKey(&visitor)
            }
            
            // <+820>
            let result = _ViewOutputs(preferences: visitor.result, layoutComputer: OptionalAttribute())
            return (result, w23)
        } else {
            return (nil, w23)
        }
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
    
    func findElement(at index: Int) -> (_ViewList_Elements, Int)? {
        assertUnimplemented()
    }
}

fileprivate struct ModifiedElements : _ViewList_Elements {
    let base: _ViewList_Elements
    let modifier: AnyWeakAttribute
    let modifierType: any ViewModifier.Type
    let baseInputs: _GraphInputs
    
    @inline(always)
    init(base: _ViewList_Elements, modifier: AnyWeakAttribute, modifierType: any ViewModifier.Type, baseInputs: _GraphInputs) {
        self.base = base
        self.modifier = modifier
        self.modifierType = modifierType
        self.baseInputs = baseInputs
    }
    
    init<T : ViewModifier>(base: _ViewList_Elements, modifier: Attribute<T>, baseInputs: _GraphInputs) {
        self.base = base
        self.modifier = AnyWeakAttribute(modifier.identifier)
        self.modifierType = T.self
        self.baseInputs = baseInputs
    }
    
    var count: Int {
        return base.count
    }
    
    func makeElements(
        from index: inout Int,
        inputs: _ViewInputs,
        indirectMap: IndirectAttributeMap?,
        body: (_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool)
    {
        // $s7SwiftUI16ModifiedElements33_E479C0E92CDD045BAF2EF653123E2E0BLLVAA010_ViewList_D0A2aEP04makeD04from6inputs11indirectMap4bodyAA01_M7OutputsVSg_SbtSiz_AA01_M6InputsVAA017IndirectAttributeS0CSgAN_SbtAP_AmPctXEtFTW
        /*
         self -> x23
         index -> x21
         inputs -> x20
         */
        return withoutActuallyEscaping(body) { escapingClosure in
            return base.makeElements(
                from: &index,
                inputs: inputs,
                indirectMap: indirectMap
            ) { inputs, transform in
                // $s7SwiftUI16ModifiedElements33_E479C0E92CDD045BAF2EF653123E2E0BLLV04makeD04from6inputs11indirectMap4bodyAA12_ViewOutputsVSg_SbtSiz_AA01_S6InputsVAA017IndirectAttributeQ0CSgAL_SbtAN_AkNctXEtFAL_SbtAL_SbtAN_AkNctcXEfU_AL_SbtAN_AkNctXEfU_
                escapingClosure(inputs) { inputs in
                    // sp + 0x120
                    let copy_1 = inputs
                    // sp + 0xf0
                    let copy_2 = baseInputs
                    // sp + 0x90
                    let copy_3 = baseInputs
                    
                    if let indirectMap {
                        copy_3.makeReusable(indirectMap: indirectMap)
                    }
                    
                    // <+152>
                    // sp + 0x90
                    var copy_4 = copy_1
                    // sp + 0x60
                    let copy_5 = copy_2
                    // sp
                    let _ = copy_1
                    
                    copy_4.base.merge(copy_5, ignoringPhase: false)
                    
                    // <+228>
                    // x20
                    guard let attribute = modifier.attribute else {
                        // <+260>
                        return _ViewOutputs()
                    }
                    
                    // <+348>
                    func project<U : ViewModifier>(type: U.Type) -> _ViewOutputs {
                        // $s7SwiftUI16ModifiedElements33_E479C0E92CDD045BAF2EF653123E2E0BLLV04makeD04from6inputs11indirectMap4bodyAA12_ViewOutputsVSg_SbtSiz_AA01_S6InputsVAA017IndirectAttributeQ0CSgAL_SbtAN_AkNctXEtFAL_SbtAL_SbtAN_AkNctcXEfU_AL_SbtAN_AkNctXEfU_AkNcfU_7projectL_yAKxmAA0S8ModifierRzlFTf0nnnnsn_n
                        // sp + 0xc
                        var attribute = Attribute<U>(identifier: attribute)
                        
                        if let indirectMap {
                            attribute.makeReusable(indirectMap: indirectMap)
                        }
                        
                        // +140>
                        let value = _GraphValue(attribute)
                        
                        return U.makeDebuggableView(modifier: value, inputs: copy_4) { _, inputs in
                            return transform(inputs)
                        }
                    }
                    
                    return _openExistential(modifierType, do: project)
                }
            }
        }
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
}

fileprivate struct ModifiedViewList : ViewList, CustomDebugStringConvertible {
    let base: any ViewList
    let listModifier: ModifiedViewList.ListModifier
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        return self.base.count(style: style)
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    var traitKeys: ViewTraitKeys? {
        return self.base.traitKeys
    }
    
    var viewIDs: _ViewList_ID_Views? {
        assertUnimplemented()
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    var traits: ViewTraitCollection {
        return base.traits
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<any ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        // $s7SwiftUI16ModifiedViewList33_E479C0E92CDD045BAF2EF653123E2E0BLLVAA0dE0A2aEP10applyNodes4from5style4list9transform2toSbSiz_AA01_dE14_IteratorStyleV14AttributeGraph0W0VyAaE_pGSgAA01_dE26_TemporarySublistTransformVSbSiz_AnA01_dE5_NodeOAUtXEtFTW
        let item = ModifiedViewList.Transform(listModifier: listModifier)
        
        return transform.withPushedItem(item) { transform in
            return base.applyNodes(
                from: &index,
                style: style,
                list: list,
                transform: transform,
                to: block
            )
        }
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        assertUnimplemented()
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
}

extension ModifiedViewList {
    final class ListModifier : _ViewListOutputs.ListModifier {
        private let pred: _ViewListOutputs.ListModifier?
        let modifierType: any ViewModifier.Type
        let modifier: AnyWeakAttribute
        let inputs: _GraphInputs
        
        init(pred: _ViewListOutputs.ListModifier?, modifierType: any ViewModifier.Type, modifier: AnyWeakAttribute, inputs: _GraphInputs) {
            self.pred = pred
            self.modifierType = modifierType
            self.modifier = modifier
            self.inputs = inputs
            super.init()
        }
        
        override func apply(to list: inout any ViewList) {
            /*
             self -> x19
             list -> x21
             */
            if let pred {
                pred.apply(to: &list)
            }
            
            // sp + 0x8
            let copy_1 = list
            list = ModifiedViewList(base: copy_1, listModifier: self)
        }
    }
    
    struct Transform : _ViewList_SublistTransform_Item {
        private(set) var listModifier: ModifiedViewList.ListModifier
        
        func apply(sublist: inout _ViewList_Sublist) {
            let elements = ModifiedElements(
                base: sublist.elements.base,
                modifier: listModifier.modifier,
                modifierType: listModifier.modifierType,
                baseInputs: listModifier.inputs
            )
            
            sublist.elements.base = elements
        }
        
        func bindID(_ id: inout _ViewList_ID) {
            assertUnimplemented()
        }
        
        func wrapSubgraph(into storage: inout _ViewList_SublistSubgraphStorage) {
            assertUnimplemented()
        }
    }
}

extension Layout {
    public static func makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        // $s7SwiftUI6LayoutPAAE04makeC4View4root6inputs4bodyAA01_E7OutputsVAA11_GraphValueVyxG_AA01_E6InputsVAA01_e4ListI0VAA01_J0V_ANtXEtFZ
        // sp + 0x44
        var root = root
        // sp + 0x380
        let copy_1 = inputs
        // sp + 0x320
        var copy_2 = inputs
        // sp + 0x2c0
        var copy_3 = copy_1
        
        Self._makeAnimatable(value: &root, inputs: copy_2.base)
        
        // sp + 0x3e0
        let _ = copy_2
        
        // <+196>
        // w24
        var options = copy_1.base.options
        /*
         copy_1.base.customInputs -> x27
         */
        
        // w19/w28/sp + 0xc
        let layoutProperties: LayoutProperties
        if self != AnyLayout.self {
            // <+252>
            copy_3 = copy_1
            layoutProperties = Self.layoutProperties
            
            // w19
            if let stackOrientation = layoutProperties.stackOrientation {
                // <+548>
                options.subtract([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
                switch stackOrientation {
                case .horizontal:
                    options.formUnion(.viewStackOrientationIsDefined)
                case .vertical:
                    options.formUnion([.viewStackOrientationIsDefined, .viewStackOrientationIsHorizontal])
                }
                copy_2.base.options = options
                // <+572>
            } else {
                // <+316>
                options.subtract([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
                copy_2.base.options = options
                copy_2[DynamicStackOrientation.self] = OptionalAttribute()
                // <+572>
            }
        } else {
            // <+372>
            options.subtract([.viewStackOrientationIsDepth, .viewStackOrientationIsHorizontal])
            copy_2.base.options = options
            copy_3 = copy_1
            let rule = AnyLayoutProperties(layout: root.value.identifier.unsafeCast(to: AnyLayout.self))
            let attribute = Attribute(rule)
            copy_2[DynamicStackOrientation.self] = OptionalAttribute(attribute)
            layoutProperties = LayoutProperties()
            // <+572>
        }
        
        // <+572>
        let archivedViewInput = copy_3[ArchivedViewInput.self]
        if archivedViewInput.flags.contains(.isArchived) {
            // <+1260>
            var options = _ViewListInputs.Options(rawValue: copy_2[ViewListOptionsInput.self])
            options.formUnion(.needsArchivedAnimationTraits)
            copy_2[ViewListOptionsInput.self] = options.rawValue
        }
        
        // <+620>
        if !options.contains(.needsDynamicLayout) {
            copy_2.base.options = options
        }
        
        // <+628>
        // sp + 0x260
        let copy_4 = copy_2
        // sp + 0x1c0
        let copy_5 = copy_2
        copy_3 = copy_4
        // sp + 0x218
        let listOutputs = body(_Graph(), copy_5)
        copy_3 = copy_4
        // sp + 0x190
        let views = listOutputs.views
        // <+756>
        switch views {
        case .staticList(let elements):
            // <+1076>
            // sp + 0xa8
            let _ = views
            if options.contains(.needsDynamicLayout) {
                // <+1304>
                // sp + 0x130
                let copy_7 = copy_2
                // sp + 0xd0
                let copy_8 = copy_2
                // sp + 0x1c0
                let copy_9 = copy_1
                // sp + 0x50
                let _ = copy_7
                
                let elements = listOutputs.makeAttribute(viewInputs: copy_9)
                return Self.makeDynamicView(root: root, inputs: copy_8, properties: layoutProperties, list: elements)
            } else {
                // <+1092>
                // sp + 0x130
                let _ = copy_2
                // sp + 0xd0
                let copy_8 = copy_2
                return Self.makeStaticView(root: root, inputs: copy_8, properties: layoutProperties, list: elements)
            }
        case .dynamicList(var attribute, let listModifier):
            // <+764>
            /*
             attribute = w20
             listModifier = x21
             */
            if let listModifier {
                attribute = Attribute(_ViewListOutputs.ApplyModifiers(base: attribute, modifier: listModifier))
            }
            
            // <+892>
            // sp + 0x130
            let copy_6 = copy_2
            // sp + 0xd0
            let copy_7 = copy_2
            // sp + 0x1c0
            _ = copy_6
            
            let outputs = Self.makeDynamicView(root: root, inputs: copy_7, properties: layoutProperties, list: attribute)
            return outputs
        }
    }
}

extension Layout3D {
    static func _makeLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static func makeLayoutView3D(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        /*
         root -> x0 -> w23
         inputs -> x1 -> x21
         body -> x2/x3 -> x25/x24
         */
        // x29 - 0xc0
        let copy_1 = inputs
        // sp + 0xf0
        let copy_2 = inputs.base
        
        guard IsVisionEnabledPredicate.evaluate(inputs: copy_2) else {
            // sp + 0xf0
            let copy_3 = inputs
            return Self.makeLayoutView(root: root, inputs: copy_3, body: body)
        }
        
        // <+152>
        // sp + 0x38
        var root = root
        // sp + 0xf0
        let copy_3 = inputs.base
        // sp + 0x98
        let _ = copy_1
        Self._makeAnimatable(value: &root, inputs: copy_3)
        
        // sp + 0xf0
        var copy_4 = copy_1
        // sp + 0x3d
        let layoutProperties: LayoutProperties
        
        if Self.self == AnyLayout.self {
            // <+636>
            copy_4.base.options = copy_1.base.options.subtracting([.viewStackOrientationIsDefined, .viewStackOrientationIsHorizontal, .viewStackOrientationIsDepth])
            // sp + 0x98
            let _ = copy_1
            // sp + 0x68
            let axisRule = AnyLayoutProperties(layout: root.value.unsafeBitCast(to: AnyLayout.self))
            // w20
            let axisAttribute = Attribute(axisRule)
            // sp + 0x98
            let depthRule = AnyLayoutDepthProperties(layout: root.value.unsafeBitCast(to: AnyLayout.self))
            // w28
            let depthAttribute = Attribute(depthRule)
            
            copy_4[DynamicStackOrientation.self] = OptionalAttribute(axisAttribute)
            copy_4[DynamicStackOrientationIsDepth.self] = OptionalAttribute(depthAttribute)
            
            // <+908>
            layoutProperties = LayoutProperties()
            // <+920>
        } else {
            // <+280>
            // sp + 0x98
            let _ = copy_1
            // sp + 0x98 -> sp + 0x3d
            layoutProperties = Self.layoutProperties
            copy_4.stackOrientation = layoutProperties.stackOrientation
            
            // <+364>
            // sp + 0x98
            let depthProperties_1 = Self.depthProperties
            
            copy_4.base.options.subtract(.viewStackOrientationIsDepth)
            if depthProperties_1.stackOrientationIsDepth {
                copy_4.base.options.formUnion(.viewStackOrientationIsDepth)
            }
            
            // <+424>
            if layoutProperties.stackOrientation == nil {
                copy_4[DynamicStackOrientation.self] = OptionalAttribute()
            }
            
            // <+480>
            // sp + 0x98
            let depthProperties_2 = Self.depthProperties
            
            if depthProperties_2.stackOrientationIsDepth {
                // <+920>
            } else {
                // <+520>
                copy_4[DynamicStackOrientationIsDepth.self] = OptionalAttribute()
            }
            
            // <+920>
        }
        
        // <+920>
        // sp + 0x98
        let outputs = body(_Graph(), copy_4)
        
        switch outputs.views {
        case .staticList(let elements):
            // <+1128>
            return Self.makeStaticView3D(root: root, inputs: copy_4, properties: layoutProperties, list: elements)
        case .dynamicList(var list, let modifier):
            // <+960>
            if let modifier {
                // <+976>
                let modifiers = _ViewListOutputs.ApplyModifiers(base: list, modifier: modifier)
                list = Attribute(modifiers)
            }
            
            // <+1084>
            return Self.makeDynamicView3D(root: root, inputs: copy_4, properties: layoutProperties, list: list)
        }
    }
    
    static func makeStaticView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
        /*
         root -> x0 -> w23
         inputs -> x1 -> x24
         properties -> x2
         list -> x3/x4 -> x28/x29 - 0x138
         */
        // w22
        let isDefaultEmptyLayout = properties.isDefaultEmptyLayout
        // w26
        let isIdentityUnaryLayout = properties.isIdentityUnaryLayout
        let count = list.count
        
        // true -> <+296> / false -> <+560>
        let flag: Bool
        if count == 1 {
            // <+292>
            if isIdentityUnaryLayout {
                // <+296>
                flag = true
            } else {
                // <+560>
                flag = false
            }
        } else if count != 0 {
            // <+560>
            flag = false
        } else {
            // <+268>
            if isDefaultEmptyLayout {
                // <+272>
                return _ViewOutputs()
            } else {
                // <+560>
                flag = false
            }
        }
        
        if flag {
            // <+296>
            let block: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs?) -> _ViewOutputs? = { _ in
                // $s7SwiftUI18_ViewList_ElementsPAAE07makeAllE06inputs11indirectMap4bodyAA01_C7OutputsVSgAA01_C6InputsV_AA017IndirectAttributeJ0CSgAjL_AiLctXEtFA2jL_AiLctcXEfU_AJ_SbtAL_AiLctXEfU_03$s7a5UI11_cm9VAcA01_C7l178VIegnr_AESgIgngr_A2cEIegnr_AFIegngr_TR03$s7a67UI8Layout3DPAAE16makeStaticView3D4root6inputs10properties4listAA12_ce28VAA11_GraphValueVyxG_AA01_K6D65VAA16LayoutPropertiesVAA01_K13d1_E32_ptFZAJSgAO_AjOctXEfU_Tf3nnnpf_nTf3nnnpf_n
                assertUnimplemented()
            }
            
            // x29 - 0xe0
            let outputs = withoutActuallyEscaping(block) { escapingClosure in
                list.makeAllElements(
                    inputs: <#T##_ViewInputs#>,
                    indirectMap: nil,
                    body: escapingClosure
                )
            }
            
            assertUnimplemented()
        } else {
            // <+560>
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
    
    static func makeDynamicView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: Attribute<ViewList>) -> _ViewOutputs {
        assertUnimplemented()
    }
}

struct ViewListSublistSlice : ViewList, CustomDebugStringConvertible {
    private let base: any ViewList
    private let bounds: Range<Int>
    
    init(base: any ViewList, bounds: Range<Int>) {
        self.base = base
        self.bounds = bounds
    }
    
    var traitKeys: ViewTraitKeys? {
        assertUnimplemented()
    }
    
    var viewIDs: _ViewList_ID_Views? {
        assertUnimplemented()
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        return self.bounds.upperBound - self.bounds.lowerBound
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        return self.estimatedCount(style: style)
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<any ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to block: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        // x29 - 0x58
        var value_1 = self.bounds.lowerBound + index
        // x23
        var value_2 = value_1
        /*
         style -> x1 -> x26
         list -> x2 -> x19
         transform -> x3 -> x27/w28
         block -> x4/x4 -> x21/x22
         */
        func _block(
            index: inout Int,
            style: _ViewList_IteratorStyle,
            node: _ViewList_Node,
            transform: borrowing _ViewList_TemporarySublistTransform
        ) -> Bool {
            // $s7SwiftUI20ViewListSublistSliceV10applyNodes4from5style4list9transform2toSbSiz_AA01_cD14_IteratorStyleV14AttributeGraph0P0VyAA0cD0_pGSgAA01_cd10_TemporaryE9TransformVSbSiz_AkA01_cD5_NodeOAStXEtF0gT0L_5startAF4nodeAH4bodySbSiz_AkuSSbSiz_AkuStXEtFSbSiz_AkuStXEfU_TA.196
            /*
             index -> x0 -> x26
             style -> x1 -> x27
             node -> x2 -> x20
             transform -> x3 -> x21/w28
             value -> x4 -> x24
             self -> x5 -> x25
             block -> x6/x7 -> x23/x22
             */
            // x19 + 0xc0
            let copy_1 = node
            
            switch copy_1 {
            case .sublist(let sublist):
                // <+96>
                // x19 + 0x60
                let copy_2 = sublist
                
                if value_2 >= self.bounds.upperBound {
                    return false
                }
                
                // <+176>
                // x25
                let granularity = style.applyGranularity(to: sublist.count)
                value_2 += granularity
                
                return block(&index, style, node, transform)
            default:
                // <+296>
                return node.applyNodes(
                    from: &index,
                    style: style,
                    transform: transform,
                    to: _block
                )
            }
        }
        
        return self.base.applyNodes(
            from: &value_1,
            style: style,
            list: list,
            transform: transform,
            to: _block
        )
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        assertUnimplemented()
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    var traits: ViewTraitCollection {
        assertUnimplemented()
    }
}
