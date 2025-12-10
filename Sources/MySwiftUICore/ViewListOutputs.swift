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
    
    static func nonEmptyParentViewList(inputs: _ViewListInputs) -> _ViewListOutputs {
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
    // TODO
}

class _ViewList_ID_Views {
    private let isDataDependent: Bool
    
    init() {
        fatalError("TODO")
    }
    
    // TODO
}
