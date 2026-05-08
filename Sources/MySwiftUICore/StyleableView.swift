package protocol StyleableView : View {
    associatedtype Configuration
    associatedtype DefaultStyleModifier
    
    var configuration: Self.Configuration {
        get
    }
    
    static var defaultStyleModifier: Self.DefaultStyleModifier {
        get
    }
    
    static var isScrapeable: Bool {
        get
    }
    
    var scrapeableContent: ScrapeableContent.Content? {
        get
    }
}

extension StyleableView {
    package static var isScrapeable: Bool {
        return false
    }
    
    package var scrapeableContent: ScrapeableContent.Content? {
        assertUnimplemented()
    }
    
    package var body: some View {
        assertUnimplemented()
    }
    
    nonisolated package static func _makeView(view: _GraphValue<StyleableView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated package static func _makeViewList(view: _GraphValue<StyleableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated package static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
}
