// C34D14BDA22A0E125B63D385E626F23D

struct PresentationKind {
    private var tag: PresentationKind.Tag
}

extension PresentationKind {
    enum Tag {
        case none
        case popover
        case sheet
        case fullScreenCover
        case blurOverFullScreen
    }
    
    fileprivate struct Key {
    }
}
