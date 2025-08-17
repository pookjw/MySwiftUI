struct InterfaceIdiom {
    private var role: Role
}

extension InterfaceIdiom {
    private enum Role {
        case carPlay
        case clarityUI
        case complication
        case widget
        case mac
        case macCatalyst
        case phone
        case pad
        case tv
        case touchBar
        case watch
        case vision
        case nokit
    }
}
