// 8F31ED3737048FE14E730EE04503F67D
internal import AttributeGraph

public struct DebugReplaceableView : PrimitiveView {
    nonisolated let storage: DebugReplaceableViewStorageBase
    
    @_alwaysEmitIntoClient  @_documentation(visibility: private) public init<V>(erasing view: V) where V : View {
        assertUnimplemented()
    }
    
    @_alwaysEmitIntoClient @_documentation(visibility: private) public init<V>(_ view: V) where V : View {
        self.init(_erasing: view)
    }
    
    @usableFromInline
    init<V>(_erasing view: V) where V : View {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(view: _GraphValue<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated func visitContent<T : ViewVisitor>(_ visitor: inout T) {
        assertUnimplemented()
    }
    
    nonisolated static func invalidateEverything() {
        assertUnimplemented()
    }
}

extension DebugReplaceableView : DynamicView {
    typealias Metadata = Void
    typealias ID = UniqueID

    nonisolated static var canTransition: Bool {
        assertUnimplemented()
    }

    nonisolated func childInfo(metadata: Void) -> (Any.Type, UniqueID?) {
        assertUnimplemented()
    }

    nonisolated func makeChildView(metadata: Void, view: Attribute<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }

    nonisolated func makeChildViewList(metadata: Void, view: Attribute<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

@usableFromInline class DebugReplaceableViewStorageBase {
    fileprivate var childType: any Any.Type {
        fatalError() // abstract
    }
    
    fileprivate func makeChildView(view: Attribute<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError() // abstract
    }
    
    fileprivate func makeChildViewList(view: Attribute<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError() // abstract
    }
    
    fileprivate func visitContent<T : ViewVisitor>(_ visitor: inout T) {
        fatalError() // abstract
    }
    
    init() {}
}

@available(*, unavailable)
extension DebugReplaceableViewStorageBase : Sendable {}

fileprivate final class DebugReplaceableViewStorage<Content : View> : DebugReplaceableViewStorageBase {
    let view: Content
    
    init(view: Content) {
        self.view = view
    }
    
    override var childType: any Any.Type {
        assertUnimplemented()
    }
    
    override func makeChildView(view: Attribute<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    override func makeChildViewList(view: Attribute<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    override func visitContent<T>(_ visitor: inout T) where T : ViewVisitor {
        assertUnimplemented()
    }
}

/*
 counting -> (value, 0)
 uninitialized -> (0, 1)
 indeterminate -> (1, 1)
 */
enum DebugReplaceableViewCount {
    case counting(Int)
    case uninitialized
    case indeterminate
}

fileprivate struct DebugReplaceableViewChild<Content> : StatefulRule, AsyncAttribute {
    typealias Value = Void
    
    func updateValue() {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension DebugReplaceableView : Sendable {}
