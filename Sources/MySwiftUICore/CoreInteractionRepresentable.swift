@_spi(Internal) public protocol CoreInteractionRepresentable {
    associatedtype InteractionView : CoreInteractionView
    
    static func appendFeature(to: inout CoreInteractionRepresentableFeatureBufferProxy)
    
    func appendInteractions(to: inout CoreInteractionRepresentableInteractionsProxy)
    
    func updateInteraction(_ interaction: AnyObject, tag: Int)
}

@_spi(Internal) public protocol CoreInteractionView {
    var coreInteractions: CoreInteractionRepresentableInteractionsProxy { get set }
    
    init(coreInteractions: CoreInteractionRepresentableInteractionsProxy)
    
    func coreAddInteraction(_ interaction: AnyObject)
    func coreRemoveInteraction(_ interaction: AnyObject)
    func coreSetParentGestureContainerProxy(_ proxy: CoreInteractionViewParentGestureContainerProxy)
}

extension CoreInteractionView {
    package func coreRemoveInteraction(_ interaction: AnyObject) {
        assertUnimplemented()
    }
    
    package func coreSetParentGestureContainerProxy(_ proxy: CoreInteractionViewParentGestureContainerProxy) {
        assertUnimplemented()
    }
}

protocol CoreInteractionRepresentableFeature {
    func modifyViewInputs<T : CoreInteractionRepresentable>(inputs: inout _ViewInputs, proxy: CoreInteractionRepresentableFeatureProxy<T>)
    func modifyViewOutputs<T : CoreInteractionRepresentable>(inputs: _ViewInputs, outputs: inout _ViewOutputs, proxy: CoreInteractionRepresentableFeatureProxy<T>)
}

extension CoreInteractionRepresentableFeature {
    func modifyViewInputs<T : CoreInteractionRepresentable>(inputs: inout _ViewInputs, proxy: CoreInteractionRepresentableFeatureProxy<T>) {
        assertUnimplemented()
    }

    func modifyViewOutputs<T : CoreInteractionRepresentable>(inputs: _ViewInputs, outputs: inout _ViewOutputs, proxy: CoreInteractionRepresentableFeatureProxy<T>) {
        assertUnimplemented()
    }
}

@_spi(Internal) public struct CoreInteractionRepresentableFeatureBufferProxy {
    private var base: CoreInteractionRepresentableFeatureBuffer
    
    mutating func append<T : CoreInteractionRepresentableFeature>(_ feature: T) {
        assertUnimplemented()
    }
}

struct CoreInteractionRepresentableFeatureBuffer : Sequence, Collection {
    fileprivate class VTable : _UnsafeHeterogeneousBuffer_VTable {
        // TODO
    }
    
    fileprivate class _VTable<T> : VTable where T : CoreInteractionRepresentableFeature {
        // TODO
    }
    
    struct Element {
        private var base: _UnsafeHeterogeneousBuffer_Element

        func modifyViewInputs<T : CoreInteractionRepresentable>(inputs: inout _ViewInputs, proxy: CoreInteractionRepresentableFeatureProxy<T>) {
            assertUnimplemented()
        }
        
        func modifyViewOutputs<T : CoreInteractionRepresentable>(inputs: _ViewInputs, outputs: inout _ViewOutputs, proxy: CoreInteractionRepresentableFeatureProxy<T>) {
            assertUnimplemented()
        }
    }
    
    init() {
        assertUnimplemented()
    }
    
    var isEmpty: Bool {
        assertUnimplemented()
    }
    
    mutating func append<T : CoreInteractionRepresentableFeature>(_ feature: T) -> UnsafeHeterogeneousBuffer.Index {
        assertUnimplemented()
    }
    
    mutating func destroy() {
        assertUnimplemented()
    }
    
    var startIndex: UnsafeHeterogeneousBuffer.Index {
        assertUnimplemented()
    }
    
    var endIndex: UnsafeHeterogeneousBuffer.Index {
        assertUnimplemented()
    }
    
    func index(after i: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        assertUnimplemented()
    }
    
    func formIndex(after i: inout UnsafeHeterogeneousBuffer.Index) {
        assertUnimplemented()
    }
    
    subscript(position: UnsafeHeterogeneousBuffer.Index) -> Element {
        get {
            assertUnimplemented()
        }
    }
    
    subscript<T : CoreInteractionRepresentable>(_ type: T.Type) -> UnsafeMutablePointer<T>? {
        get {
            assertUnimplemented()
        }
    }
}

@_spi(Internal) public struct CoreInteractionViewParentGestureContainerProxy {
    var parentGestureContainer: AnyObject? {
        assertUnimplemented()
    }
}

struct CoreInteractionRepresentableFeatureProxy<T : CoreInteractionRepresentable> {
    // TODO
}

struct AnyCoreInteractionHelper {
    init<T : CoreInteractionRepresentable, U : Hashable>(for type: T.Type, idType: U.Type) {
        assertUnimplemented()
    }
}

@_spi(Internal) public struct CoreInteractionRepresentableInteractionsProxy {
    struct Interaction {
        private(set) var base: AnyObject
        private(set) var tag: Int
    }
    
    private(set) var interactions: [CoreInteractionRepresentableInteractionsProxy.Interaction]
    
    package init() {
        assertUnimplemented()
    }
    
    package mutating func append(interaction: AnyObject, tag: Int) {
        assertUnimplemented()
    }
}

extension CoreInteractionRepresentable {
    package static func appendFeature(to: inout CoreInteractionRepresentableFeatureBufferProxy) {
        assertUnimplemented()
    }
    
    package func appendInteractions(to: inout CoreInteractionRepresentableInteractionsProxy) {
        assertUnimplemented()
    }
    
    package func updateInteraction(_ interaction: AnyObject, tag: Int) {
        assertUnimplemented()
    }
}

extension View {
    package func coreInteractionRepresentable<T : CoreInteractionRepresentable>(_ representable: T) -> some View {
        self.modifier(
            CoreInteractionRepresentableModifier<T, Int>(
                representable: representable,
                id: -1
            )
        )
    }
    
    package func coreInteractionRepresentable<T : CoreInteractionRepresentable, U : Hashable>(_ representable: T, id: U) -> some View {
        self.modifier(
            CoreInteractionRepresentableModifier<T, U>(
                representable: representable,
                id: id
            )
        )
    }
}

struct CoreInteractionRepresentableModifier<T, U> : ViewModifier {
    private var representable: T?
    private var id: U
    
    init(representable: T?, id: U) {
        assertUnimplemented()
    }

    nonisolated static func _makeView(modifier: _GraphValue<CoreInteractionRepresentableModifier<T, U>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}
