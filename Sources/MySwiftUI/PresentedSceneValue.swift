// 16926B370582AC5E886A9B0FCFCEA0ED
internal import MySwiftUICore

extension View {
    @inline(always)
    func presentedSceneValue(_ value: AnyHashable?) -> some View {
        return modifier(PresentedSceneValueInputModifier(presentedValue: value))
    }
}

fileprivate struct PresentedSceneValueInputModifier : ViewInputsModifier {
    typealias Body = Never
    
    @safe nonisolated(unsafe) private(set) var presentedValue: AnyHashable?
    
    nonisolated static func _makeViewInputs(modifier: _GraphValue<PresentedSceneValueInputModifier>, inputs: inout _ViewInputs) {
        inputs[PresentedSceneValueInput.self] = modifier.value[keyPath: \.presentedValue]
    }
}

fileprivate struct PresentedSceneValueInput : ViewInput {
    static var defaultValue: AnyHashable? {
        return nil
    }
}
