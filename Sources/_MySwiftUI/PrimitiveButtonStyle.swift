public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@preconcurrency @MainActor
public protocol PrimitiveButtonStyle {
    associatedtype Body: View

    @ViewBuilder @MainActor @preconcurrency
    func makeBody(configuration: Self.Configuration) -> Self.Body

    typealias Configuration = PrimitiveButtonStyleConfiguration
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PrimitiveButtonStyleConfiguration {
//    @MainActor @preconcurrency
//    public struct Label: View {
//        public nonisolated static func _makeView(
//            view: _GraphValue<PrimitiveButtonStyleConfiguration.Label>,
//            inputs: _ViewInputs
//        ) -> _ViewOutputs {
//            assertUnimplemented()
//        }
//
//        public nonisolated static func _makeViewList(
//            view: _GraphValue<PrimitiveButtonStyleConfiguration.Label>,
//            inputs: _ViewListInputs
//        ) -> _ViewListOutputs {
//            assertUnimplemented()
//        }
//
//        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
//        public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
//            assertUnimplemented()
//        }
//
//        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//        public typealias Body = Never
//    }
//
//    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    public let role: ButtonRole?
//
//    public let label: PrimitiveButtonStyleConfiguration.Label
//
//    public func trigger() {
//        assertUnimplemented()
//    }
}

//@available(*, unavailable)
//extension PrimitiveButtonStyleConfiguration: Sendable {}
//
//@available(*, unavailable)
//extension PrimitiveButtonStyleConfiguration.Label: Sendable {}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension View {
//    public nonisolated func buttonStyle<S>(_ style: S) -> some View where S: PrimitiveButtonStyle {
//        assertUnimplemented()
//    }
//}
//
//@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//extension Button where Label == PrimitiveButtonStyleConfiguration.Label {
//    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
//    public nonisolated init(_ configuration: PrimitiveButtonStyleConfiguration) {
//        assertUnimplemented()
//    }
//}
