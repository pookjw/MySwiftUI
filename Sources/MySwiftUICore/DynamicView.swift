#warning("TODO")
internal import AttributeGraph

protocol DynamicView: View {
    associatedtype Metadata
    associatedtype ID
    
    static var canTransition: Bool {
        get
    }
    
    static var traitKeysDependOnView: Bool {
        get
    }
    
    static func makeID() -> ID
    
    func childInfo(metadata: Metadata) -> (Any.Type, ID?)
    
    func makeChildView(metadata: Metadata, view: Attribute<Self>, inputs: _ViewInputs) -> _ViewOutputs
    
    func makeChildViewList(metadata: Metadata, view: Attribute<Self>, inputs: _ViewListInputs) -> _ViewListOutputs
}

extension DynamicView {
    static func makeDynamicView(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static func makeDynamicViewList(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    static var traitKeysDependOnView: Bool {
        fatalError("TODO")
    }
}

extension DynamicView where ID == UniqueID {
    static func makeID() -> UniqueID {
        return UniqueID()
    }
}
