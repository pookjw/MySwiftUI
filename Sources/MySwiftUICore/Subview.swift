@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct Subview : View, Identifiable {
    public struct ID : Hashable {
        public static func == (a: Subview.ID, b: Subview.ID) -> Bool {
            assertUnimplemented()
        }

        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }

        public var hashValue: Int {
            assertUnimplemented()
        }
    }

    public var id: Subview.ID {
        assertUnimplemented()
    }

    public var containerValues: ContainerValues {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(view: _GraphValue<Subview>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _makeViewList(view: _GraphValue<Subview>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension Subview : Sendable {}

@available(*, unavailable)
extension Subview.ID : Sendable {}

extension Subview : UnaryView, PrimitiveView {}
