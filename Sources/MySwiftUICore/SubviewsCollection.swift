internal import AttributeGraph

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubviewsCollection : RandomAccessCollection {
    private var base: _VariadicView_Children
    
    init(_ base: _VariadicView_Children) {
        self.base = base
    }
    
    init(list: any ViewList, contentSubgraph: Subgraph, transform: _ViewList_SublistTransform) {
        self.base = _VariadicView_Children(
            list,
            contentSubgraph: contentSubgraph,
            transform: transform
        )
    }
    
    public func index(before i: Int) -> Int {
        assertUnimplemented()
    }

    public func index(after i: Int) -> Int {
        return Update.ensure {
            assert(i >= 0)
            assert(!(i >= self.base.list.count))
            return i &+ 1
        }
    }

    public subscript(index: Int) -> Subview {
        let element = self.base[index]
        return Subview(element)
    }

    public subscript(bounds: Range<Int>) -> SubviewsCollectionSlice {
        assertUnimplemented()
    }

    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return Update.ensure { 
            return self.base.list.count
        }
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = Subview
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<SubviewsCollection>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = SubviewsCollectionSlice
}

@available(*, unavailable)
extension SubviewsCollection : Sendable {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubviewsCollection : View {
    nonisolated public static func _makeViewList(view: _GraphValue<SubviewsCollection>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let base = view[{ .of(&$0.base)} ]
        return _VariadicView_Children._makeViewList(view: base, inputs: inputs)
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Body = Never
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SubviewsCollection : MultiView, PrimitiveView {
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SubviewsCollectionSlice : RandomAccessCollection {
    public subscript(index: Int) -> Subview {
        assertUnimplemented()
    }

    public subscript(bounds: Range<Int>) -> SubviewsCollectionSlice {
        assertUnimplemented()
    }

    public var startIndex: Int {
        assertUnimplemented()
    }

    public var endIndex: Int {
        assertUnimplemented()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = Subview
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<SubviewsCollectionSlice>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = SubviewsCollectionSlice
}

@available(*, unavailable)
extension SubviewsCollectionSlice : Sendable {}

struct SubviewsRoot<Content : View> : _VariadicView_MultiViewRoot {
    let content: (SubviewsCollection) -> Content
    
    func body(children: _VariadicView.Children) -> some View {
        content(SubviewsCollection(children))
    }
}
