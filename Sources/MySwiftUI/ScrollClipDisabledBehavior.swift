struct ScrollClipDisabledBehavior : Equatable {
    static var automatic: ScrollClipDisabledBehavior {
        return ScrollClipDisabledBehavior(role: .automatic)
    }
    
    static var expandsVisibleRegion: ScrollClipDisabledBehavior {
        return ScrollClipDisabledBehavior(role: .expandsVisibleRegion)
    }
    
    private var role: ScrollClipDisabledBehavior.Role
}

extension ScrollClipDisabledBehavior {
    enum Role : Hashable {
        case automatic
        case expandsVisibleRegion
    }
}
