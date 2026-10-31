public import MySwiftUICore

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct PresentedWindowContent<Data, Content> : View where Data : Decodable, Data : Encodable, Data : Hashable, Content : View {
    private let defaultValue: (() -> Data)? // 0x0
    private let content: (Binding<Data?>) -> Content // 0x10
    
    init(content: @escaping (Binding<Data?>) -> Content) {
        self.defaultValue = nil
        self.content = content
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<PresentedWindowContent<Data, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }

    @available(iOS 16.0, macOS 13.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = Never
}

@available(*, unavailable)
extension PresentedWindowContent : Sendable {}

extension PresentedWindowContent : MultiView {}
extension PresentedWindowContent : PrimitiveView {}
