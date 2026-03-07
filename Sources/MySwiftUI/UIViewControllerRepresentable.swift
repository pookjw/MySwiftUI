// F0196C17270D74A1F1A35F1926215FB3
@_spi(Internal) public import MySwiftUICore
public import UIKit
private import AttributeGraph
private import os.log

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public protocol UIViewControllerRepresentable: View where Body == Never {
    associatedtype UIViewControllerType: UIViewController
    @MainActor @preconcurrency func makeUIViewController(context: Self.Context) -> Self.UIViewControllerType
    @MainActor @preconcurrency func updateUIViewController(_ uiViewController: Self.UIViewControllerType, context: Self.Context)
    @MainActor @preconcurrency static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator)
    associatedtype Coordinator = Void
    @MainActor @preconcurrency func makeCoordinator() -> Self.Coordinator
    @available(iOS 16.0, tvOS 16.0, *)
    @MainActor @preconcurrency func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: Self.UIViewControllerType, context: Self.Context) -> CGSize?
    @MainActor @preconcurrency func _identifiedViewTree(in uiViewController: Self.UIViewControllerType) -> _IdentifiedViewTree
    @available(iOS 17.0, tvOS 17.0, *)
    @MainActor @preconcurrency static func _layoutOptions(_ provider: Self.UIViewControllerType) -> Self.LayoutOptions
    typealias Context = UIViewControllerRepresentableContext<Self>
    @available(iOS 17.0, tvOS 17.0, *)
    typealias LayoutOptions = _PlatformViewRepresentableLayoutOptions
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable where Self.Coordinator == () {
    @MainActor @preconcurrency public func makeCoordinator() -> Self.Coordinator {
        return ()
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewControllerRepresentable {
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor @preconcurrency public func _resetUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator, destroy: () -> Void) {
        fatalError("TODO")
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, *)
    @MainActor @preconcurrency public func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: Self.UIViewControllerType, context: Self.Context) -> CGSize? {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator) {
        fatalError("TODO")
    }
    
    public nonisolated static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - 0xb0
         inputs -> x1 -> x21
         return pointer -> x8 -> x29 - 0x80
         */
        // <+380>
        if IsInHostingConfiguration.evaluate(inputs: inputs.base) {
            // <+444>
            Log.externalWarning("\(self) is a UIViewControllerRepresentable. UIViewControllerRepresentable is not supported inside of UIHostingConfiguration.")
            
            var outputs = _ViewOutputs()
            
            if inputs.preferences.contains(DisplayList.Key.self) {
                let displayList = UnsupportedDisplayList(
                    identity: inputs.pushIdentity(),
                    position: inputs.animatedPosition(),
                    size: inputs.animatedSize(),
                    containerPosition: inputs.containerPosition
                )
                
                outputs[DisplayList.Key.self] = Attribute(displayList)
            }
            
            return outputs
        } else {
            // <+884>
            precondition(
                (isLinkedOnOrAfter(.v4) ? TypeID(self).isValueType : true),
                "UIViewControllerRepresentables must be value types: \(self)"
            )
            
            let casted = view.unsafeBitCast(to: PlatformViewControllerRepresentableAdaptor<Self>.self)
            var outputs = MainActor.assumeIsolated { [unchecked = UncheckedSendable((casted, inputs))] in
                return UncheckedSendable(PlatformViewControllerRepresentableAdaptor<Self>.makeDebuggableView(view: unchecked.value.0, inputs: unchecked.value.1))
            }.value
            
            outputs.preferences.makePreferenceWriter(inputs: inputs.preferences, key: HostingGestureOverlayAuthorityKey.self, value: {
                // $s7SwiftUI28ManipulableResponderModifierV9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyACG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VySbGyXEfu_TA
                fatalError("TODO")
            }())
            
            return outputs
        }
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public func _identifiedViewTree(in uiViewController: Self.UIViewControllerType) -> _IdentifiedViewTree {
        fatalError("TODO")
    }
    
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @preconcurrency public static func _layoutOptions(_ provider: Self.UIViewControllerType) -> Self.LayoutOptions {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public var body: Never {
        fatalError("TODO")
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct UIViewControllerRepresentableContext<Representable> where Representable: UIViewControllerRepresentable {
    @MainActor @preconcurrency public let coordinator: Representable.Coordinator
    
    @MainActor @preconcurrency public var transaction: Transaction {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public var environment: EnvironmentValues {
        fatalError("TODO")
    }
    
    @available(iOS 18.0, tvOS 18.0, visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor @preconcurrency public func animate(changes: () -> Void, completion: (() -> Void)? = nil) {
        fatalError("TODO")
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension UIViewControllerRepresentableContext: Sendable {}

fileprivate struct UnsupportedDisplayList: Rule {
    private(set) var identity: _DisplayList_Identity
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var containerPosition: CGPoint
    
    var value: DisplayList {
        fatalError("TODO")
    }
}

struct PlatformViewControllerRepresentableAdaptor<Base: UIViewControllerRepresentable>: @MainActor PlatformViewRepresentable {
    typealias PlatformViewProvider = Base.UIViewControllerType
    typealias Host = UIKitPlatformViewHost<Self>
    typealias Coordinator = Base.Coordinator
    
    fileprivate private(set) var base: Base
    
    static var dynamicProperties: CoreViewRepresentableDynamicPropertyFields {
        fatalError("TODO")
    }
    
    static func appendFeature(to proxy: inout CoreViewRepresentableFeatureBufferProxy) {
        fatalError("TODO")
    }
    
    func makeViewProvider(context: PlatformViewRepresentableContext<Self>) -> Base.UIViewControllerType {
        fatalError("TODO")
    }
    
    func updateViewProvider(_ provider: Base.UIViewControllerType, context: PlatformViewRepresentableContext<Self>) {
        fatalError("TODO")
    }
    
    static func platformView(for provider: Base.UIViewControllerType) -> AnyObject {
        fatalError("TODO")
    }
    
    func sizeThatFits(
        _ proposedSize: ProposedViewSize,
        provider: Base.UIViewControllerType,
        context: PlatformViewRepresentableContext<Self>
    ) -> CGSize? {
        fatalError("TODO")
    }
    
    func overrideSizeThatFits(_ size: inout CGSize, in proposedSize: ProposedViewSize, platformView: Base.UIViewControllerType) {
        fatalError("TODO")
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D, provider: Base.UIViewControllerType) -> CGFloat {
        fatalError("TODO")
    }
    
    static func shouldEagerlyUpdateSafeArea(_ provider: Base.UIViewControllerType) -> Bool {
        fatalError("TODO")
    }
    
    static func layoutOptions(_ provider: Base.UIViewControllerType) -> CoreViewRepresentableLayoutOptions {
        fatalError("TODO")
    }
    
    func _identifiedViewTree(in provider: Base.UIViewControllerType) -> Any {
        fatalError("TODO")
    }
    
    func overrideLayoutTraits(_ traits: inout _LayoutTraits, for provider: Base.UIViewControllerType) {
        fatalError("TODO")
    }
    
    nonisolated static func _makeView(view: _GraphValue<PlatformViewControllerRepresentableAdaptor<Base>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    var body: Never {
        fatalError("TODO")
    }
    
    static func modifyBridgedViewInputs(_ inputs: inout MySwiftUICore._ViewInputs) {
        fatalError("TODO")
    }
    
    func makeCoordinator() -> Base.Coordinator {
        fatalError("TODO")
    }
}
