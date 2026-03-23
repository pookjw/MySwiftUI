// 1A3DD35AB7F6976908CD7AF959F34D1F
internal import AttributeGraph
private import Foundation

public struct ForEach<Data, ID, Content> where Data: RandomAccessCollection, ID: Hashable {
    public var data: Data
    public var content: (Data.Element) -> Content
}

@available(*, unavailable)
extension ForEach: Sendable {}

extension ForEach: View where Content: View {
    public typealias Body = Never
    
    nonisolated public static func _makeView(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        if let outputs = makeForEachView(view: view, inputs: inputs) {
            return outputs
        }
        
        // <+112>
        return makeImplicitRoot(view: view, inputs: inputs)
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let state = ForEachState<Data, ID, Content>(inputs: inputs)
        let rule = ForEachState<Data, ID, Content>.Info.Init(view: view.value, state: state)
        
        let existing = inputs.base[ForEachEvictionInput.self]
        
        assertUnimplemented()
    }
}

extension ForEach: DynamicView, PrimitiveView where Content: View {
    static func makeID() -> Never {
        assertUnimplemented()
    }
    
    func childInfo(metadata: Never) -> (any Any.Type, Never?) {
        assertUnimplemented()
    }
    
    func makeChildView(metadata: Never, view: AttributeGraph.Attribute<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    func makeChildViewList(metadata: Never, view: AttributeGraph.Attribute<ForEach<Data, ID, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    typealias Metadata = Never // TODO
    
    typealias ID = Never // TODO
    
    static var canTransition: Bool {
        assertUnimplemented()
    }
}

extension ForEach where ID == Data.Element.ID, Content: View, Data.Element: Identifiable {
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        assertUnimplemented()
    }
}

extension ForEach where Content: View {
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        assertUnimplemented()
    }
}

extension ForEach where Content: View {
    @_disfavoredOverload @_alwaysEmitIntoClient public init<C>(_ data: Binding<C>, @ViewBuilder content: @escaping (Binding<C.Element>) -> Content) where Data == LazyMapSequence<C.Indices, (C.Index, ID)>, ID == C.Element.ID, C: MutableCollection, C: RandomAccessCollection, C.Element: Identifiable, C.Index: Hashable {
        self.init(data, id: \.id, content: content)
    }
    
    @_disfavoredOverload @_alwaysEmitIntoClient public init<C>(_ data: Binding<C>, id: KeyPath<C.Element, ID>, @ViewBuilder content: @escaping (Binding<C.Element>) -> Content) where Data == LazyMapSequence<C.Indices, (C.Index, ID)>, C: MutableCollection, C: RandomAccessCollection, C.Index: Hashable {
        let elementIDs = data.wrappedValue.indices.lazy.map { index in
            (index, data.wrappedValue[index][keyPath: id])
        }
        self.init(elementIDs, id: \.1) { (index, _) in
            let elementBinding = Binding {
                data.wrappedValue[index]
            } set: {
                data.wrappedValue[index] = $0
            }
            content(elementBinding)
        }
    }
}

extension ForEach where Data == Range<Int>, ID == Int, Content: View {
    @_semantics("swiftui.requires_constant_range") public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach where ID == Data.Element.ID, Data.Element: Identifiable {
    @usableFromInline
    internal static func create(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach {
    @usableFromInline
    internal static func create(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach where Data == Range<Int>, ID == Int {
    @usableFromInline
    @_semantics("swiftui.requires_constant_range") internal static func create(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

extension ForEach: DynamicViewContent where Content: View {}

extension ForEach where Content: View {
    static func makeForEachView(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs? {
        if let casted = view as? _GraphValue<ForEach<ForEachSubviewCollection<Content>, Subview.ID, Content>> {
            // <+288>
            assertUnimplemented()
        } else if let casted = view as? _GraphValue<ForEach<ForEachSectionCollection<Content>, SectionConfiguration.ID, Content>> {
            // <+484>
            assertUnimplemented()
        } else {
            return nil
        }
        
        // <+544>
        assertUnimplemented()
    }
}

final class ForEachState<Data: RandomAccessCollection, ID: Hashable, Content> {
    private var inputs: _ViewListInputs?
    private var parentSubgraph: Subgraph?
    private var info: Attribute<ForEachState.Info>?
    private var list: Attribute<ViewList>?
    private var view: ForEach<Data, ID, Content>?
    private var viewsPerElementCount: ForEachState.ViewsPerElementCount?
    private var viewCounts: [Int] = []
    private var viewCountStyle: _ViewList_IteratorStyle?
    private var items: [ID: ForEachState.Item] = [:]
    private var edits: LazyEdits?
    private var lastTransaction: TransactionID?
    private var firstInsertionOffset: Int = 0
    private var contentID: Int = 0
    private var seed: UInt32 = 0
    private var createdAllItems: Bool = false
    private var evictionSeed: UInt32 = 0
    private var pendingEviction: Bool = false
    private var evictedIDs: Set<ID> = []
    private var matchingStrategyCache: [ObjectIdentifier: IDTypeMatchingStrategy] = [:]
    
    init(inputs: _ViewListInputs) {
        assertUnimplemented()
    }
}

extension ForEachState {
    final class Item {
        // TODO
    }
    
    fileprivate enum IDTypeMatchingStrategy {
        case exact
        case anyHashable
        case customIDRepresentation
        case noMatch
    }
    
    enum ViewsPerElementCount {
        case countingDebugReplaceableViews(MutableBox<DebugReplaceableViewCount>)
        case resolved(Int)
        case uninitialized
        case indeterminate
    }
    
    fileprivate enum LazyEdits {
        case builder(ForEachState<Data, ID, Content>.EditsBuilder)
        case raw(ForEachState<Data, ID, Content>.Edits)
    }
    
    fileprivate struct EditsBuilder {
        private var data: Data
        private var idGenerator: ForEach<Data, ID, Content>.IDGenerator
        private var insertOffsets: IndexSetBuilder
        private var edits: ForEachState<Data, ID, Content>.Edits
    }
    
    struct Info {
        private var state: ForEachState<Data, ID, Content>
        private var seed: UInt32
    }
    
    fileprivate struct Edits {
        private var removes: Set<ID>
        private var inserts: Set<ID>
    }
}

extension ForEachState.Info {
    struct Init: Rule, CustomStringConvertible {
        @Attribute fileprivate private(set) var view: ForEach<Data, ID, Content>
        fileprivate let state: ForEachState<Data, ID, Content>
        
        var description: String {
            assertUnimplemented()
        }
        
        var value: ForEachState.Info {
            assertUnimplemented()
        }
    }
}

extension ForEach {
    enum IDGenerator {
        case keyPath(KeyPath<Data.Element, ID>)
        case offset
    }
}

struct IndexSetBuilder {
    private var indexSet: IndexSet
    private var lastRange: Range<Int>?
}

enum DebugReplaceableViewCount {
    case counting(Int)
    case uninitialized
    case indeterminate
}

struct ForEachEvictionInput: GraphInput {
    static var defaultValue: WeakAttribute<Bool> {
        return WeakAttribute()
    }
    
    static let evictByDefault: Bool = {
        // $s7SwiftUI20ForEachEvictionInputV14evictByDefault_WZ
        assertUnimplemented()
    }()
}
