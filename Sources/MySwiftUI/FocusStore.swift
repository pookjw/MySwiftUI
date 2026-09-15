// 5347FD43F24C67CC5D552D8EE95E9192
@_spi(Internal) internal import MySwiftUICore

struct FocusStore {
    var version = DisplayList.Version()
    private(set) var focusedResponders: [WeakBox<ViewResponder>] = []
    private(set) var plists: [ObjectIdentifier: PropertyList] = [:]
    
    @inline(always) // 원래 없음
    init() {}
    
    @inline(always) // 원래 없음
    init(_ list: FocusStoreList) {
        self.makeStoreContent(list)
    }
    
    fileprivate func makeStoreContent(_ list: FocusStoreList) {
        assertUnimplemented()
    }
}

struct FocusStoreList : Equatable, Collection {
    private var items: [FocusStoreList.Item]
    
    init() {
        items = []
    }
    
    func index(after i: [FocusStoreList.Item].Index) -> [FocusStoreList.Item].Index {
        return items.index(after: i)
    }
    
    var indices: [FocusStoreList.Item].Indices {
        return items.indices
    }
    
    var startIndex: [FocusStoreList.Item].Index {
        return items.startIndex
    }
    
    var endIndex: [FocusStoreList.Item].Index {
        return items.endIndex
    }
    
    func makeIterator() -> [FocusStoreList.Item].Iterator {
        return items.makeIterator()
    }
    
    subscript(position: Int) -> FocusStoreList.Item {
        _read {
            yield items[position]
        }
    }
    
    static func == (lhs: FocusStoreList, rhs: FocusStoreList) -> Bool {
        var displayList_1 = DisplayList.Version()
        for item in lhs.items {
            displayList_1.combine(with: item.version)
        }
        
        var displayList_2 = DisplayList.Version()
        for item in rhs.items {
            displayList_2.combine(with: item.version)
        }
        
        return displayList_1 == displayList_2
    }
    
    func replaceSubrange<C>(_ subrange: Range<[FocusStoreList.Item].Index>, with newElements: C) where C : Collection, C.Element == FocusStoreList.Item {
        assertUnimplemented()
    }
}

extension FocusStoreList {
    struct Item {
        private(set) var version: DisplayList.Version
        private var propertyID: ObjectIdentifier
//        private var bindingUpdateAction: FocusStateBindingUpdateAction
//        private var storeUpdateAction: FocusStoreUpdateAction
        private weak var responder: ResponderNode?
        private weak var bridge: FocusBridge?
        private var isFocused: Bool
    }
    
    struct Key : HostPreferenceKey {
        static var defaultValue: FocusStoreList {
            return FocusStoreList()
        }
        
        static func reduce(value: inout FocusStoreList, nextValue: () -> FocusStoreList) {
            assertUnimplemented()
        }
    }
}
