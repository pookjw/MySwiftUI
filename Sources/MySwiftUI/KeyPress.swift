internal import MySwiftUICore
internal import AttributeGraph

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct KeyPress: Sendable {
//    public let phase: KeyPress.Phases
//    public let key: KeyEquivalent
//    public let characters: String
//    public let modifiers: EventModifiers
}

extension KeyPress {
    struct Handler {
        // TODO
    }
}

//@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
//@available(watchOS, unavailable)
//extension KeyPress.Result: Equatable {}
//
//@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
//@available(watchOS, unavailable)
//extension KeyPress.Result: Hashable {}

extension CachedEnvironment.ID {
    static let keyPressHandlers = CachedEnvironment.ID()
}

extension _GraphInputs {
    var keyPressHandlers: Attribute<[KeyPress.Handler]> {
        return mapEnvironment(id: .keyPressHandlers) { environmentValues in
            // $s7SwiftUI12_GraphInputsV16keyPressHandlers09AttributeC00H0VySayAA03KeyF0V7HandlerVGGvgAlA17EnvironmentValuesVcfu_33_0de81da79619839f2a9500fe062d730fAoLTf3nnpk_n
            fatalError("TODO")
        }
    }
}
