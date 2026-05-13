// 4F6C9EDF4B4BD8C3129AFB2C853C1F78
internal import MySwiftUICore
private import AttributeGraph

struct PlainSectionStyle : SectionStyle {
    func makeBody(configuration: SectionStyleConfiguration) -> some View {
        StyledView(configuration: configuration)
    }
}

fileprivate struct StyledView : PrimitiveView, MultiView {
    private(set) var configuration: SectionStyleConfiguration
    
    nonisolated static func _makeView(view: _GraphValue<StyledView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(view: _GraphValue<StyledView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}
