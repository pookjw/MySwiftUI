// C34D14BDA22A0E125B63D385E626F23D
internal import MySwiftUICore

struct PresentationKind {
    private(set) var tag: PresentationKind.Tag
}

extension PresentationKind {
    enum Tag {
        case none
        case popover
        case sheet
        case fullScreenCover
        case blurOverFullScreen
    }
    
    fileprivate struct Key : EnvironmentKey {
        static var defaultValue: PresentationKind.Tag {
            return .none
        }
    }
}

extension EnvironmentValues {
    var presentationKind: PresentationKind.Tag {
        get {
            return self[PresentationKind.Key.self]
        }
        set {
            self[PresentationKind.Key.self] = newValue
        }
    }
}
