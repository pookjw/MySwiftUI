private import MySwiftUICore

struct SectionStyleConfiguration {
    let header = SectionStyleConfiguration.Header()
    let footer = SectionStyleConfiguration.Footer()
    private(set) var actions = SectionStyleConfiguration.Actions()
    let rawContent = SectionStyleConfiguration.RawContent()
    private(set) var isExpanded: Binding<Bool>?
}

extension SectionStyleConfiguration {
    struct RawContent : ViewAlias {
    }
    
    struct Footer : ViewAlias {
    }
    
    struct Header : ViewAlias {
    }

    struct Actions : ViewAlias {
    }
}
