// C34D14BDA22A0E125B63D385E626F23D
internal import MySwiftUICore

struct PresentationKind : Equatable, CustomStringConvertible {
    private(set) var tag: PresentationKind.Tag
}

extension PresentationKind {
    enum Tag : Hashable {
        case none
        case popover
        case sheet
        case fullScreenCover
        case blurOverFullScreen
    }
    
    static var none: PresentationKind {
        assertUnimplemented()
    }
    
    static var popover: PresentationKind {
        assertUnimplemented()
    }
    
    static var sheet: PresentationKind {
        assertUnimplemented()
    }
    
    static var fullScreenCover: PresentationKind {
        assertUnimplemented()
    }
    
    static var blurOverFullScreen: PresentationKind {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
    
    fileprivate struct Key : EnvironmentKey {
        static var defaultValue: PresentationKind.Tag {
            return .none
        }
    }
}

extension EnvironmentValues {
    var presentationKind: PresentationKind {
        get {
            return PresentationKind(tag: self[PresentationKind.Key.self])
        }
        set {
            self[PresentationKind.Key.self] = newValue.tag
        }
    }
}
