#warning("TODO")
internal import MySwiftUICore

public struct ActionSheet {
    
}

extension ActionSheet {
    struct Presentation: AlertControllerConvertible {
        
    }
}

extension ActionSheet.Presentation {
    struct Key: HostPreferenceKey {
        typealias Value = ActionSheet.Presentation?
    }
}
