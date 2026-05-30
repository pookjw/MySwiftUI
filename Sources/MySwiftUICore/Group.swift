// C1B8B6896BB94C69479F427820712D02
package import AttributeGraph

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

extension _ViewListOutputs {
    package static func groupViewList<Parent : View, Footer : View>(parent: _GraphValue<Parent>, footer: Attribute<Footer>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         parent -> x0 -> w24
         footer -> x1 -> sp + 0x14
         inputs -> x2 -> x22
         body -> x3/x4 -> x25/sp + 0x8
         */
        // x29 - 0xe8
        var copy_1 = inputs
        let w26 = inputs.options
        
        if w26.contains(.allowsNestedSections) || copy_1.options.isDisjoint(with: [.requiresSections, .requiresNonEmptyGroupParent]) {
            // <+132>
        } else {
            // <+120>
            copy_1.options.subtract([.requiresSections, .requiresNonEmptyGroupParent])
        }
        
        if w26.contains(.requiresDepthAndSections) {
            // <+136>
            let sectionedTrait = SectionedTrait(traits: OptionalAttribute(inputs.$traits))
            copy_1.$traits = Attribute(sectionedTrait)
            
            // <+208>
            if var traitKeys = copy_1.traitKeys {
                // <+216>
                // traitKeys -> sp + 0xd8
                copy_1.traitKeys = nil
                traitKeys.insert(IsSectionedTraitKey.self)
                copy_1.traitKeys = traitKeys
            } else {
                // <+284>
            }
        }
        
        // <+284>
        // sp + 0xd8
        var copy_2 = copy_1
        
        if w26.contains(.requiresNonEmptyGroupParent) {
            copy_2.options.formUnion(.isNonEmptyParent)
            
            let headerTrait = SectionHeaderTrait(traits: OptionalAttribute(copy_1.$traits))
            copy_2.$traits = Attribute(headerTrait)
            
            // <+384>
            if var traitKeys = copy_2.traitKeys {
                copy_2.traitKeys = nil
                traitKeys.insert(IsSectionHeaderTraitKey.self)
                copy_2.traitKeys = traitKeys
            } else {
                // <+460>
            }
        }
        
        // <+460>
        if w26.contains(.resetHeaderStyleContext) {
            copy_2[StyleContextInput.self] = StyleContextInput.defaultValue
        }
        
        // <+540>
        // sp + 0x160
        let outputs_1 = Parent.makeDebuggableViewList(view: parent, inputs: copy_2)
        
        let w24 = copy_1.options
        if w24.contains(.requiresContentOffsets) {
            copy_1.updateContentOffset(outputs: outputs_1)
        }
        
        // <+648>
        if w26.contains(.requiresDepthAndSections) {
            let depthTrait = DepthTrait(traits: OptionalAttribute(copy_1.$traits))
            copy_1.$traits = Attribute(depthTrait)
            
            if var traitKeys = copy_1.traitKeys {
                copy_1.traitKeys = nil
                traitKeys.insert(DepthTraitKey.self)
                copy_1.traitKeys = traitKeys
            } else {
                // <+808>
            }
        }
        
        // <+808>
        // sp + 0x90
        let outputs_2 = body(_Graph(), copy_1)
        
        if w24.contains(.requiresContentOffsets) {
            copy_1.updateContentOffset(outputs: outputs_2)
        }
        
        // <+848>
        // sp + 0xd8
        var copy_3 = copy_1
        
        if w26.contains(.requiresNonEmptyGroupParent) {
            if copy_3.options.contains(.requiresNonEmptyGroupParent) {
                copy_3.options.subtract(.requiresNonEmptyGroupParent)
            }
            
            // <+880>
            let footerTrait = SectionFooterTrait(traits: OptionalAttribute(copy_1.$traits))
            copy_3.$traits = Attribute(footerTrait)
            
            if var traitKeys = copy_3.traitKeys {
                copy_3.traitKeys = nil
                traitKeys.insert(IsSectionFooterTraitKey.self)
                copy_3.traitKeys = traitKeys
            } else {
                // <+1028>
            }
        }
        
        // <+1028>
        if w26.contains(.resetFooterStyleContext) {
            copy_3[StyleContextInput.self] = StyleContextInput.defaultValue
        }
        
        // <+1104>
        // sp + 0x48
        let outputs_3 = Footer.makeDebuggableViewList(view: _GraphValue(footer), inputs: copy_3)
        
        // <+1204>
        // x19
        let outputs = [
            outputs_1,
            outputs_2,
            outputs_3
        ]
        
        if w26.contains(.requiresSections) {
            // <+1364>
            return _ViewListOutputs.sectionListOutputs(outputs, inputs: inputs)
        } else {
            // <+1312>
            // sp + 0xd8
            var copy_4 = inputs
            copy_4.implicitID = outputs_3.nextImplicitID
            return _ViewListOutputs.concat(outputs, inputs: copy_4)
        }
    }
    
    static func groupViewListCount<Content : View, Header : View, Footer : View>(inputs: _ViewListCountInputs, contentType: Content.Type, headerType: Header.Type, footerType: Footer.Type) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct SectionedTrait : Rule {
    @OptionalAttribute var traits: ViewTraitCollection?
    
    var value: ViewTraitCollection {
        return self.traits ?? ViewTraitCollection()
    }
}

@usableFromInline
package struct IsSectionedTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: Bool {
        return false
    }
}

@available(*, unavailable)
extension IsSectionedTraitKey : Sendable {
}

struct SectionHeaderTrait : Rule {
    @OptionalAttribute var traits: ViewTraitCollection?
    
    init(traits: OptionalAttribute<ViewTraitCollection>) {
        self._traits = traits
    }
    
    var value: ViewTraitCollection {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@usableFromInline
package struct IsSectionHeaderTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: Bool {
        return false
    }
}

@available(*, unavailable)
extension IsSectionHeaderTraitKey : Sendable {
}

struct DepthTrait : Rule {
    @OptionalAttribute private var traits: ViewTraitCollection?
    
    init(traits: OptionalAttribute<ViewTraitCollection>) {
        self._traits = traits
    }
    
    var value: ViewTraitCollection {
        var collection = self.traits ?? ViewTraitCollection()
        collection[DepthTraitKey.self] += 1
        return collection
    }
}

struct DepthTraitKey : _ViewTraitKey {
    static var defaultValue: Int {
        return 0
    }
}

fileprivate struct SectionFooterTrait : Rule {
    @OptionalAttribute var traits: ViewTraitCollection?
    
    var value: ViewTraitCollection {
        assertUnimplemented()
    }
}

@usableFromInline
package struct IsSectionFooterTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: Bool {
        return false
    }
}

@available(*, unavailable)
extension IsSectionFooterTraitKey : Sendable {
}

extension _ViewListOutputs {
    static func sectionListOutputs(_ outputs: [_ViewListOutputs], inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         outputs -> x0 -> x20
         inputs -> x1 -> x9 -> sp + 0x10
         */
        // x29 - 0xf0
        var copy_1 = inputs
        // x22
        var lists: [Attribute<any ViewList>] = []
        // x27/w26
        var staticCount: Int? = 0
        
        for output in outputs {
            // inlined
            // w20
            let attribute = output.makeAttribute(inputs: copy_1)
            // <+712>
            lists.append(attribute)
            copy_1.implicitID = output.nextImplicitID
            
            // <+784>
            if let _staticCount = output.staticCount {
                staticCount = (staticCount ?? 0) &+ _staticCount
            } else {
                staticCount = nil
            }
        }
        
        // <+872>
        // inputs -> sp + 0x10 -> x19
        // w24
        let options = inputs.options
        if options.contains(.sectionsConcatenateFooter) {
            // <+872>
            var trimmed = lists
            if !trimmed.isEmpty {
                trimmed = Array(trimmed[1..<trimmed.count])
            }
            
            // <+904>
            let groupInit = _ViewList_Group.Init(lists: trimmed)
            let groupAttributeInit = Attribute(groupInit)
            lists[1] = groupAttributeInit
            
            // <+1016>
            let attribute = GraphHost.currentHost.intern(EmptyViewList() as any ViewList, for: (any ViewList).self, id: .defaultValue)
            lists[2] = attribute
        }
        
        // <+1068>
        // sp + 0x50
        let makeSection = MakeSection(
            lists: lists,
            isHierarchical: options.contains(.sectionsAreHierarchical),
            traits: OptionalAttribute(inputs.$traits)
        )
        let makeSectionAttribute = Attribute(makeSection)
        
        return _ViewListOutputs(
            .dynamicList(makeSectionAttribute, nil),
            nextImplicitID: copy_1.implicitID,
            staticCount: staticCount
        )
    }
}

fileprivate struct MakeSection : Rule {
    private(set) var lists: [Attribute<any ViewList>]
    private(set) var isHierarchical: Bool
    @OptionalAttribute var traits: ViewTraitCollection?
    
    var value: any ViewList {
        /*
         lists -> x0 -> x26
         isHierarchical/traits -> x1 -> x19
         return pointer -> x8 -> x22
         */
        // w21
        let attribute = AnyAttribute.current!
        // traits -> x23
        // x28
        var array: [(list: any ViewList, attribute: Attribute<any ViewList>)] = []
        
        for list in self.lists {
            array.append((list: list.value, attribute: list))
        }
        
        // <+288>
        let section = _ViewList_Section(
            id: attribute.rawValue,
            base: _ViewList_Group(lists: array),
            traits: self.traits ?? ViewTraitCollection(),
            isHierarchical: self.isHierarchical
        )
        
        return section
    }
}
