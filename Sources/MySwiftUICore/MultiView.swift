package protocol MultiView : View {
}

extension MultiView {
    public nonisolated static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        return self.makeImplicitRoot(view: view, inputs: inputs)
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        return nil
    }
}
