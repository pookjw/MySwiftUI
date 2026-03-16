public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@preconcurrency @MainActor
public protocol ToggleStyle {
    associatedtype Body: View
    
    @ViewBuilder @MainActor @preconcurrency
    func makeBody(configuration: Self.Configuration) -> Self.Body
    
    typealias Configuration = ToggleStyleConfiguration
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ToggleStyleConfiguration {
//    @MainActor @preconcurrency
//    public struct Label: View {
//        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//        public typealias Body = Never
//    }
//    
//    public let label: ToggleStyleConfiguration.Label
//    
////    @Binding
////    @_projectedValueProperty($isOn)
//    public var isOn: Bool {
//        get {
//            assertUnimplemented()
//        }
//        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//        nonmutating set {
//            assertUnimplemented()
//        }
//    }
//    
//    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
//    public var isMixed: Bool
}

//@available(*, unavailable)
//extension ToggleStyleConfiguration: Sendable {}
//
//@available(*, unavailable)
//extension ToggleStyleConfiguration.Label: Sendable {}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension View {
//    nonisolated public func toggleStyle<S>(_ style: S) -> some View where S: ToggleStyle {
//        assertUnimplemented()
//    }
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Toggle where Label == ToggleStyleConfiguration.Label {
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    nonisolated public init(_ configuration: ToggleStyleConfiguration) {
//        assertUnimplemented()
//    }
//}
//
//extension ToggleStyleConfiguration: /*ViewAlias,*/ PrimitiveView {}
