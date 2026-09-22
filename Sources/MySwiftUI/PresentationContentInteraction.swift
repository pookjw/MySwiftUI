@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
public struct PresentationContentInteraction : Equatable, Sendable {
    private var kind: PresentationContentInteraction.Kind
    
    public static var automatic: PresentationContentInteraction {
        return PresentationContentInteraction(kind: .automatic)
    }
    
    public static var resizes: PresentationContentInteraction {
        return PresentationContentInteraction(kind: .resize)
    }
    
    public static var scrolls: PresentationContentInteraction {
        return PresentationContentInteraction(kind: .scroll)
    }
}

extension PresentationContentInteraction {
    enum Kind : Hashable {
        case automatic
        case resize
        case scroll
    }
}
