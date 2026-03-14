internal import MySwiftUICore

struct ActiveContextMenu {
    var id: ViewIdentity = .invalid
    var isPortaled: Bool = false
}

extension ActiveContextMenu: BitwiseCopyable {}
