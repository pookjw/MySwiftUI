struct ScrollClipDisabledBehavior : Equatable {
    private var role: ScrollClipDisabledBehavior.Role
}

extension ScrollClipDisabledBehavior {
    enum Role : Hashable {
        case automatic
        case expandsVisibleRegion
    }
}
