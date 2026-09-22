@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
public struct PresentationAdaptation : Sendable {
    private var kind: PresentationAdaptation.Kind
    
    public static var automatic: PresentationAdaptation {
        return PresentationAdaptation(kind: .automatic)
    }
    
    public static var none: PresentationAdaptation {
        return PresentationAdaptation(kind: .none)
    }
    
    public static var popover: PresentationAdaptation {
        return PresentationAdaptation(kind: .popover)
    }
    
    public static var sheet: PresentationAdaptation {
        return PresentationAdaptation(kind: .sheet)
    }
    
    public static var fullScreenCover: PresentationAdaptation {
        return PresentationAdaptation(kind: .fullScreenCover)
    }
    
    public static var blurOverFullScreen: PresentationAdaptation {
        return PresentationAdaptation(kind: .fullScreenBlur)
    }
}

extension PresentationAdaptation {
    enum Kind {
        case automatic
        case none
        case popover
        case sheet
        case fullScreenCover
        case fullScreenBlur
    }
}
