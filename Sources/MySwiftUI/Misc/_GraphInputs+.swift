internal import MySwiftUICore
internal import AttributeGraph

extension _GraphInputs {
    struct IsFocusSystemEnabledKey: @unsafe ViewInput {
        static nonisolated(unsafe) let defaultValue = OptionalAttribute<Bool>()
    }
}
