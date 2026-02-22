package import CoreGraphics

package protocol CoreViewRepresentable: View {
    associatedtype PlatformViewProvider
    associatedtype Host
    associatedtype Coordinator
    
    static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        get
    }
    
    static func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy)
    
    func makeViewProvider(context: PlatformViewRepresentableContext<Self>) -> Self.PlatformViewProvider
    func updateViewProvider(_ provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>)
    func resetViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator, destroy: () -> Void)
    static func dismantleViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator)
    static func platformView(for provider: Self.PlatformViewProvider) -> AnyObject
    func makeCoordinator() -> Self.Coordinator
    func sizeThatFits(_ proposedSize: ProposedViewSize, provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>) -> CGSize?
    func overrideSizeThatFits(_ size: inout CGSize, in: ProposedViewSize, platformView: Self.PlatformViewProvider)
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat
    static var isViewController: Bool { get }
    func shouldEagerlyUpdateSafeArea(_ provider: Self.PlatformViewProvider) -> Bool
    func layoutOptions(_ provider: Self.PlatformViewProvider) -> CoreViewRepresentableLayoutOptions
    func _identifiedViewTree(in provider: Self.PlatformViewProvider) -> Any
    func overrideLayoutTraits(_ traits: inout _LayoutTraits, for provider: Self.PlatformViewProvider)
}

extension CoreViewRepresentable {
    package static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        fatalError("TODO")
    }
    
    package func resetViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator, destroy: () -> Void) {
        fatalError("TODO")
    }
    
    package static func dismantleViewProvider(_ provider: Self.PlatformViewProvider, coordinator: Self.Coordinator) {
        fatalError("TODO")
    }
    
    package func sizeThatFits(_ proposedSize: ProposedViewSize, provider: Self.PlatformViewProvider, context: PlatformViewRepresentableContext<Self>) -> CGSize? {
        fatalError("TODO")
    }
    
    package func overrideSizeThatFits(_ size: inout CGSize, in: ProposedViewSize, platformView: Self.PlatformViewProvider) {
        fatalError("TODO")
    }
    
    package func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Self.PlatformViewProvider) -> CGFloat {
        fatalError("TODO")
    }
    
    package static var isViewController: Bool {
        fatalError("TODO")
    }
    
    package func shouldEagerlyUpdateSafeArea(_ provider: Self.PlatformViewProvider) -> Bool {
        fatalError("TODO")
    }
    
    package func layoutOptions(_ provider: Self.PlatformViewProvider) -> CoreViewRepresentableLayoutOptions {
        fatalError("TODO")
    }
    
    package var body: Never {
        fatalError("TODO")
    }
    
    package static nonisolated func _makeView(view: _GraphValue<CoreViewRepresentable>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    package func _unaryViewList<T: View>(view: _GraphValue<T>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    package static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension CoreViewRepresentable where Coordinator == Void {
    package func makeCoordinator() -> Void {
        fatalError("TODO")
    }
}

package struct CoreViewRepresentableDynamicPropertyFields {
    private var base: DynamicPropertyCache.Fields
}

package struct CoreViewRepresentableFeatureBufferProxy {
    private var base: CoreViewRepresentableFeatureBuffer
}

package struct PlatformViewRepresentableContext<T: CoreViewRepresentable> {
    private var values: RepresentableContextValues
    private let coordinator: T.Coordinator
}

package struct CoreViewRepresentableLayoutOptions: OptionSet {
    package let rawValue: Int
    
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

struct CoreViewRepresentableFeatureBuffer {
    private let contents: UnsafeHeterogeneousBuffer
}
