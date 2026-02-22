// 19642D833A8FE469B137699ED1426762
public import MySwiftUICore
public import UIKit
private import AttributeGraph

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public protocol UIViewRepresentable: View where Body == Never {
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
        fatalError("TODO")
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
extension UIViewRepresentable {
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor @preconcurrency public func _resetUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator, destroy: () -> Void) {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public static func dismantleUIView(_ uiView: Self.UIViewType, coordinator: Self.Coordinator) {
        fatalError("TODO")
    }
    
    public nonisolated static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        precondition(
            {
                guard isLinkedOnOrAfter(.v4) else {
                    return true
                }
                
                return TypeID(self).isValueType
            }(),
            "UIViewRepresentables must be value types: \(self)"
        )
        
        fatalError("TODO")
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public func _identifiedViewTree(in uiView: Self.UIViewType) -> _IdentifiedViewTree {
        fatalError("TODO")
    }
    
    @available(iOS 16.0, tvOS 16.0, watchOS 9.0, *)
    @available(macOS, unavailable)
    @MainActor @preconcurrency public func sizeThatFits(_ proposal: ProposedViewSize, uiView: Self.UIViewType, context: Self.Context) -> CGSize? {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public func _overrideSizeThatFits(_ size: inout CGSize, in proposedSize: _ProposedSize, uiView: Self.UIViewType) {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public func _overrideLayoutTraits(_ layoutTraits: inout _LayoutTraits, for uiView: Self.UIViewType) {
        fatalError("TODO")
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor @preconcurrency public static func _modifyBridgedViewInputs(_ inputs: inout _ViewInputs) {
        fatalError("TODO")
    }
    
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @preconcurrency public static func _layoutOptions(_ provider: Self.UIViewType) -> Self.LayoutOptions {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public var body: Never {
        fatalError("TODO")
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable {
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
extension UIViewRepresentableContext: Sendable {}

//fileprivate struct PlatformViewRepresentableAdaptor<T>: PlatformViewRepresentable {
//    
//}
