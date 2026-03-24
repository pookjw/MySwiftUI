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
        assertUnimplemented()
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, *)
    @MainActor @preconcurrency public func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: Self.UIViewControllerType, context: Self.Context) -> CGSize? {
        return nil
    }
    
    @MainActor @preconcurrency public static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator) {
        // nop
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
            
            if unsafe inputs.preferences.contains(DisplayList.Key.self) {
                let displayList = UnsupportedDisplayList(
                    identity: inputs.pushIdentity(),
                    position: inputs.animatedPosition(),
                    size: inputs.animatedSize(),
                    containerPosition: inputs.containerPosition
                )
                
                unsafe outputs[DisplayList.Key.self] = Attribute(displayList)
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
                return inputs.intern(true, id: .trueValue)
            }())
            
            return outputs
        }
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func _identifiedViewTree(in uiViewController: Self.UIViewControllerType) -> _IdentifiedViewTree {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @preconcurrency public static func _layoutOptions(_ provider: Self.UIViewControllerType) -> Self.LayoutOptions {
        return _PlatformViewRepresentableLayoutOptions(rawValue: CoreViewRepresentableLayoutOptions.default.rawValue)
    }
    
    @MainActor @preconcurrency public var body: Never {
        assertUnimplemented()
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct UIViewControllerRepresentableContext<Representable> where Representable: UIViewControllerRepresentable {
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
extension UIViewControllerRepresentableContext: Sendable {}

fileprivate struct UnsupportedDisplayList: Rule {
    private(set) var identity: _DisplayList_Identity
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var containerPosition: CGPoint
    
    var value: DisplayList {
        assertUnimplemented()
    }
}
