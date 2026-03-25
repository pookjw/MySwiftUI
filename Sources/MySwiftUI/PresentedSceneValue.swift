// 16926B370582AC5E886A9B0FCFCEA0ED
internal import MySwiftUICore

extension View {
    @inline(always)
    func presentedSceneValue(_ value: AnyHashable?) -> some View {
        return modifier(PresentedSceneValueInputModifier(presentedValue: value))
    }
}

fileprivate struct PresentedSceneValueInputModifier: ViewInputsModifier {
    typealias Body = Never
    
    private(set) var presentedValue: AnyHashable?
    
    static func _makeViewInputs(modifier: MySwiftUICore._GraphValue<PresentedSceneValueInputModifier>, inputs: inout MySwiftUICore._ViewInputs) {
        assertUnimplemented()
    }
}
