// 5347FD43F24C67CC5D552D8EE95E9192
@_spi(Internal) internal import MySwiftUICore

struct FocusStore {
    var version = DisplayList.Version()
    private(set) var focusedResponders: [WeakBox<ViewResponder>] = []
    private(set) var plists: [ObjectIdentifier : PropertyList] = [:]
    
    @inline(always) // 원래 없음
    init() {}
    
    @inline(always) // 원래 없음
    init(_ list: FocusStoreList) {
        self.makeStoreContent(list)
    }
    
    fileprivate mutating func makeStoreContent(_ list: FocusStoreList) {
        /*
         self -> x20 -> x28
         list -> x0 -> x26
         */
        // <+320>
        // x20
        var version = DisplayList.Version()
        
        if !list.isEmpty {
            for item in list {
                version.combine(with: item.version)
            }
            
            self.version = version
            
            for item in list {
                // <+540>
                var plist = self.plists[item.propertyID] ?? PropertyList()
                
                // <+636>
                if let update = item.storeUpdateAction.update {
                    update(&plist)
                }
                
                // <+668>
                self.plists[item.propertyID] = plist
                
                // <+896>
                guard
                    item.isFocused,
                    let responder = item.responder,
                    let casted = responder as? ViewResponder
                else {
                    continue
                }
                
                // <+968>
                let box = WeakBox(casted)
                self.focusedResponders.append(box)
            }
        } else {
            self.version = version
        }
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
        fileprivate private(set) var propertyID: ObjectIdentifier // 0x14 (offset field)
        private var bindingUpdateAction: FocusStateBindingUpdateAction
        fileprivate private(set) var storeUpdateAction: FocusStoreUpdateAction // 0x1c (offset field)
        fileprivate private(set) weak var responder: ResponderNode? // 0x20 (offset field)
        private weak var bridge: FocusBridge?
        fileprivate private(set) var isFocused: Bool // 0x28 (offset field)
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

struct FocusStateBindingUpdateAction {
    private let update: () -> Void
}

struct FocusStoreUpdateAction {
    fileprivate let update: ((inout PropertyList) -> Void)?
}
