// 19642D833A8FE469B137699ED1426762
@_spi(Internal) public import MySwiftUICore
public import UIKit
private import AttributeGraph

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public protocol UIViewRepresentable : View where Body == Never {
    associatedtype UIViewType : UIView
    @MainActor @preconcurrency func makeUIView(context: Self.Context) -> Self.UIViewType
    @MainActor @preconcurrency func updateUIView(_ uiView: Self.UIViewType, context: Self.Context)
    @MainActor @preconcurrency static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator)
    associatedtype Coordinator = Void
    @MainActor @preconcurrency func makeCoordinator() -> Self.Coordinator
    @MainActor @preconcurrency func _identifiedViewTree(in uiView: Self.UIViewType) -> _IdentifiedViewTree
    @available(iOS 16.0, tvOS 16.0, *)
    @MainActor @preconcurrency func sizeThatFits(_ proposal: ProposedViewSize, uiView: Self.UIViewType, context: Self.Context) -> CGSize?
    @MainActor @preconcurrency func _overrideSizeThatFits(_ size: inout CGSize, in proposedSize: _ProposedSize, uiView: Self.UIViewType)
    @MainActor @preconcurrency func _overrideLayoutTraits(_ layoutTraits: inout _LayoutTraits, for uiView: Self.UIViewType)
    @available(iOS 15.0, tvOS 15.0, *)
    @MainActor @preconcurrency static func _modifyBridgedViewInputs(_ inputs: inout _ViewInputs)
    @available(iOS 17.0, tvOS 17.0, *)
    @MainActor @preconcurrency static func _layoutOptions(_ provider: Self.UIViewType) -> Self.LayoutOptions
    typealias Context = UIViewRepresentableContext<Self>
    @available(iOS 17.0, tvOS 17.0, *)
    typealias LayoutOptions = _PlatformViewRepresentableLayoutOptions
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable where Self.Coordinator == () {
    @MainActor @preconcurrency public func makeCoordinator() -> Self.Coordinator {
        return ()
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable {
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor @preconcurrency public func _resetUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator, destroy: () -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) {
        // nop
    }
    
    nonisolated public static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        precondition(
            (isLinkedOnOrAfter(.v4) ? TypeID(self).isValueType : true),
            "UIViewRepresentables must be value types: \(self)"
        )
        
        let casted = view.unsafeBitCast(to: PlatformViewRepresentableAdaptor<Self>.self)
        
        return MainActor.assumeIsolated { [unchecked = UncheckedSendable((casted, inputs))] in
            return UncheckedSendable(PlatformViewRepresentableAdaptor<Self>.makeDebuggableView(view: unchecked.value.0, inputs: unchecked.value.1))
        }.value
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return _ViewListOutputs.unaryViewList(view: view, inputs: inputs)
    }
    
    @MainActor @preconcurrency public func _identifiedViewTree(in uiView: Self.UIViewType) -> _IdentifiedViewTree {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, *)
    @available(macOS, unavailable)
    @MainActor @preconcurrency public func sizeThatFits(_ proposal: ProposedViewSize, uiView: Self.UIViewType, context: Self.Context) -> CGSize? {
        return nil
    }
    
    @MainActor @preconcurrency public func _overrideSizeThatFits(_ size: inout CGSize, in proposedSize: _ProposedSize, uiView: Self.UIViewType) {
        // nop
    }
    
    @MainActor @preconcurrency public func _overrideLayoutTraits(_ layoutTraits: inout _LayoutTraits, for uiView: Self.UIViewType) {
        // nop
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor @preconcurrency public static func _modifyBridgedViewInputs(_ inputs: inout _ViewInputs) {
        // nop
    }
    
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @preconcurrency public static func _layoutOptions(_ provider: Self.UIViewType) -> Self.LayoutOptions {
        return _PlatformViewRepresentableLayoutOptions(rawValue: CoreViewRepresentableLayoutOptions.default.rawValue)
    }
    
    @MainActor @preconcurrency public var body: Never {
        assertUnimplemented()
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable {
    @MainActor @preconcurrency public let coordinator: Representable.Coordinator
    
    @MainActor @preconcurrency public var transaction: Transaction {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var environment: EnvironmentValues {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 18.0, visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor @preconcurrency public func animate(changes: () -> Void, completion: (() -> Void)? = nil) {
        assertUnimplemented()
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension UIViewRepresentableContext : Sendable {}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
fileprivate struct PlatformViewRepresentableAdaptor<Base : UIViewRepresentable>: @MainActor PlatformViewRepresentable {
    typealias PlatformViewProvider = Base.UIViewType
    typealias Host = UIKitPlatformViewHost<Self>
    typealias Coordinator = Base.Coordinator
    
    private(set) var base: Base
    
    static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        return CoreViewRepresentableDynamicPropertyFields(for: Base.self)
    }
    
    func makeViewProvider(context: PlatformViewRepresentableContext<Self>) -> Base.UIViewType {
        let repContext = UIViewRepresentableContext<Base>(coordinator: context.coordinator)
        let uiView = base.makeUIView(context: repContext)
        return uiView
    }
    
    func updateViewProvider(_ provider: Base.UIViewType, context: PlatformViewRepresentableContext<Self>) {
        let repContext = UIViewRepresentableContext<Base>(coordinator: context.coordinator)
        base.updateUIView(provider, context: repContext)
    }
    
    func resetViewProvider(_ provider: Base.UIViewType, coordinator: Base.Coordinator, destroy: () -> Void) {
        assertUnimplemented()
    }
    
    static func dismantleViewProvider(_ provider: Base.UIViewType, coordinator: Base.Coordinator) {
        Base.dismantleUIView(provider, coordinator: coordinator)
    }
    
    func makeCoordinator() -> Base.Coordinator {
        return base.makeCoordinator()
    }
    
    func _identifiedViewTree(in provider: Base.UIViewType) -> Any {
        assertUnimplemented()
    }
    
    func sizeThatFits(
        _ proposedSize: ProposedViewSize,
        provider: Base.UIViewType,
        context: PlatformViewRepresentableContext<Self>
    ) -> CGSize? {
        let repContext = UIViewRepresentableContext<Base>(coordinator: context.coordinator)
        return base.sizeThatFits(proposedSize, uiView: provider, context: repContext)
    }
    
    func overrideSizeThatFits(_ size: inout CGSize, in proposedSize: ProposedViewSize, platformView: Base.UIViewType) {
        /*
         size -> x0 -> x26
         proposedSize -> x1/w2/x3/w4 -> x25/w24/x23/w22
         platformView -> x5 -> x20
         */
        base._overrideSizeThatFits(&size, in: _ProposedSize(proposedSize), uiView: platformView)
    }
    
    func overrideLayoutTraits(_ traits: inout _LayoutTraits, for provider: Base.UIViewType) {
        base._overrideLayoutTraits(&traits, for: provider)
    }
    
    nonisolated static func modifyBridgedViewInputs(_ inputs: inout _ViewInputs) {
        // FIXME
        inputs = MainActor.assumeIsolated { [unchecked = UncheckedSendable(inputs)] in
            var copy = unchecked.value
            Base._modifyBridgedViewInputs(&copy)
            return UncheckedSendable(copy)
        }.value
    }
    
    static func layoutOptions(_ provider: Base.UIViewType) -> CoreViewRepresentableLayoutOptions {
        let options = Base._layoutOptions(provider)
        return CoreViewRepresentableLayoutOptions(rawValue: options.rawValue)
    }
    
    static func platformView(for provider: Base.UIViewType) -> AnyObject {
        return provider
    }
}
