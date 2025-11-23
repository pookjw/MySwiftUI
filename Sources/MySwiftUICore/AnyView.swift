// 7578D05D331D7F1A2E0C2F8DEF38AAD4

#warning("TODO")
internal import AttributeGraph

@frozen public struct AnyView: PrimitiveView {
    nonisolated var storage: AnyViewStorageBase
    
    public nonisolated init<V>(_ view: V) where V : View {
        let storage: AnyViewStorageBase
        if let anyView = view as? AnyView {
            storage = anyView.storage
        } else {
            storage = AnyViewStorage(view: view)
        }
        self.storage = storage
    }
    
    @_alwaysEmitIntoClient public nonisolated init<V>(erasing view: V) where V : View {
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
}

extension AnyView: DynamicView {
    typealias Metadata = Void
    typealias ID = UniqueID
    
    static nonisolated var canTransition: Bool {
        return false
    }
    
    nonisolated func childInfo(metadata: Void) -> (any Any.Type, UniqueID?) {
        return (storage.childType, nil)
    }
    
    func makeChildView(metadata: Void, view: Attribute<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        return storage.makeChildView(view: view, inputs: inputs)
    }
    
    func makeChildViewList(metadata: Void, view: Attribute<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
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
    
    // $s7SwiftUI14AnyViewStorage33_7578D05D331D7F1A2E0C2F8DEF38AAD4LLC09makeChildD04view6inputsAA01_D7OutputsV14AttributeGraph0U0VyAA0cD0VG_AA01_D6InputsVtF
    override func makeChildView(view: Attribute<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x380
        // x28 = sp + 0x80
        // x19 = sp
        /*
         view = x21
         Content = x23
         */
        // sp + 0x2c0
//        var copy_1 = inputs
        // sp + 0x260
        let copy_2 = inputs
        copy_2.base.pushStableType(Content.self)
        
        // <+156>
        // view = sp + 0x200
        let child = Attribute(AnyViewChild<Content>(view: view))
        child.value = self.view
        let graphValue = _GraphValue(child)
        
        // inlined
        return Content.makeDebuggableView(view: graphValue, inputs: copy_2)
    }
    
    override func makeChildViewList(view: Attribute<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}

fileprivate struct AnyViewChild<Content: View>: CustomStringConvertible, AsyncAttribute, StatefulRule {
    @Attribute private var view: AnyView
    
    init(view: Attribute<AnyView>) {
        self._view = view
    }
    
    typealias Value = Content
    
    var description: String {
        fatalError("TODO")
    }
    
    func updateValue() {
        // x20
        let view = self.view
        
        // x26
        guard let storage = view.storage as? AnyViewStorage<Content> else {
            return
        }
        
        self.value = storage.view
    }
}
