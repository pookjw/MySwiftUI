private import os.log
internal import AttributeGraph

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ForEachSectionCollection<Content> : RandomAccessCollection where Content : View {
    var substituteView: AnyView
    
    init<T : View>(subviewOf subviews: T, content: (SectionConfiguration) -> Content) {
        /*
         subviews -> x0 -> x22
         content -> x29 - 0xa0 / x29 - 0x98
         */
        // <+276>
        // x27
        let copy_1 = subviews
        
        let group = Group(sections: copy_1) { collection in
            // $s7SwiftUI24ForEachSectionCollectionV9subviewOf7contentACyxGqd___xAA0E13ConfigurationVctcAA4ViewRd__lufcAA0cD0VyAA0eF0VAH2IDVxGAMcfU_TA
            /*
             content -> x4/x5
             */
            assertUnimplemented()
        }
        
        self.substituteView = AnyView(group)
    }
    
    public var startIndex: Int {
        assertUnimplemented()
    }
    
    public var endIndex: Int {
        assertUnimplemented()
    }
    
    public subscript(index: Int) -> SectionConfiguration {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = SectionConfiguration
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<ForEachSectionCollection<Content>>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = Slice<ForEachSectionCollection<Content>>
}

@available(*, unavailable)
extension ForEachSectionCollection : Sendable {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension ForEach {
    public init<V>(sections view: V, @ViewBuilder content: @escaping (SectionConfiguration) -> Content) where Data == ForEachSectionCollection<Content>, ID == SectionConfiguration.ID, Content : View, V : View {
        /*
         view -> x0 -> x20
         content -> x1/x2 -> x23/x22
         */
        // x27
        let copy_1 = view
        // x29 - 0x58
        let collection = ForEachSectionCollection(subviewOf: copy_1, content: content)
        self.init(
            collection,
            idGenerator: .keyPath(\.id),
            content: content
        )
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension ForEach {
    public init<V>(subviews view: V, @ViewBuilder content: @escaping (Subview) -> Content) where Data == ForEachSubviewCollection<Content>, ID == Subview.ID, Content : View, V : View {
        /*
         view -> x0 -> x20
         content -> x1/x2 -> x23/x22
         */
        // x27
        let copy_1 = view
        // x29 - 0x58
        let collection = ForEachSubviewCollection(elementOf: copy_1, content: content)
        self.init(collection, idGenerator: .keyPath(\Subview.id), content: content)
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Group {
    public init<Base, Result>(sections view: Base, @ViewBuilder transform: @escaping (SectionCollection) -> Result) where Content == GroupSectionsOfContent<Base, Result>, Base : View, Result : View {
        self.init { () -> GroupSectionsOfContent<Base, Result> in
            // $s7SwiftUI5GroupV8sections9transformACyAA0C17SectionsOfContentVyqd__qd_0_GGqd___qd_0_AA17SectionCollectionVctcAHRszAA4ViewRd__AaLRd_0_r0_lufcAHyXEfU_TA
            return GroupSectionsOfContent<Base, Result>(
                sections: view,
                content: transform
            )
        }
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct GroupSectionsOfContent<Sections, Content> : View where Sections : View, Content : View {
    @safe private nonisolated(unsafe) let sections: Sections
    @safe private nonisolated(unsafe) let content: (SectionCollection) -> Content
    
    nonisolated init(sections: Sections, content: @escaping (SectionCollection) -> Content) {
        if sections is SubviewsCollection {
            Log.externalWarning("Group(sections:) or ForEach(sections:) was passed a SubviewsCollection. These APIs do not support nested sectioning. Attempting to use them this way will result in losing sectioning information.")
        }
        
        self.sections = sections
        self.content = content
    }
    
    @MainActor @preconcurrency public var body: some View {
        _VariadicView.Tree(
            SectionsRoot(content: content),
            content: {
                // $s7SwiftUI22GroupSectionsOfContentV4bodyQrvgxyXEfU_TA
                self.sections
            }
        )
    }
}

@available(*, unavailable)
extension GroupSectionsOfContent : Sendable {
}

struct SectionsRoot<T : View> : _VariadicView_MultiViewRoot {
    fileprivate let content: (SectionCollection) -> T
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated static func _makeView(root: _GraphValue<SectionsRoot<T>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(root: _GraphValue<SectionsRoot<T>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         inputs -> x1 -> x22
         */
        // w25
        let rootAttribute = root.value
        // sp + 0xb8
        let outputs = body(_Graph(), inputs)
        // x29 - 0x70
        let copy_1 = inputs.base
        // sp + 0x30
        let copy_2 = _ViewListInputs(copy_1, implicitID: 0, options: [])
        // w20
        let attribute = outputs.makeAttribute(inputs: copy_2)
        
        let child = SectionsRoot.Child(view: rootAttribute, viewList: attribute, contentSubgraph: .current!)
        let childValue = _GraphValue(child)
        
        return T.makeDebuggableViewList(view: childValue, inputs: inputs)
    }
    
    nonisolated static var _viewListOptions: Int {
        let options: _ViewListInputs.Options = [
            .requiresDepthAndSections,
            .requiresSections,
            .allowsNestedSections
        ]
        
        return options.rawValue
    }
}

extension SectionsRoot {
    struct Child : Rule {
        @Attribute private(set) var view: SectionsRoot<T>
        @Attribute private(set) var viewList: ViewList
        private(set) var contentSubgraph: Subgraph
        
        var value: T {
            assertUnimplemented()
        }
    }
}
