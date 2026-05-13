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
        /*
         view -> x0 -> x20
         inputs -> x1 -> x19
         */
        let body = SectionBody(view: view.value)
        let bodyAttribute = Attribute(body)
        let bodyValue = _GraphValue(bodyAttribute)
        let outputs = _VariadicView.Tree<SectionContainer, _ConditionalContent<SectionStyleConfiguration.RawContent, EmptyView>>.makeDebuggableViewList(view: bodyValue, inputs: inputs)
        return outputs
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct SectionContainer : _VariadicView_MultiViewRoot {
    private(set) var parent: SectionStyleConfiguration.Header
    private(set) var footer: SectionStyleConfiguration.Footer
    
    nonisolated static func _makeView(root: _GraphValue<SectionContainer>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(root: _GraphValue<SectionContainer>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        let parentValue = root[{ .of(&$0.parent)} ]
        let footerValue = root[{ .of(&$0.footer)} ]
        let outputs = _ViewListOutputs.groupViewList(parent: parentValue, footer: footerValue.value, inputs: inputs, body: body)
        return outputs
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

fileprivate struct SectionBody : Rule {
    @Attribute var view: StyledView
    
    var value: _VariadicView.Tree<SectionContainer, _ConditionalContent<SectionStyleConfiguration.RawContent, EmptyView>> {
        assertUnimplemented()
    }
}
