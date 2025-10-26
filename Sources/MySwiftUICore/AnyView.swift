// 7578D05D331D7F1A2E0C2F8DEF38AAD4

#warning("TODO")
internal import AttributeGraph

@frozen public struct AnyView: PrimitiveView {
    var storage: AnyViewStorageBase
    
    public init<V>(_ view: V) where V : View {
        let storage: AnyViewStorageBase
        if let anyView = view as? AnyView {
            storage = anyView.storage
        } else {
            storage = AnyViewStorage(view: view)
        }
        self.storage = storage
    }
    
    @_alwaysEmitIntoClient public init<V>(erasing view: V) where V : View {
        self.init(view)
    }
    
    public init?(_fromValue value: Any) {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        return makeDynamicView(metadata: (), view: _GraphValue(view.value), inputs: inputs)
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public var body: Never {
        fatalError("body() should not be called on AnyView.")
    }
}

extension AnyView: @preconcurrency DynamicView {
    typealias Metadata = Void
    typealias ID = UniqueID
    
    static nonisolated var canTransition: Bool {
        return false
    }
    
    nonisolated func childInfo(metadata: Void) -> (any Any.Type, UniqueID?) {
        return (storage.childType, nil)
    }
    
    // $s7SwiftUI14AnyViewStorage33_7578D05D331D7F1A2E0C2F8DEF38AAD4LLC09makeChildD04view6inputsAA01_D7OutputsV14AttributeGraph0U0VyAA0cD0VG_AA01_D6InputsVtF
    nonisolated func makeChildView(metadata: Void, view: Attribute<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    nonisolated func makeChildViewList(metadata: Void, view: Attribute<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension AnyView: Sendable {}

@usableFromInline class AnyViewStorageBase {
    fileprivate var childType: any Any.Type {
        fatalError() // abstract
    }
    
    fileprivate func makeChildView(view: Attribute<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError() // abstract
    }
    
    fileprivate func makeChildViewList(view: Attribute<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError() // abstract
    }
    
    fileprivate func visitContent<T: ViewVisitor>(_ visitor: inout T) {
        fatalError() // abstract
    }
    
    fileprivate var content: any View {
        fatalError() // abstract
    }
}

@available(*, unavailable)
extension AnyViewStorageBase: Sendable {}

fileprivate final class AnyViewStorage<Content: View>: AnyViewStorageBase {
    let view: Content
    
    init(view: Content) {
        self.view = view
    }
    
    override var content: any View {
        return view
    }
    
    override var childType: any Any.Type {
        return Content.self
    }
    
    override func visitContent<T>(_ visitor: inout T) where T : ViewVisitor {
        fatalError("TODO")
    }
    
    override func makeChildView(view: Attribute<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    override func makeChildViewList(view: Attribute<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}
